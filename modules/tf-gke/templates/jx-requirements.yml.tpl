autoUpdate:
  enabled: false
  schedule: ""
cluster:
  clusterName: "${gke_cluster}"
  environmentGitOwner: "${github_org}"
  environmentGitPublic: true
  project: "${project}"
  azure: {}
  provider: gke
  zone: "${zone}"
gitops: true
environments:
  - key: dev
  - key: staging
  - key: production
ingress:
  domain: ""
  externalDNS: false
  tls:
    email: ""
    enabled: false
    production: false
kaniko: true
secretStorage: vault
vault:
  name: "vault-${owner}"
  bucket: "jx-vault-${owner}"
storage:
  logs:
    enabled: true
    url: "gs://${owner}-jx"
  reports:
    enabled: true
    url: "gs://${owner}-jx"
  repository:
    enabled: true
    url: "gs://${owner}-jx"
versionStream:
  ref: 2.1.78+cjxd.11
  url: https://github.com/cloudbees/cloudbees-jenkins-x-versions.git
webhook: lighthouse