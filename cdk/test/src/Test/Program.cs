using Amazon.CDK;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Test
{
    sealed class Program
    {
        public static void Main(string[] args)
        {
            var app = new App();
            new TestStack(app, "TestStack", new StackProps
            {
                //StackName = args[0]
            });
            app.Synth();
        }
    }
}
