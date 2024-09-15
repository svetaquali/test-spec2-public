using Pulumi;
using Pulumi.Automation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        if (args.Length < 3)
        {
            Console.WriteLine("Usage: <stackName> <projectDir> <tags (key1:value1,key2:value2,...)>");
            return;
        }

        var stackName = args[0];  
        var projectDir = args[1]; 
        var tagsArg = args[2];


        var tags = ParseTags(tagsArg);

        var workspace = await LocalWorkspace.CreateAsync(new LocalWorkspaceOptions
        {
            WorkDir = projectDir
        });


        var stack = await WorkspaceStack.CreateOrSelectAsync(stackName, workspace);

        await ApplyAutoTagging(stack);
       
        await stack.UpAsync();
    }
    
    static async Task ApplyAutoTagging(WorkspaceStack stack)
    {
        // Define the resource transformation for auto-tagging
        var resourceTransform = new ResourceTransform(args =>
        {
            if (args.Resource is CustomResource)
            {
                var resourceArgs = args.Args;

                // Add tags (modify as needed)
                resourceArgs["tags"] = new Dictionary<string, object>
                {
                    { "Environment", "Production" },
                    { "Owner", "Shirel" }
                };

                return resourceArgs;
            }

            return null;
        });

        // Apply this transformation across all resources in the stack
        stack.Workspace.StackOptions = new StackOptions
        {
            ResourceTransform = resourceTransform
        };

        Console.WriteLine("Auto-tagging applied via ResourceTransform.");
    }

    static ResourceTransformation AutoTagResources(Dictionary<string, string> tags)
    {
        return args =>
        {
            if (args.Resource.GetType().GetProperty("Tags") != null)
            {
                var inputs = args.Args as IDictionary<string, object>;
                if (inputs != null && inputs.ContainsKey("tags"))
                {
                    var existingTags = inputs["tags"] as IDictionary<string, object>;
                    foreach (var tag in tags)
                    {
                        existingTags[tag.Key] = tag.Value;
                    }
                }
                else
                {
                    inputs["tags"] = tags;
                }
            }
            return new ResourceTransformationResult(args.Resource, args.Args);
        };
    }

    static Dictionary<string, string> ParseTags(string tagsArg)
    {
        var tags = new Dictionary<string, string>();
        var pairs = tagsArg.Split(',');

        foreach (var pair in pairs)
        {
            var keyValue = pair.Split(':');
            if (keyValue.Length == 2)
            {
                tags[keyValue[0].Trim()] = keyValue[1].Trim();
            }
        }

        return tags;
    }
}
