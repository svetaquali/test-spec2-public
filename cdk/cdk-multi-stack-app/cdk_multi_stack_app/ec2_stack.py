from aws_cdk import (
    Stack,
    aws_ec2 as ec2,
    CfnOutput,
)
from constructs import Construct

class Ec2Stack(Stack):
    def __init__(self, scope: Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        # Create a VPC
        vpc = ec2.Vpc(self, "MyVpc", max_azs=2)

        # Create a key pair
        key_pair = ec2.CfnKeyPair(self, "MyKeyPair", key_name="my-key-pair")

        # Create an EC2 instance
        instance = ec2.Instance(
            self, "MyEC2Instance",
            instance_type=ec2.InstanceType("t2.micro"),
            machine_image=ec2.AmazonLinuxImage(),
            vpc=vpc,
            key_name=key_pair.key_name
        )

        # Output the public IP of the EC2 instance
        CfnOutput(self, "InstanceId", value=instance.instance_id)
