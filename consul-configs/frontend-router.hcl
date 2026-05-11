# Copyright IBM Corp. 2021, 2026
# SPDX-License-Identifier: MPL-2.0

Kind = "service-router"
Name = "frontend"
Namespace = "apps"
Routes = [
  {
    Match {
      HTTP {
        QueryParam = [
          {
            Name  = "x-debug"
            Present = "True"
          },
        ]
      }
    }
    Destination {
      Service = "frontend"
      ServiceSubset = "v2"
    }
  }
]