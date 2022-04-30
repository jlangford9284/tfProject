#Platform 
region = "europe-west2"
zone = "europe-west2-a"
regionPrefix = "ew"
platform = "jl"
environment = "p"

#Network
networkName = "network"
subnetName = "webserver-subnet"
cidr = "10.0.1.0/28"
autoSubnet = false

#Compute Instance 
computeName = "compute0"
computeCount = 2
machineType = "e2-small"
image = "windows-server-2022-dc-v20220414"
diskName = "data0"
diskCount = 1
diskType = "pd-balanced"
diskSize = "100"
labels = {
        environment = "techblog"
    }

#Instance Group
instanceGroupName = "webservers-frontend"
port = "443"
portName = "https"

#Firewall Rules
firewallRulesName = "webservers-office-allow"
protocol = "tcp"
ports = "3389"
sourceRange = "80.193.23.74/32"