# Build a CI/CD pipeline for ML models in AWS VPC
As AI/ML and DevOps continue to evolve and become standard for most companies, the intersection between the two have become undeniable. This project looks to address the challenge of continuous integration/deployment (CI/CD) of ML models in production by building a pipeline with automated tests that make it easier for continuous changes to these models.

In this project, we build a CI/CD pipeline in AWS Virtual Private Cloud (VPC) for Machine Learning models. We create 3 environments, i.e. development, staging and production environments with HashiCorp Terraform in AWS EC2. We leverage the CircleCI to continuously test and build the ML model application and deliver the successful application into AWS S3 bucket. Then the AWS CodeDeploy managed service will take over the following deployment steps and deploy the successful staging tested application into production with blue/green deployment strategy, in order to reduce the deployment downtime.

## Setup different environments in AWS EC2
Creat the AWS EC2 instances with HashiCorp Terraform, please refer to the link https://github.com/InsightDataScience/aws-ops-insight. Since we will leverage AWS S3, and CodeDeploy managed service, don't forget to attach the required policies to each EC2 instances, you can create an IAM role named `CodeDeployDemo-EC2-Instance-Profile` 

## 



























