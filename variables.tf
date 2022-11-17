variable "instance_name" {
  type = string
}
variable "ami" {
  type = string
}
variable "instancetype" {
  type = string
}
variable "aws_region" {
  default = "eu-west-1"
}
variable "sg_name" {
  type = string
}
variable "ssmpolicyname" {
  type = string
}
variable "rolename" {
  type = string
}
variable "launch_config_name" {
  type = string
}
variable "cidr1" {
  type = string
}
variable "cidr2" {
  type = string
}
variable "cidr3" {
  type = string
}
variable "cidr4" {
  type = string
}
variable "cidr5" {
type = string
}
variable "cidr_block" {
  type = list(string)
}
