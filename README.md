# Use Amazon Code* Products and Service Catalog for CI/CD of Dockerized application on ECS


This sample demonstrate how to achieve [continuous deployment][continuous-deployment] of an application to Amazon ECS using AWS CodePipeline, AWS CodeBuild, and AWS CloudFormation. With continuous deployment, software revisions are deployed to a production environment automatically without explicit approval from a developer, making the entire software release process automated.

Launching this AWS CloudFormation stack provisions a continuous deployment process that uses AWS CodePipeline to monitor a GitHub repository for new commits, AWS CodeBuild to create a new Docker container image and to push it into Amazon ECR, and AWS CloudFormation to deploy the new container image to production on Amazon ECS.

Wrapping up these templates with AWS Service Catalog enables to create a two custom products customized for the delivery within the context of organization.


## Architecture

This sample provisions the Application Architecture as described below

[![](Images/architecture.png)][architecture]

## Running the example

Please refer the deployment guide sent.


[architecture]: Images/architecture.png
[continuous-deployment]: https://aws.amazon.com/devops/continuous-delivery/
