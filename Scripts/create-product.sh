#!/usr/bin/env bash

ProductName="java-service"
FILE="$(uuidgen)"

aws servicecatalog create-product --name $ProductName --description "Creates a Java-backed ECS service." \
--support-email jicowan@amazon.com  \
--product-type CLOUD_FORMATION_TEMPLATE --owner jicowan@amazon.com \
--provisioning-artifact-parameters Name=InitialCreation,Description="Initial Creation",\
Info={LoadTemplateFromURL=https://awsdocs.s3.amazonaws.com/servicecatalog/development-environment.template},\
Type=CLOUD_FORMATION_TEMPLATE  --idempotency-token $FILE


<<"COMMENT"

Response of the above looks like below. ProductViewDetail.ProductARN is what we are interested in

{
    "ProductViewDetail": {
        "ProductViewSummary": {
            "ProductId": "prod-5arnnswivyiem",
            "Name": "ecs-cluster",
            "ShortDescription": "ECS Cluster and related resources at host level",
            "Type": "CLOUD_FORMATION_TEMPLATE",
            "Owner": "anshrma@amazon.com",
            "SupportEmail": "anshrma@amazon.com",
            "HasDefaultPath": false,
            "Id": "prodview-4rq2x3zdcs7sw"
        },
        "Status": "CREATED",
        "ProductARN": "arn:aws:catalog:us-west-2:256151769638:product/prod-5arnnswivyiem",
        "CreatedTime": 1485643327.0
    },
    "ProvisioningArtifactDetail": {
        "CreatedTime": 1485643327.0,
        "Name": "InitialCreation",
        "Type": "CLOUD_FORMATION_TEMPLATE",
        "Description": "Initial Creation",
        "Id": "pa-mo5wqzkubdkw6"
    }
}
COMMENT
