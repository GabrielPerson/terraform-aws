terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  } 

  required_version = ">= 1.2"
} 

provider "aws" {
    region = "us-east-1"
    shared_credentials_files = [ "C:\\Users\\Gabriel\\.aws\\credentials" ]
    shared_config_files = [ "C:\\Users\\Gabriel\\.aws\\config" ]
}


