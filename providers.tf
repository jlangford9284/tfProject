terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project = "tfproject-348519"
  region  = "europe-west2"
  zone    = "europe-west2-b"
}

terraform {
    backend "gcs" {}
}