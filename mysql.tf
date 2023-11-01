resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "mydatabase"
  username             = "myrdsuser"
  password             = "myqlSecretPassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids  = [aws_security_group.mysql_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name

  multi_az		= true  # Enable Multi-AZ deployment 
#  skip_final_snapshot = true
}

resource "aws_security_group" "mysql_sg" {
  name_prefix        = "mysql-sg-"
  vpc_id             = module.vpc.vpc_id
  
  # Define inbound/outbound rules as needed
  
   ingress {
     from_port   = 3306
     to_port     = 3306
     protocol    = "tcp"
     cidr_blocks = ["20.0.0.0/16"]  # Allow connections from VPC Private Subnet CIDR
   }
   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]     # Allow outbound traffic
   }
}

resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql-subnet-group"
  subnet_ids = var.private_subnets
}
