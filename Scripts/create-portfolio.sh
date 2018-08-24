#!/usr/bin/env bash

aws servicecatalog create-portfolio --display-name docker-application \
--description "All resources required to create ECS Cluster product and API product" \
--provider-name anshrma@amazon.com \
--idempotency-token `date +%Y-%m-%d-%H-%M-%S`

<<COMMENT

We are interested in PortfolioDetail.ARN = port-kgu2b73u3qsrs
{
    "PortfolioDetail": {
        "ARN": "arn:aws:catalog:us-west-2:256151769638:portfolio/port-kgu2b73u3qsrs",
        "Description": "All resources required to create ECS Cluster product and API product",
        "DisplayName": "docker-application",
        "Id": "port-kgu2b73u3qsrs",
        "CreatedTime": 1485644398.669,
        "ProviderName": "anshrma@amazon.com"
    }
}
COMMENT