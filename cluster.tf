# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.cluster_name
  region  = var.region
  version = data.digitalocean_kubernetes_versions.k8s.latest_version

  vpc_uuid      = var.vpc_uuid
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  tags          = var.tags

  node_pool {
    name       = format("%s-core", var.cluster_name)
    size       = element(data.digitalocean_sizes.k8s.sizes, 0).slug
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
    node_count = var.node_count
    tags       = var.node_tags
    labels     = var.node_labels
  }
  maintenance_policy {
    start_time = var.maintenance_policy_start_time
    day        = var.maintenance_policy_day
  }

}
