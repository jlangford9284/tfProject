resource "google_compute_instance_group" "webservers" {
    name        = "${var.name}"

    instances = "${var.computeIDS}"

    named_port {
        name = "${var.portName}"
        port = "${var.port}"
    }

    zone = "${var.zone}"
}