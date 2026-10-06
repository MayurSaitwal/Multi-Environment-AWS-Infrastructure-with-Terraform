resource "aws_key_pair" "mykey" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("${path.root}/../terra-key-ec2.pub")
    tags = {
        Environment = var.env
    }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
    name = "${var.env}-infra-app-sg"
    description = "A Terraform generated Security Group"
    vpc_id = aws_default_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH Access from anywhere"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = 8090
        to_port = 8090
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound Traffic"
    }
    tags = {
        Name = "${var.env}-infra-app-sg"
    }
}
resource "aws_instance" "my_instance" {
    count = var.instance_count
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.mykey.key_name
    security_groups = [aws_security_group.my_security_group.name]
    root_block_device {
      volume_size = var.env == "prd" ? 20 : 10
      volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-infra-app-instance"
        Environment = var.env
    }
}