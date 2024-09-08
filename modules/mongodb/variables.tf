variable "namespace" {
  description = "The namespace for MongoDB"
  type        = string
}

variable "replicas" {
  description = "The number of MongoDB replicas"
  type        = number
}
