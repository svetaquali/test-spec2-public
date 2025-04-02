using System.IO;
using Amazon.CDK;
using Constructs;
using System;

namespace Test
{
    public class TestStack : Stack
    {
        internal TestStack(Construct scope, string id, IStackProps props = null) : base(scope, id, props)
        {
            var myEnvVar = System.Environment.GetEnvironmentVariable("MY_ENV_VAR");
            var myParam = new CfnParameter(this, "myParam");
            // The code that defines your stack goes here
            File.WriteAllText(@"C:\Work\output.txt", $"Synth executes code: {myParam.ValueAsString}");
        }
    }
}
