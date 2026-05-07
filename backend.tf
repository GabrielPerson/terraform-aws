terraform {
    backend "s3" {
        bucket = "terraform-state-bucket-749097040040-us-east-1-an"
        key    = "terraform-state"
        region = "us-east-1"
    }
}