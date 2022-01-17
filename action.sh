# Required Environment Variables:
# BUCKET_NAME, BUCKET_PATH, DISTRIBUTION_ID, APP_PATH
# Optional Environment Variables:
# ADDITIONAL_BUCKET_ARGS, ADDITIONAL_DISTRIBUTION_ARGS

# Synchronize App contents to S3 Bucket
aws s3 sync $APP_PATH s3://$BUCKET_NAME/$BUCKET_PATH --delete $ADDITIONAL_BUCKET_ARGS

# Create a Cache Invalidation for CloudFront Distribution
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/$BUCKET_PATH/*" $ADDITIONAL_DISTRIBUTION_ARGS