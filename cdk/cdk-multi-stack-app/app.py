from aws_cdk import App
from cdk_multi_stack_app.ec2_stack import Ec2Stack
from cdk_multi_stack_app.s3_stack import S3Stack

app = App()

# Create the EC2 stack
ec2_stack = Ec2Stack(app, "Ec2Stack", env=cdk.Environment(account='046086677675', region='eu-west-1'))

# Create the S3 stack
s3_stack = S3Stack(app, "S3Stack", env=cdk.Environment(account='046086677675', region='eu-west-1'))

app.synth()
