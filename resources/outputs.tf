##############################################################################
# LogDNA Outputs
##############################################################################

output logdna_guid {
    description = "GUID of LogDNA Instance"
    value       = ibm_resource_instance.logdna.guid
}

output logdna_crn {
    description = "ID of LogDNA Instance Key"
    value       = ibm_resource_instance.logdna.id
}

##############################################################################


##############################################################################
# Sysdig Outputs
##############################################################################

output sysdig_guid {
    description = "GUID of Sysdig Instance"
    value       = ibm_resource_instance.sysdig.guid
}

output sysdig_crn {
    description = "ID of Sysdig Instance"
    value       = ibm_resource_instance.sysdig.id
}

##############################################################################


##############################################################################
# Key Protect Outputs
##############################################################################

output kms_guid {
    description = "GUID of Key Protect Instance"
    value       = ibm_resource_instance.kms.guid
}

output ibm_managed_key_id {
    description = "GUID of User Managed Key"
    value       = ibm_kms_key.ibm_managed_key.key_id
}

output ibm_managed_key_crn {
    description = "CRN of User Managed Key"
    value       = ibm_kms_key.ibm_managed_key.crn
}

##############################################################################