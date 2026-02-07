variable "vpc_id" {
  type = string
}

variable "internal" {
  type    = bool
  default = false
}

variable "subnet_ids" {
  type = list(string)
}

variable "sg_name" {
  type = string
}

variable "alb_name" {
  type = string
}
