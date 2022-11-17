resource "aws_security_group" "rdsSG" {
name = "rdsSG"
vpc_id = aws_vpc.webvpc.id

ingress {
from_port = "3306"
to_port = "3306"
protocol = "tcp"
security_groups = [aws_security_group.WebserverSG.id] 
}
}

resource "aws_db_subnet_group" "subnetrds" {
name = "subnetrds"
subnet_ids = [aws_subnet.prva.id, aws_subnet.prvb.id]
tags = {
Name = "subnetrds"
}
}

resource "aws_db_instance" "webdb" {
allocated_storage = 10
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t3.micro"
db_name = "mydb"
username = "wordpress"
password = "wordpress"
parameter_group_name = "default.mysql5.7"
db_subnet_group_name = aws_db_subnet_group.subnetrds.id
vpc_security_group_ids = [aws_security_group.rdsSG.id]
skip_final_snapshot = true
}
