terraform {
  backend "s3" {
    bucket = "tad-state"
    key    = "intent_classifier_model/terraform.tfstate"
    region = "us-east-1"
  }
}

