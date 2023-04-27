resource "aws_vpc" "test3" {
    cidr_block      = "172.0.0.0/16"
    tags = {
       Name = "test3"
    }
}
resource "aws_subnet" "testsubnet2" {
    vpc_id = aws_vpc.test3.id
    cidr_block       = "172.0.0.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "subnet2"
    }
}
resource "aws_instance" "tesstinstance3" {
    ami = "ami-08e4e35cccc6189f4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.testsubnet2.id
    tags = {
        Name = "test3"
    }
  }