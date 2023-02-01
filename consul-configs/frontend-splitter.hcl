# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

Kind = "service-splitter"
Name = "frontend"
Namespace = "apps"
Splits = [
  {
    Weight  = 50
    Service = "frontend"
    ServiceSubset = "v1"
  },
  {
    Weight  = 50
    Service = "frontend"
    ServiceSubset = "v2"
  },
]