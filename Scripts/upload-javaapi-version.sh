#!/usr/bin/env bash
FILE="$(uuidgen)"
S3Bucket="ecs-service-catalog"
ProductId="prod-val5hp4s5laos"

cfn-flip  ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-java-pipeline.yml  ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-java-pipeline.template
aws s3 cp  ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-java-pipeline.template s3://$S3Bucket/sc-templates/Products/$FILE-product-java-pipeline.template
aws servicecatalog create-provisioning-artifact --product-id $ProductId --parameters Name=`date +%Y-%m-%d-%H-%M-%S`,Description="Update at `date +%Y-%m-%d-%H:%M:%S`",Info={LoadTemplateFromURL=https://s3.amazonaws.com/$S3Bucket/sc-templates/Products/$FILE-product-java-pipeline.template},Type=CLOUD_FORMATION_TEMPLATE --idempotency-token $FILE
