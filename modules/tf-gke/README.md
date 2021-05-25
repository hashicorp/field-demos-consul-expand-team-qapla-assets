# GKE Terraform Module

This repo is a personalized Terraform module configuration to create a GKE cluster, based on the following parameters:

* `gcp_region` : GCP region to deploy your K8s cluster
* `gcp_project` : GCP project to scope the resources
* `node_type` : VM type to create for the K8s nodes
* `gcp_zone` : GCP zone if creating a zonal cluster
* `gke_cluster` : "dcanadillas-gke-demo"
* `numnodes` : Number of worker nodes for the K8s cluster
* `regional_k8s` : Set it to `true` if you want a regional cluster. By default it will deploy a zonal cluster
* `owner` : An owner name to tag your cluster
* `gcs_bucket` : A GCS bucket to create the `jx-requirement.yml` file
* `service_account` : This parameter is not still used (*ToDo*)
* `default_gke` : Set this to `true` if you want to create a GKE cluster with the default `NodePool`
* `default_network` : Set this to true to use the `default` GKE network for your cluster. If not, it will create a network and its subnetwork for the cluster

It will create the following resources in GCP:
- A Google Container Engine cluster (GKE) and its associated resources
- A node pool for the GKE cluster
- Specific network and subnetwork for the GKE resources
- The `jx-requirements.yml` 

## Requirements

These are the requirements to use this Terraform configuration:
* Download [Terraform CLI]() (v0.12.26 or newer)
* A GCP account credentials with permissions to create GKE and networking resources

## Using Terrraform Cloud (TFC) or Terraform Enterprise (TFE)

This Terraform configuration is designed to use a [remote backend]() that needs to be defined in a `backend.hcl` file. So you only need to follow these steps (This is a TFC example. For TFE you should be aware of your TFE url different than `app.terraform.io`, but it is basically the same process):

1. [Sign up for a TFC account](https://app.terraform.io/signup/account) if you don't have one already
2. If you don't still have a [Terraform Cloud API token](https://app.terraform.io/app/settings/tokens), create one by login into Terrafomr from CLI:
   ```
   $ terraform login
    Terraform will request an API token for app.terraform.io using your browser.

    If login is successful, Terraform will store the token in plain text in
    the following file for use by subsequent commands:
        /<your_home_dir_path>/.terraform.d/credentials.tfrc.json

    Do you want to proceed?
      Only 'yes' will be accepted to confirm.

      Enter a value: yes


    ---------------------------------------------------------------------------------

    Terraform must now open a web browser to the tokens page for app.terraform.io.

    If a browser does not open this automatically, open the following URL to proceed:
        https://app.terraform.io/app/settings/tokens?source=terraform-login


    ---------------------------------------------------------------------------------

    Generate a token using your browser, and copy-paste it into this prompt.

    Terraform will store the token in plain text in the following file
    for use by subsequent commands:
        /<your_home_dir_path>/.terraform.d/credentials.tfrc.json

    Token for app.terraform.io:
      Enter a value: 
   ```
3. Choose a TFC organization or [create one](https://www.terraform.io/docs/cloud/users-teams-organizations/organizations.html#creating-organizations)
4. Edit/Create your `backend.hcl` file:
   ```
   hostname     = "app.terraform.io"
   organization = "<your_organization>"
   workspaces { name = "<your_workspace_name>" }
   ```
5. Initialize Terraform with the configuration:
   ```
   $ terraform init -backend-config=backend.hcl 
   Initializing modules...

   Initializing the backend...

   Successfully configured the backend "remote"! Terraform will automatically
   use this backend unless the backend configuration changes.

   Initializing provider plugins...
   - Using previously-installed hashicorp/google v3.42.0
   - Using previously-installed hashicorp/google-beta v3.42.0

   The following providers do not have any version constraints in configuration,
   so the latest version was installed.

   To prevent automatic upgrades to new major versions that may contain breaking
   changes, we recommend adding version constraints in a required_providers block
   in your configuration, with the constraint strings suggested below.

   * hashicorp/google: version = "~> 3.42.0"
   * hashicorp/google-beta: version = "~> 3.42.0"

   Terraform has been successfully initialized!

   You may now begin working with Terraform. Try running "terraform plan" to see
   any changes that are required for your infrastructure. All Terraform commands
   should now work.

   If you ever set or change modules or backend configuration for Terraform,
   rerun this command to reinitialize your working directory. If you forget, other
   commands will detect it and remind you to do so if necessary.
   ```
6. Now you should be ready to go:
   ```
   terraform apply
   ```


