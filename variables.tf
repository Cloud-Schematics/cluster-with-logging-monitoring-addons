##############################################################################
# Account variables
##############################################################################

variable ibmcloud_api_key {
    description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
    type        = string
}

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    type        = string
}

variable resource_group {
    description = "Name for IBM Cloud Resource Group where resources will be deployed"
    type        = string
}

variable unique_id {
    description = "A unique identifier need to provision resources. Must begin with a letter"
    type        = string
    default     = "asset-test"
}

##############################################################################


##############################################################################
# VPC Variables
##############################################################################

variable vpc_name {
    description = "Name of VPC where cluster is to be created"
    type        = string
}

variable subnet_names {
    description = "List of subnet names"
    type        = list(string)
    default     = []
}

##############################################################################


##############################################################################
# Cluster Variables
##############################################################################

variable cluster_name {
    description = "Name of cluster to be provisioned"
    type        = string
    default     = "test-cluster-with-addons"
}

variable machine_type {
    description = "The flavor of VPC worker node to use for your cluster"
    type        = string
    default     = "bx2.4x16"
}

variable workers_per_zone {
    description = "Number of workers to provision in each subnet"
    type        = number
    default     = 2
}

variable disable_public_service_endpoint {
    description = "Disable public service endpoint for cluster"
    type        = bool
    default     = false
}

variable kube_version {
    description = "Specify the Kubernetes version, including the major.minor version. To see available versions, run `ibmcloud ks versions`. To use the default, leave string empty"
    type        = string
    default     = ""
}

variable wait_till {
    description = "To avoid long wait times when you run your Terraform code, you can specify the stage when you want Terraform to mark the cluster resource creation as completed. Depending on what stage you choose, the cluster creation might not be fully completed and continues to run in the background. However, your Terraform code can continue to run without waiting for the cluster to be fully created. Supported args are `MasterNodeReady`, `OneWorkerNodeReady`, and `IngressReady`"
    type        = string
    default     = "IngressReady"
}

variable tags {
    description = "A list of tags to add to the cluster"
    type        = list(string)
    default     = []
}

variable worker_pools {
    description = "List of maps describing worker pools"
    # type        = list(
    #     object({
    #         pool_name        = string
    #         machine_type     = string
    #         workers_per_zone = number
    #     })
    # )
    default     = []
    #    {
    #        pool_name        = "dev"
    #        machine_type     = "c2.2x4"
    #        workers_per_zone = 1
    #        resource_group   = "default"
    #    },
    #    {
    #        pool_name        = "prod"
    #        machine_type     = "c2.2x4"
    #        workers_per_zone = 1
    #    }
    #]
}

variable cluster_addons {
    description = "A list of maps describing addons to be added to cluster"
    # type        = list(
    #     object({
    #         name    = string
    #         version = string # Optional
    #     })
    # )
    default    = [
        {
            name = "istio"
        },
        {
            name    = "kube-terminal"
            version = "1.0.0"
        },
        {
            name    = "cluster-autoscaler"
        }
    ]
}

##############################################################################

##############################################################################
# Resource Variables
##############################################################################

variable service_endpoints {
  description = "Service endpoints for resource instances. Can be `public`, `private`, or `public-and-private`"
  type        = string
  default     = "private"
}

variable kms_plan {
  description = "Plan for Key Protect"
  type        = string
  default     = "tiered-pricing"  
}

variable kms_root_key_name {
  description = "Name of the root key for Key Protect instance"
  type        = string
  default     = "root-key"
}

variable kms_private_service_endpoint {
    description = "Use private service endpoint for Key Protect instance"
    type        = bool
    default     = true
}

variable logdna_plan {
  description = "Plan for Databases for PostgreSQL"
  type        = string
  default     = "7-day"
}

variable sysdig_plan {
  description = "Plan for Databases for PostgreSQL"
  type        = string
  default     = "graduated-tier"
}

##############################################################################