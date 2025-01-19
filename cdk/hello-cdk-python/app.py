#!/usr/bin/env python3
import os

import aws_cdk as cdk

from hello_cdk.hello_cdk_stack import HelloCdkStack

app = cdk.App()
HelloCdkStack(app, "HelloCdkStack",
              env=cdk.Environment(account='046086677675', region='eu-west-1'),
              )

app.synth()