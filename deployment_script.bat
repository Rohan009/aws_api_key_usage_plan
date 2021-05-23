echo Setting local properties for deployment....

SET STACK_NAME=test-usage-plan-api-key-stack
SET S3_FOLDER=GreenPath/%DEPLOYMENT_ENVIRONMENT%/code/
SET S3_BUCKET = test_bucket
SET API_REQUESTS_ALLOWED = 100
SET iamRole = LAMBDA_ROLE_ARN
echo Local properties for deployment set successfully....

echo #########################################################################


echo Deploying SAM application....
sam deploy --debug --capabilities CAPABILITY_IAM^
    --template-file egps-greenpath-vfc-template.yaml^
    --s3-bucket %S3_BUCKET% ^
    --region %AWS_REGION% --stack-name %STACK_NAME%^
    --parameter-overrides^
    deploymentRegion=%AWS_REGION% apiRequestsAllowed=%API_REQUESTS_ALLOWED%^
    s3Bucket=%S3_BUCKET%^
    deploymentEnvironment=%DEPLOYMENT_ENVIRONMENT% iamRole=%IAM_ROLE% &^
echo ############################################################################## &^
echo Deployment complete, please check command prompt logs for result! &^
cmd /k