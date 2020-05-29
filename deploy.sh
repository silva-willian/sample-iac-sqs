#!/bin/sh
checkSucessful(){
    if [ $? != 0 ];
    then
        echo "Error Execution"
        exit 1
    fi
}

echo "----------------------------------------"
echo "Environment variables"
printenv
    checkSucessful
echo "----------------------------------------"
terraform init \
    -backend=true \
    -backend-config="bucket=$REMOTE_STATE_BUCKET-$ENV" \
    -backend-config="key=$REMOTE_STATE_FILE" \
    -backend-config="region=$REMOTE_STATE_AWS_REGION"
    checkSucessful
echo "----------------------------------------"
echo "Validating terraform files"
terraform validate
    checkSucessful
echo "----------------------------------------"
echo "Planning..."

terraform plan  \
    -var env="$ENV" \
    -var region="$AWS_REGION" \
    -var product="$PRODUCT" \
    -var createdBy="$CREATED_BY" \
    -var owner="$OWNER" \
    -var project="$PROJECT" \
    -var role="$ROLE" \
    -var fifo="$FIFO" \
    -var delay_seconds="$DELAY_SECONDS" \
    -var max_message_size="$MAX_MESSAGE_SIZE" \
    -var message_retention_seconds="$MESSAGE_RETENTION_SECONDS" \
    -var receive_wait_time_seconds="$RECEIVE_WAIT_TIME_SECONDS" \
    -out="plan.tfout"
    checkSucessful
echo "----------------------------------------"
echo "Applying..."
terraform apply plan.tfout
    checkSucessful
echo "----------------------------------------"
echo "Cleaning up plan file"
rm -rf plan.tfout
    checkSucessful
echo "----------------------------------------"