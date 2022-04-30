resource "google_compute_instance_group" "webservers" {
    name        = "${var.platform}-${var.regionPrefix}-${var.name}-${var.environment}"

    instances = "${var.computeIDS}"

    named_port {
        name = "${var.portName}"
        port = "${var.port}"
    }

    zone = "${var.zone}"
}