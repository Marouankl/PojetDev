variable "region" {
  description = "La région AWS à utiliser"
  default     = "eu-west-1"
}

variable "ami" {
  description = "L'AMI à utiliser pour l'instance EC2"
  default     = "ami-0932dacac40965a65"  
}

variable "instance_type" {
  description = "Le type d'instance EC2 à utiliser"
  default     = "t2.micro"
}

variable "key_ssh" {
  description = "Le nom de la clé SSH à utiliser pour l'instance EC2"
  default     = "projetDevops"  
}
