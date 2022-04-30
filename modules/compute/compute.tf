resource "google_compute_disk" "datadrive" {
    count = "${var.diskCount}"
    name = "${var.platform}-${var.regionPrefix}-${var.name}-${var.diskName}${count.index}-${var.environment}"
    type = "${var.diskType}"
    zone = "${var.zone}"
    size = "${var.diskSize}"
}

resource "google_compute_instance" "compute" {
    name = "${var.platform}-${var.regionPrefix}-${var.name}-${var.environment}"   
    machine_type = "${var.machineType}"
    zone         = "${var.zone}"

    labels = "${var.labels}"

    boot_disk {
        initialize_params {
        image = "${var.image}"
        }
    }
    
    network_interface {
    subnetwork = "${var.subnet}"
    }

    lifecycle {
        ignore_changes = [
            attached_disk
        ]
    }

}

resource "google_compute_attached_disk" "vm_attached_disk" {
    count    = var.diskCount
    disk     = google_compute_disk.datadrive[count.index].id
    instance = google_compute_instance.compute.id
}

output "computeIDS" {
    value = google_compute_instance.compute.self_link
}