rg_name = "tf test deployment"

nsg_security_rules = {
    allowSSH = {
        description = "Tillater SSH inn til VM-en",
        protocol = "Tcp",
        sourcePortRange = "*",
        destinationPortRange = "22",
        sourceAddressPrefix = "*",
        destinationAddressPrefix = "*",
        access = "Allow",
        priority = "123",
        direction = "Inbound"
    },
    allowHTTP = {
        description = "Tilatter trafikk til og fra webserver",
        protocol = "Tcp",
        sourcePortRange = "*",
        destinationPortRange = "80",
        sourceAddressPrefix = "*",
        destinationAddressPrefix = "*",
        access = "Allow",
        priority = "124",
        direction = "Inbound"
    }
}