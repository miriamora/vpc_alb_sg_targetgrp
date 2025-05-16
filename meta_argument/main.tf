/*
count = 2
depends_on = [resource1, resource2]
for_each 
lifecycle
*/


/*
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

*/

/*
resource "aws_instance" "server_one" {

  count = 2

  ami = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  tags = {
    Name = "dev-server${count.index+1}"
  }
}

resource "aws_user" "user1" {
  name = "cloudadmin"
  depends_on = [ aws_instance.server_one ] //list
}

output "public_ip" {
  value = aws_instance.server_one[*].public_ip
}

*/

/*
variable "typeofinstance" {
  type = list(string)
  default = ["t2.micro", "t2.small"]
}
*/

/*
variable "info" {
  type = map(object({
    ami = string
    instance = string
  }))
  default = {
    dev = {ami: "ami-045269a1f5c90a6a0", instance: "t2.micro"}
    qa = {ami: "ami-045269a1f5c90a6a0fgggrg", instance: "t2.micro"}
  }
}


resource "aws_instance" "s2" {
  for_each = var.info
  ami = each.value.ami
  instance_type = each.value.instance

  tags = {
    Name = each.key
  }
}

*/

/*
variable "region" {
  description = "region to provision in"
  type        = string
  sensitive = true
  #default     = "us-east-1"

}



provider "aws" {
  region  = var.region
  profile = "default"
}


variable "region" {
  description = "region to provision in"
  type        = string
  sensitive = true
  #default     = "us-east-1"

}

*/

/*
provider "aws" {
  region  = "us-east-1"
  alias = "us1"
}

provider "aws" {
  region  = "us-west-1"
  alias = "us2"
}

resource "aws_instance" "server1" {
  provider = aws.us1
  ami = "ami-045269a1f5c90a6a0"
  instance_type = "t2.micro"
}

*/

provider "aws" {
  region = "us-east-1"
  profile = "default"
  #alias = "use-1"
}

resource "aws_instance" "webserver" {
  instance_type = "t2.micro"
  ami = "ami-045269a1f5c90a6a0"
  lifecycle {
    #create_before_destroy = true
    prevent_destroy = false
  }

}