terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  credentials = file("roi-takeoff-user80-f7b109b0d624.json")

  project = var.project_id
  region  = var.region
  zone    = var.zone
}
