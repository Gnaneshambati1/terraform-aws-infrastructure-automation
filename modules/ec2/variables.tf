variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Web server security group ID"
  type        = string
}

variable "user_data_path" {
  description = "Path to the EC2 user data script"
  type        = string
}

variable "root_volume_size" {
  description = "EC2 root volume size in GB"
  type        = number
  default     = 8
}

variable "iam_instance_profile" {
  description = "IAM instance profile name to attach to the instance"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default     = {}
}
