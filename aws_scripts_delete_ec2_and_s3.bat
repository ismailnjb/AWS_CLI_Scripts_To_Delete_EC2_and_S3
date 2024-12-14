@echo off

:: Set variables
SET INSTANCE_ID=i-009810b8e95a87adc 
SET BUCKET_NAME=my-unique-bucket-name-009  

:: Delete EC2 instance
echo Terminating EC2 instance: %INSTANCE_ID%
aws ec2 terminate-instances --instance-ids %INSTANCE_ID%
echo Waiting for EC2 instance to terminate...
aws ec2 wait instance-terminated --instance-ids %INSTANCE_ID%
echo EC2 instance terminated successfully.

:: Delete S3 bucket
echo Emptying S3 bucket: %BUCKET_NAME%
aws s3 rm s3://%BUCKET_NAME% --recursive
echo Deleting S3 bucket: %BUCKET_NAME%
aws s3 rb s3://%BUCKET_NAME% --force
echo S3 bucket deleted successfully.

pause
