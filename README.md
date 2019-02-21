# EMFIT QS Lambda
A lamda that downloads data from the emfit qs api and stores the file in an S3 Bucket

## Requirements
* yarn for building
* terraform for deployment

## yarn commands
* "yarn transpile" compiles up the javascript
* "yarn prebuild" clean out builds and prepares for a fresh build
* "yarn build" zip up the lambda and modules for deployment
* "yarn deploy-init" initializes terraform, you should only need to do this once
* "yarn predeploy" an optional command to see what the deploy will do
* "yarn deploy" executes the actual command to apply the terraform plan
