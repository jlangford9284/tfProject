terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("C:\\Users\\Jordan\\Desktop\\TFProject\\credentials\\tfproject-348519-dc9d37703b87.json")

  project = "tfproject-348519"
  region  = "europe-west2"
  zone    = "europe-west2-b"
}