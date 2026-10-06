resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-infra-bucket-practice"
    tags = {
        Name = "project"
        Environment = var.env
    }
}