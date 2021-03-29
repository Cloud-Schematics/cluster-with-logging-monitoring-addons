##############################################################################
# Create IKS on VPC Cluster
##############################################################################

resource ibm_container_vpc_cluster cluster {

  name              = var.cluster_name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.group.id
  flavor            = var.machine_type
  worker_count      = var.workers_per_zone
  kube_version      = var.kube_version != "" ? var.kube_version : null
  tags              = var.tags
  wait_till         = var.wait_till

  dynamic zones {
    for_each = data.ibm_is_subnet.subnets
    content {
      subnet_id = zones.value.id
      name      = zones.value.zone
    }
  }

  disable_public_service_endpoint = var.disable_public_service_endpoint

  kms_config {
    instance_id      = module.resources.kms_guid
    crk_id           = module.resources.ibm_managed_key_id
    private_endpoint = var.kms_private_service_endpoint
  }

}

##############################################################################


##############################################################################
# Cluster Addons
##############################################################################

resource ibm_container_addons addons {
  cluster = ibm_container_vpc_cluster.cluster.id

  dynamic addons {
    for_each = var.cluster_addons
    content {
      name    = addons.value.name
      version = contains(keys(addons.value), "version") ? addons.value.version : null
    }
  }

  timeouts {
    create = "2h"
    update = "1h"
  }

}

##############################################################################


##############################################################################
# Worker Pools
##############################################################################

module worker_pools {
  source            = "./worker_pools"
  ibm_region        = var.ibm_region
  pool_list         = var.worker_pools
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.group.id
  cluster_name_id   = ibm_container_vpc_cluster.cluster.id
  subnets           = data.ibm_is_subnet.subnets
}

##############################################################################