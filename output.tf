output "Eth0PublicIpAddress" {
	description = "Public ip address resource associated with the first network interface"
	value = {
		"address" : google_compute_address.Eth0PublicIpAddress.address
		"address_type" : google_compute_address.Eth0PublicIpAddress.address_type
	}
}

output "Image" {
	description = "Image resource associated with the virtual machine"
	value = {
		"family" : data.google_compute_image.Image.family
		"name" : data.google_compute_image.Image.name
		"project" : data.google_compute_image.Image.project
	}
}

output "Instance" {
	description = "Instance resource associated with the virtual machine"
	value = {
		"network_ip" : google_compute_instance.Instance.network_interface.0.network_ip 
	}
}