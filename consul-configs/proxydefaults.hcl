# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

apiVersion: consul.hashicorp.com/v1alpha1
kind: ProxyDefaults
metadata:
  name: global
spec:
  meshGateway:
    mode: 'local'