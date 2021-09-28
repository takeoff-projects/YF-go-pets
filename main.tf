terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "docker" {}

provider "google" {
  credentials = file("SAkey.json")

  project = "roi-takeoff-user80"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "go-pets"
  ports {
    internal = 80
    external = 8000
  }
}
