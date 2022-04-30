module "network" {
    source     = "./modules/network/"
    name       = "${var.networkName}"
    platform = "${var.platform}"
    environment = "${var.environment}"
    autoSubnet = "${var.autoSubnet}"
    subnetName = "${var.subnetName}"
    region = "${var.region}"
    cidr = "${var.cidr}"
    regionPrefix = "${var.regionPrefix}"
}

module "compute" {
    count = "${var.computeCount}"
    source = "./modules/compute"
    name   = "${var.computeName}${count.index + 1}"
    platform = "${var.platform}"
    environment = "${var.environment}"
    region = "${var.region}"
    regionPrefix = "${var.regionPrefix}"
    machineType = "${var.machineType}"
    labels = "${var.labels}"
    zone = "${var.zone}"
    image = "${var.image}"
    subnet = module.network.subnetID
    diskName = "${var.diskName}"
    diskCount = "${var.diskCount}"
    diskType = "${var.diskType}"
    diskSize = "${var.diskSize}"
    depends_on = [
        module.network
    ]
}

module "instanceGroup" {
    source = "./modules/instanceGroup"
    name = "${var.instanceGroupName}"
    computeIDS = module.compute.*.computeIDS
    zone = "${var.zone}"
    port = "${var.port}"
    portName = "${var.portName}"
    environment = "${var.environment}"
    region = "${var.region}"
    platform = "${var.platform}"
    regionPrefix = "${var.regionPrefix}"
}

module "firewallRules" {
    source = "./modules/firewallRules"
    name = "${var.firewallRulesName}"
    network = "${var.platform}-${var.networkName}-${var.environment}"
    protocol = "${var.protocol}"
    ports = ["${var.ports}"]
    sourceRange = ["${var.sourceRange}"]
    depends_on = [
        module.network,
        module.compute
    ]
}