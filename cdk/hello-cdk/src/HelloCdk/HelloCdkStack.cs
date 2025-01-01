using Amazon.CDK;
using Constructs;
using Amazon.CDK.AWS.Lambda;

namespace HelloCdk
{
    public class HelloCdkStack : Stack
    {
        internal HelloCdkStack(Construct scope, string id, IStackProps props = null) : base(scope, id, props)
        {
            var myFunction = new Function(this, "HelloWorldFunction", new FunctionProps
            {
                Runtime = Runtime.NODEJS_20_X, // Provide any supported Node.js runtime
                Handler = "index.handler",
                Code = Code.FromInline(@"
                  exports.handler = async function(event) {
                    return {
                      statusCode: 200,
                      body: JSON.stringify('Hello CDK!'),
                    };
                  };
                "),
            });
            
            var myFunctionUrl = myFunction.AddFunctionUrl(new FunctionUrlOptions
            {
                AuthType = FunctionUrlAuthType.NONE
            });
            
            new CfnOutput(this, "myFunctionUrlOutput", new CfnOutputProps
            {
                Value = myFunctionUrl.Url
            });
        }
    }
}
