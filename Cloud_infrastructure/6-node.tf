

resource "aws_instance" "node" {
  ami           = data.aws_ami.ubuntu.id
  count         = 3  # Set the desired number of instances
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_ap_southeast_1a.id
  key_name = "infosec0"
  security_groups = [aws_security_group.nodes.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo ufw enable
              sudo ufw allow ssh
              sudo ufw allow 8333
              sudo apt install openssh-server -y
              sudo systemctl enable ssh
              sudo snap install bitcoin-core
              bitcoin-core.daemon -prune=550
              EOF

  tags = {
    Name = "bitcoind-instance-${count.index + 1}"
  }
}

output "public_ip" {
  value = aws_instance.node[*].public_ip
}


data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        # values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

# output "ubuntu_node" {
#   value = data.aws_ami.ubuntu
# }