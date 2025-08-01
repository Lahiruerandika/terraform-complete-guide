# 🌍 Basic AWS VPC Setup with Terraform

This project demonstrates how to create a basic AWS VPC setup using Terraform. It includes a custom VPC, public and private subnets, an internet gateway, a route table, and a route table association — all built as part of my Terraform learning journey.

---

## ✅ What This Configuration Does

> 📘 This setup is deployed to the `eu-west-1` (Ireland) region using the official AWS provider.

- Creates a **custom VPC**
- Adds one **public** and one **private subnet**
- Attaches an **Internet Gateway** to the VPC
- Creates a **Route Table** with a default internet route
- Associates the public subnet with the route table to allow internet access

---

## 📁 Terraform Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}
