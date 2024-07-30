# Projet Devops

1. git clone : https://github.com/Marouankl/PojetDev
2. cd terraform:

 terrafrom init
 terraform validate
 terraform plan
 terraform apply 

3. cd serverWeb:

npm install 
npm run serve

4. cd projetDevops

Pour connecter avec l'instance sur EC2:
1. ssh -i ~/.ssh/nom-ficher.pem ubuntu@adresse_ip
2. Pour voir l'image docker
#### sudo docker --version
#### sudo docker ps 

#### test :

ping adresse_ip 

## Partie Terraform créer une instance EC2 aws "Ubuntu 22.04" 

Technologier utiliser :Vuejs

### installation :
1 choix 1 virtuel:
activier wsl 
    -> installer ubuntu 22.04
    -> installer amzon cli :sudo apt-get update
                            sudo apt-get install awscli
    -> installer terraform:wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
                        unzip terraform_1.5.6_linux_amd64.zip
                        sudo mv terraform /usr/local/bin/
2 choix local :
    -> installer amzon cli :sudo apt-get update
                            sudo apt-get install awscli
    -> installer terraform:wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
                        unzip terraform_1.5.6_linux_amd64.zip
                        sudo mv terraform /usr/local/bin/




#### configuration Terraform : 

##### 1. main.tf 
##### 2. varaible.tf 
##### 3. output.tf

1. main.tf 
 provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block  = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "my_rta" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0abcdef1234567890" # Remplacez par l'AMI d'Ubuntu 22.04
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  key_name       = file_name
  tags = {
    Name = "MyInstance"
  }
}

output "instance_ip" {
  value = aws_instance.my_instance.public_ip
}
2. varaible.tf 
 variable "aws_region" {
  default = "eu-west-1"
}
3. output.tf
 output "instance_ip" {
  description = "L'adresse IP publique de l'instance EC2"
  value       = aws_instance.my_instance.public_ip
}

 

####  configuration ansible : 
##### 1. install_docker.yml
- name: Installer Docker
  hosts: all
  become: yes
  tasks:
    - name: Mettre à jour les paquets
      apt:
        update_cache: yes
    - name: Installer Docker
      apt:
        name: docker.io
        state: present
    - name: Démarrer et activer le service Docker
      service:
        name: docker
        state: started
        enabled: yes

##### 2. install_docker.yml

- name: Déployer l'application Vue.js
  hosts: all
  become: yes
  tasks:
    - name: Construire l'image Docker
      docker_image:
        name: vue_app
        build:
          path: /path/to/vue/app
    - name: Exécuter le conteneur Docker
      docker_container:
        name: vue_app_container
        image: vue_app
        state: started
        ports:
          - "80:80"
#####  3. inventory.ini
[web]
adresse ip ansible_connection=ssh : pour connecter avec ansible
[web:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=chemin vers le file.pem




