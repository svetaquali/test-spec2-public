using Pulumi;
using Pulumi.Aws.Ec2;
using Pulumi.Aws.Ec2.Inputs;
using Pulumi.Aws.S3;
using System.Collections.Generic;
using System.Reflection;

class MyStack : Stack
{
    public MyStack() : base(
        new StackOptions
        {
            ResourceTransformations =
            {
                RegisterAutoTags(new Dictionary<string, string>
                {
                    {"Owner", "Shirel"}
                }),
            },
        }
    )
    {
        var bucket = new Bucket("my-bucket", new BucketArgs());
        
        var grp = new SecurityGroup("web-secgrp", new SecurityGroupArgs {
            Ingress = {
                new SecurityGroupIngressArgs {
                    Protocol = "tcp", FromPort = 80, ToPort = 80, CidrBlocks = {"0.0.0.0/0"},
                },
            }
        });

        var srv = new Instance("web-server-www", new InstanceArgs {
            InstanceType = "t2.micro",
            Ami = "ami-0c55b159cbfafe1f0",
            VpcSecurityGroupIds = { grp.Id },
        });
    }
    
    static ResourceTransformation RegisterAutoTags(Dictionary<string, string> autoTags) {
        return args => {
            var tagp = args.Args.GetType().GetProperty("Tags");
            if (tagp != null) {
                var tags = (InputMap<string>)tagp.GetValue(args.Args, null) ?? new InputMap<string>();
                foreach (var tag in autoTags) {
                    tags[tag.Key] = tag.Value;
                }
                tagp.SetValue(args.Args, tags, null);
                return new ResourceTransformationResult(args.Args, args.Options);
            }
            return null;
        };
    }
}
