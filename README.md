# Build a CI/CD pipeline for ML models in AWS VPC
As AI/ML and DevOps continue to evolve and become standard for most companies, the intersection between the two have become undeniable. This project looks to address the challenge of continuous integration/deployment of ML models in production by building a pipeline with automated tests that make it easier for continuous changes to these models.

In this project, we build a CI/CD pipeline in AWS Virtual Private Cloud for Machine Learning models. We create 3 environments, i.e. development, staging and production environments with HashiCorp Terraform in AWS EC2. We leverage the CircleCI to continuously test and build the ML model application and deliver the successful application into AWS S3 bucket. Then the AWS CodeDeploy managed service will take over the following deployment steps and deploy the successful staging tested application into production with blue/green deployment strategy, in order to reduce the deployment downtime.

## What are the (quantitative) specifications/constraints for this project?
Non-containerization makes the scalability complicated.

