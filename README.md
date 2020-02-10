# Build a CI/CD pipeline for ML models in AWS VPC
As AI/ML and DevOps continue to evolve and become standard for most companies, the intersection between the two have become undeniable. This project looks to address the challenge of continuous integration/deployment (CI/CD) of ML models in production by building a pipeline with automated tests that make it easier for continuous changes to these models.

In this project, we build a CI/CD pipeline in AWS Virtual Private Cloud (VPC) for Machine Learning models. We create 3 environments, i.e. development, staging and production environments with HashiCorp Terraform in AWS EC2. We leverage the CircleCI to continuously test and build the ML model application and deliver the successful application into AWS S3 bucket. Then the AWS CodeDeploy managed service will take over the following deployment steps and deploy the successful staging tested application into production with blue/green deployment strategy, in order to reduce the deployment downtime.

## Setup different environments in AWS EC2
Creat the AWS EC2 instances with HashiCorp Terraform, please refer to the link https://github.com/InsightDataScience/aws-ops-insight. Since we will leverage AWS S3, and CodeDeploy managed service, don't forget to attach the required IAM roles (policies) to each EC2 instances, you can create an IAM role named `CodeDeployDemo-EC2-Instance-Profile`, under this IAM role, create a policy named `PoliciesCodeDeployDemo-EC2-Permissions` with the following contend:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::replace-with-your-s3-bucket-name/*",
                "arn:aws:s3:::aws-codedeploy-us-east-2/*",
                "arn:aws:s3:::aws-codedeploy-us-east-1/*",
                "arn:aws:s3:::aws-codedeploy-us-west-1/*",
                "arn:aws:s3:::aws-codedeploy-us-west-2/*",
                "arn:aws:s3:::aws-codedeploy-ca-central-1/*",
                "arn:aws:s3:::aws-codedeploy-eu-west-1/*",
                "arn:aws:s3:::aws-codedeploy-eu-west-2/*",
                "arn:aws:s3:::aws-codedeploy-eu-west-3/*",
                "arn:aws:s3:::aws-codedeploy-eu-central-1/*",
                "arn:aws:s3:::aws-codedeploy-ap-east-1/*",
                "arn:aws:s3:::aws-codedeploy-ap-northeast-1/*",
                "arn:aws:s3:::aws-codedeploy-ap-northeast-2/*",
                "arn:aws:s3:::aws-codedeploy-ap-southeast-1/*",
                "arn:aws:s3:::aws-codedeploy-ap-southeast-2/*",
                "arn:aws:s3:::aws-codedeploy-ap-south-1/*",
                "arn:aws:s3:::aws-codedeploy-sa-east-1/*"
            ]
        }
    ]
}
```
## 



























