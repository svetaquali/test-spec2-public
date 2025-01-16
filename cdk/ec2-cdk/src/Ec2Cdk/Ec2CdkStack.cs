using Amazon.CDK;
using Amazon.CDK.AWS.EC2;
using Constructs;

namespace Ec2Cdk
{
    public class Ec2CdkStack : Stack
    {
        internal Ec2CdkStack(Construct scope, string id, IStackProps props = null) : base(scope, id, props)
        {
            // Create a VPC
            var vpc = new Vpc(this, "MyVpc", new VpcProps
            {
                MaxAzs = 2 // Use 2 Availability Zones
            });

            // Create a security group
            var securityGroup = new SecurityGroup(this, "MySecurityGroup", new SecurityGroupProps
            {
                Vpc = vpc,
                Description = "Allow SSH and HTTP traffic",
                AllowAllOutbound = true
            });

            // Allow inbound SSH (port 22) and HTTP (port 80)
            securityGroup.AddIngressRule(Peer.AnyIpv4(), Port.Tcp(22), "Allow SSH access");
            securityGroup.AddIngressRule(Peer.AnyIpv4(), Port.Tcp(80), "Allow HTTP access");

            // Define the Amazon Machine Image (AMI)
            var ami = MachineImage.LatestAmazonLinux2();

            // Create an EC2 instance
            var instance = new Instance_(this, "MyInstance", new InstanceProps
            {
                Vpc = vpc,
                InstanceType = InstanceType.Of(InstanceClass.T2, InstanceSize.MICRO),
                MachineImage = ami,
                SecurityGroup = securityGroup
            });
            
            // Output the instance's public IP
            new CfnOutput(this, "InstancePublicIp", new CfnOutputProps
            {
                Value = instance.InstancePublicIp,
                Description = "Public IP address of the instance",
                ExportName = "InstancePublicIp"
            });

            // Output the instance's private IP
            new CfnOutput(this, "InstancePrivateIp", new CfnOutputProps
            {
                Value = instance.InstancePrivateIp,
                Description = "Private IP address of the instance",
                ExportName = "InstancePrivateIp"
            });
        }
    }
}
