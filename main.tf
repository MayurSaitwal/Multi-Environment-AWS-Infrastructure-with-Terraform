module "dev-infra" {
  source         = "./infra-app"
  env            = "dev"
  instance_count = 2
  ami            = "ami-0aba19e56f3eaec05"
  instance_type  = "t3.micro"

}

module "stg-infra" {
  source         = "./infra-app"
  env            = "stg"
  instance_count = 1
  ami            = "ami-0aba19e56f3eaec05"
  instance_type  = "t3.small"

}

module "prd-infra" {
  source         = "./infra-app"
  env            = "prd"
  ami            = "ami-0aba19e56f3eaec05"
  instance_count = 1
  instance_type  = "t3.micro"

}