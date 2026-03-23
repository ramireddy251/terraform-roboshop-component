variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "domain_name" {
    default = "ramireddy.co.in"
  
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_type" {
    type = string
    default = "t3a.micro"
  
}
variable "component" {
    type = string
}

variable "app_version" {
    type = string
    default = "v3"
}

variable "rule_priority" {
  
}