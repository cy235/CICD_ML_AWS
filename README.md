# Build a CI/CD pipeline for ML models in AWS VPC
As AI/ML and DevOps continue to evolve and become standard for most companies, the intersection between the two have become undeniable. This project looks to address the challenge of continuous integration/deployment (CI/CD) of ML models in production by building a pipeline with automated tests that make it easier for continuous changes to these models.

In this project, we build a CI/CD pipeline in AWS Virtual Private Cloud (VPC) for Machine Learning models. We create 3 environments, i.e. development, staging and production environments with HashiCorp Terraform in AWS EC2. We leverage the CircleCI to continuously test and build the ML model application and deliver the successful application into AWS S3 bucket. Then the AWS CodeDeploy managed service will take over the following deployment steps and deploy the successful staging tested application into production with blue/green deployment strategy, in order to reduce the deployment downtime.

## Setup different environments in AWS EC2
The steps of creating the AWS EC2 instances with HashiCorp Terraform can be referred to the link https://github.com/InsightDataScience/aws-ops-insight. Since we will leverage AWS S3, and CodeDeploy managed service, don't forget to attach the required IAM roles (policies) to each EC2 instances, you can create an IAM role named `CodeDeployDemo-EC2-Instance-Profile`, under this IAM role, create a policy named `PoliciesCodeDeployDemo-EC2-Permissions` with the following content:
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

In addtion, we need to install the required tools, packages and especially CodeDeploy agent for each EC2 instance by executing the following commmand lines:

```
#!/bin/bash 
sudo apt-get -y update 
sudo apt-get -y install ruby 
sudo apt-get -y install wget 
cd /home/ubuntu 
wget https:// aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install 
sudo chmod +x ./install 
sudo ./install auto 
sudo apt-get remove docker docker-engine docker.io 
sudo apt install docker.io -y 
sudo apt install python3-pip -y 
sudo service codedeploy-agent start
sudo service codedeploy-agent status
```

Notice that the operating system of our employed EC2 instances is free tier Ubuntu Server 16.04 LTS (HVM), you can also select your prefered server but remember change the above command lines accordingly.

## Setup CI/CD tools
In this project, we employ the CircleCI for continuously builing/testing the ML model application because CircleCI is free and it runs fast due to its intrinsinc caching mechanism. While for continunous deployment part, since the CircleCI is not able to deploy the ML model application into AWS VPC directly, we need to leverage the AWS CodeDeploy to do this job.

First, sign up your CircleCI with github account, then add your project in github to CircleCI, and enter your AWS access ID and secret access ID in `AWS permission`.

In the root path your github project, there should be a file named `config.yml` in a hidden folder named `.circleci`. whenever there is a commit in your project in github, `config.yml` is responsible for executing building and testing module and pushing the successful built ML model into AWS S3 bucket. Also, there should be another file named `appspec.yml`, which is responsible for deploying the ML application from the AWS S3 bucket into the target (thoese installed with codedeploy agent) EC2 instances. 




























