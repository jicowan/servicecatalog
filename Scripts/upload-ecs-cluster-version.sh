#!/usr/bin/env bash

#ECS CLUSTER
FILE="$(uuidgen)"
S3Bucket="ecs-service-catalog"
ProductId="prod-ddw4xw5q2tqne"

cfn-flip ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-ecs-cluster.yml ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-ecs-cluster.template

aws s3 cp ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-ecs-cluster.template s3://$S3Bucket/sc-templates/Products/$FILE-product-ecs-cluster.template

rm ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-ecs-cluster.template
rm ~/GitProjects/ProServe_ECS_ServiceCatalog/Products/product-ecs-cluster.template-e

aws servicecatalog create-provisioning-artifact --product-id $ProductId --parameters Name=`date +%Y-%m-%d-%H-%M-%S`,Description="Update at `date +%Y-%m-%d-%H:%M:%S`",Info={LoadTemplateFromURL=https://s3.amazonaws.com/$S3Bucket/sc-templates/Products/$FILE-product-ecs-cluster.template},Type=CLOUD_FORMATION_TEMPLATE --idempotency-token $FILE
