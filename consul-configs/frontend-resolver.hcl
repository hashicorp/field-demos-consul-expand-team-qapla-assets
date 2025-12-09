# Copyright IBM Corp. 2021, 2023
# SPDX-License-Identifier: MPL-2.0

Kind          = "service-resolver"
Name          = "frontend"
Namespace = "apps"
DefaultSubset = "v1"
Subsets = {
  "v1" = {
    Filter = "Service.Tags contains v1"
  }
  "v2" = {
    Filter = "Service.Tags contains v2"
  }
}
Failover = {
  "*" = {
    Datacenters = ["dc2"]
  }
}