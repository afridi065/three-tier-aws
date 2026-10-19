variable "region" { default = "ap-south-1" }
variable "project" { default = "three-tier" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "repo_url" { default = "https://github.com/afridi065/three-tier-aws.git" }

variable "alert_email" {
  type = string
}
