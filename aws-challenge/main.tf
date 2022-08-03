resource "aws_key_pair" "citadel-key" {
  key_name   = "citadel"
  public_key = file("/root/terraform-challenges/project-citadel/.ssh/ec2-connect-key.pub")
}


resource "aws_eip" "eip" {
  instance = "${aws_instance.citadel.id}"
  vpc      = true
  provisioner "local-exec" {
    command = "echo ${self.public_dns} >> /root/citadel_public_dns.txt"
  }
}

resource "aws_instance" "citadel" {
    ami = "ami-06178cf087598769c"
    instance_type = "m5.large"
}