resource "google_compute_firewall" "rules" {
    name        = "${var.name}"
    network     = "${var.network}"

    allow {
        protocol  = "${var.protocol}"
        ports     = "${var.ports}"
    }

    source_ranges = "${var.sourceRange}"
}