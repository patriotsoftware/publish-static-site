# Publish Static Site

This repository is designed to upload a designated static app to an S3 Bucket and invalidate the CloudFront Distribution cache associated with the Bucket. It is done using AWS CLI calls (`aws s3 sync` and `aws cloudfront create-invalidation`).

## Requirements
Infrastructure Requirements:
* An S3 bucket configured to be used by an AWS CloudFront Distribution.
* A CloudFront Distribution utilizing the S3 Bucket from above as the root of the origin.  
Actions Requirements:
In order to use this action, you will need to supply the following Environment Variables:
* bucket_name: The name of the S3 bucket to push to (Required permissions to the bucket: "s3:PutObject", "s3:DeleteObject", "s3:ListBucket").
* bucket_path: Path in the bucket to upload the site to. This is also used as the endpoint for the CloudFront cache invalidation.
* distribution_id: The Distribution ID of the CloudFront Distribution (Required permissions to the distribution: "cloudfront:CreateInvalidation").
* app_path: The path to the compiled app directory on the local machine to be uploaded to S3.
* additional_bucket_args: Any additional arguments desired to be used with the `aws s3 snyc` command.
* additional_distribution_args: Any additional arguments desired to be used with the `aws cloudfront create-invalidation` command.

## Testing
Testing this action is required locally without pushing. For testing, you will need to authenticate with the AWS CLI with credentials that will have access to do the actions mentioned in the Requirements section. There are two required fields to fill out in the `tests/test.sh` script; `BUCKET_NAME` and `DISTRIBUTION_ID`. The bucket synchronization will run a dry run and a dummy cache invalidation will be created for the desired distribution only on a test path.