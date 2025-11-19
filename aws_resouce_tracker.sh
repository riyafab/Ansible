#!/bin/bash



# Author: Riya
# Date:   18/11/2025
# Version: v1

######
# AWS Resource Tracker Script
# Tracks:
# 1. S3 Buckets
# 2. EC2 Instances
# 3. Lambda Functions
# 4. IAM Users
######

set -x

OUTPUT="resourceTracker.txt"
: > $OUTPUT      # clear old output

echo "Printing S3 bucket list..." | tee -a $OUTPUT
aws s3 ls >> $OUTPUT

echo -e "\nPrinting EC2 instances list..." | tee -a $OUTPUT
aws ec2 describe-instances \
  | jq -r '.Reservations[].Instances[].InstanceId' >> $OUTPUT

echo -e "\nPrinting Lambda functions list..." | tee -a $OUTPUT
aws lambda list-functions >> $OUTPUT 
  

echo -e "\nPrinting IAM users list..." | tee -a $OUTPUT
aws iam list-users >> $OUTPUT

