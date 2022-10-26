 terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 4.0"
     }
   }
 }



resource "aws_apprunner_service" "example" {

  service_name = "example"

  source_configuration {
    authentication_configuration{
      access_role_arn=  "arn:aws:iam::530211691714:role/service-role/koel-2"
}
    
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "530211691714.dkr.ecr.ap-northeast-1.amazonaws.com/koel-2@sha256:fdfbc3c52fe6f9cdd2f2963dc8df3f2f9bad5b26d0d8208d22d999f44c778d37"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = false
    
 
  }

  tags = {
    Name = "example-apprunner-service"
  }
}

