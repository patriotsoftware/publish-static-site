# Getting Path of action script
TESTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Required Variables
export BUCKET_NAME=""
export BUCKET_PATH="test/app/path"
export DISTRIBUTION_ID="any-random-id"
export APP_PATH="$TESTS_DIR/test-app"
# Optional Variables that can be added to the 
export ADDITIONAL_BUCKET_ARGS="--dryrun"
export ADDITIONAL_DISTRIBUTION_ARGS=""

$TESTS_DIR/../action.sh

unset BUCKET_NAME
unset BUCKET_PATH
unset DISTRIBUTION_ID
unset APP_PATH
unset ADDITIONAL_BUCKET_ARGS
unset ADDITIONAL_DISTRIBUTION_ARGS