terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_apprunner_auto_scaling_configuration_version" "dhru" {                            
  auto_scaling_configuration_name = "dhru"
  # scale between 1-5 containers
  min_size = 1
  max_size = 5
}

resource "aws_apprunner_service" "dhru" {                            
  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.dhru.arn                          
         
  service_name = "dhru"                          
                            
  source_configuration {                              
    image_repository {                                
      image_configuration {                                  
        port = "80"                                
      }                                
      
      image_identifier       = "530211691714.dkr.ecr.ap-northeast-1.amazonaws.com/koel:latest"                                
      image_repository_type = "ECR"                              
    }                          
                              
    auto_deployments_enabled = false                            
  }                          
}
output "apprunner_service_dhru" {                            
  value = aws_apprunner_service.dhru                          
}

