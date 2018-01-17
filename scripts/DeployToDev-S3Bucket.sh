#!/bin/bash

# This script is used as a placeholder for deploying to DEV tier for the DevOps demo.  It simply copies to S3 Static Website bucket
# Baseline of this script is stored in GitHub under project1

echo "Starting Dev Promotion to S3 Static Website"

echo 'WORKSPACE Variable = ' $WORKSPACE
aws s3 cp $WORKSPACE/html/index.html s3://devopstechtalkleidos-r/KCApp/index.html
aws s3 cp $WORKSPACE/html/index.html s3://devopstechtalkleidos/index.html

echo "Completed copying artifact to S3 Bucket"