resource "google_compute_network" "network" {
    name                    = "${var.platform}-${var.name}-${var.environment}"
    auto_create_subnetworks = "${var.autoSubnet}"
}

resource "google_compute_subnetwork" "subnet" {
    name          = "${var.subnetName}"
    ip_cidr_range = "${var.cidr}"
    region        = "${var.region}"
    network       = google_compute_network.network.id
}

output "subnetID" {
    value = google_compute_subnetwork.subnet.id
}