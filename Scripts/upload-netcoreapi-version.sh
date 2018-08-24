#!/usr/bin/env bash
FILE="$(uuidgen)"
S3Bucket="256151769638-cft"
ProductId="prod-ddauarmp5u5do"

cfn-flip Products/product-netcore-pipeline.yml Products/product-netcore-pipeline.template
sed -i -e 's/sc-templates\/microservice.yml/sc-templates\/Templates\/'$FILE'-microservice.yml/' Products/product-netcore-pipeline.template
aws s3 cp Products/product-netcore-pipeline.template s3://$S3Bucket/sc-templates/Products/$FILE-product-netcore-pipeline.template
aws s3 cp Templates/microservice.yml s3://$S3Bucket/sc-templates/Templates/$FILE-microservice.yml
aws servicecatalog create-provisioning-artifact --product-id $ProductId --parameters Name=`date +%Y-%m-%d-%H-%M-%S`,Description="Update at `date +%Y-%m-%d-%H:%M:%S`",Info={LoadTemplateFromURL=https://s3-us-west-2.amazonaws.com/$S3Bucket/sc-templates/Products/$FILE-product-netcore-pipeline.template},Type=CLOUD_FORMATION_TEMPLATE --idempotency-token $FILE