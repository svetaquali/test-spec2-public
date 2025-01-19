import aws_cdk as core
import aws_cdk.assertions as assertions

from ec2_cdk_python.ec2_cdk_python_stack import Ec2CdkPythonStack

# example tests. To run these tests, uncomment this file along with the example
# resource in ec2_cdk_python/ec2_cdk_python_stack.py
def test_sqs_queue_created():
    app = core.App()
    stack = Ec2CdkPythonStack(app, "ec2-cdk-python")
    template = assertions.Template.from_stack(stack)

#     template.has_resource_properties("AWS::SQS::Queue", {
#         "VisibilityTimeout": 300
#     })
