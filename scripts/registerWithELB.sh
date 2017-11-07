#!/bin/bash

# This script registers instance with ELB

wget –q http://169.254.169.254/latest/meta-data/instance-id
export myinstance=`cat instance-id`
aws elb register-instances-with-load-balancer --load-balancer-name KCApp-ELB --instances $myinstance --region us-east-1