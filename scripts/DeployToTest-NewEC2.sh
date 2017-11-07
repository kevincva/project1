#!/bin/bash

# This script is used as a placeholder for deploying to TEST tier for the DevOps demo.
# This downloads artifact from S3 (stored when build completed) and starts a new server.
# Within the CloudFormation Userdata, the new server downloads new artifact from S3
# Baseline of this script is stored in GitHub under project1

echo "Starting TEST Promotion Process"
echo ""
whoami
id
echo ""
echo "Downloading artifact from S3"
cd ~e2-user
aws s3 cp  s3://devopstechtalkleidos-r/KCApp/index.html .
echo "Initiating new server stack"
aws cloudformation create-stack --stack-name KCAppStack_`date +%m%d%Y%H%M%S` --template-body https://s3.amazonaws.com/devopstechtalkleidos-r/KCApp/CFN-KCHelloApp.yml --parameters ParameterKey=KeyName,ParameterValue=kevinchinekypair ParameterKey=Mission,ParameterValue=myDEV ParameterKey=NameTagValue,ParameterValue=KCApp-`date +%m%d%Y%H%M%S` ParameterKey=Network,ParameterValue=myNetwork ParameterKey=ProjectTag,ParameterValue=KCApp ParameterKey=Tier,ParameterValue=DEV --region=us-east-1

echo "Completed TEST Promotion Process"