variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.micro"
  
}

variable "server_port" {
  description = "The port on which the server will listen"
  type        = number
  default     = 80
  
}

variable "security_group_id" {
  description = "ID of the security group to attach to the insta"
  type        = string
  
}

variable "subnet_id" {
  description = "ID of the subnet to launch the instance in"
  type        = string
  
}
