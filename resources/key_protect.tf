##############################################################################
# Key Protect
##############################################################################

resource ibm_resource_instance kms {
  name              = "${var.unique_id}-kms"
  location          = var.ibm_region
  plan              = var.kms_plan
  resource_group_id = var.resource_group_id
  service           = "kms"
  service_endpoints = var.service_endpoints
}

##############################################################################


##############################################################################
# Key Protect Root Key
##############################################################################

resource ibm_kms_key ibm_managed_key {
  instance_id  = ibm_resource_instance.kms.guid
  key_name     = var.kms_root_key_name
  standard_key = false
}

##############################################################################