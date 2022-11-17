region = "eu-west-1"

ami = "ami-0ee415e1b8b71305f"

instancetype = "t2.micro"

instance_name = "webserver"

cidr1 = "10.0.0.0/18"

cidr2 = "10.0.64.0/18"

cidr3 = "10.0.128.0/18"

cidr4 = "10.0.192.0/19"

cidr5 = "10.0.224.0/19"

cidr_block = ["0.0.0.0/0"]

sg_name = "WebserverSG"

ssmpolicyname      = "ssmpolicy"
rolename           = "ssmrole"
launch_config_name = "launch_config"
