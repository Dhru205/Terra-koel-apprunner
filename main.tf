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
    
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "530211691714.dkr.ecr.ap-northeast-1.amazonaws.com/koel:latest"
      image_repository_type = "ECR_PUBLIC"
    }
    auto_deployments_enabled = false
  }

  tags = {
    Name = "example-apprunner-service"
  }
}

