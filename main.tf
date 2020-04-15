provider "aws" {
  access_key = "AKIA6CHFNU6SK45B546H"
  secret_key = "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"
  region = "us-east-1"
}
module "create_instance" {
  source = "/home/ubuntu/instance/module/ques"
  user_data = "${file("script.sh")}"
  policy = "${file("s3.json")}"
}

