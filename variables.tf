variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	type = string
}

variable "Eth0SubnetName" {
	description = "Name of the subnet associated with the first network interface"
	type = string
}

variable "Eth0VpcNetworkName" {
	description = "Name of the virtual private cloud associated with the first network interface"
	type = string
}

variable "Eth1NicType" {
	default = "VIRTIO_NET"
	description = "Type of virtual NIC associated with this interface"
	type = string
	validation {
		condition = can(regex("GVNIC", var.Eth1NicType)) || can(regex("VIRTIO_NET", var.Eth1NicType))
		error_message = "Eth1NicType must be one of (DEFAULT | VIRTIO_NET)"
	}
}

variable "Eth1PrivateIpAddress" {
	default = "10.0.2.15"
	type = string
}

variable "Eth1PrivateIpAliases" {
	default = "/28"
	type = string
}

variable "Eth1SubnetName" {
	description = "Name of the subnet associated with the second network interface"
	type = string
}

variable "Eth1VpcNetworkName" {
	description = "Name of the virtual private cloud associated with the second network interface"
	type = string
}

variable "InstanceId" {
	default = "agent"
	description = "Id of the instance of this module that ensures uniqueness"
	type = string
}

variable "InstanceTotalEgressBandwidthTier" {
	default = "DEFAULT"
	description = "Level of egress bandwidth tier associated with this instance"
	type = string
	validation {
		condition = can(regex("DEFAULT", var.InstanceTotalEgressBandwidthTier)) || can(regex("TIER_1", var.InstanceTotalEgressBandwidthTier))
		error_message = "InstanceTotalEgressBandwidthTier must be one of (DEFAULT | TIER_1)"
	}
}

variable "MachineType" {
	default = "c2-standard-30"
	description = "Designation for set of resources available to VM"
	type = string
	validation {
		condition = can(regex("c2-standard-30", var.MachineType)) || can(regex("c2-standard-60", var.MachineType))
		error_message = "MachineType must be one of (c2-standard-30 | c2-standard-60) types."
	}
}

variable "MarketplaceImageName" {
	default = "ixia-cloud-test-appliance-11-00-4444-444"
	description = "Identifier for image"
	type = string
}

variable "MarketplaceImageProjectId" {
	default = "mpi-keysight-public"
	description = "Globally unique identifier for image source project"
	type = string
}

variable "NetworkTargetTags" {
	default = [
		"ixnetwork-agent"
	]
	description = "Network tags make firewall rules and routes applicable to specific VM instances."
	type = list(string)
}

variable "RegionName" {
	default = "us-central1"
	description = "Geographical location where resources can be hosted" 
	type = string
}

variable "Tag" {
	default = "ixnetwork"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "11-00"
	description = "Versioning of the application using the deployment"
	type = string
}

variable "ZoneName" {
	default = "us-central1-a"
	description = "Deployment area within a region"
	type = string
}