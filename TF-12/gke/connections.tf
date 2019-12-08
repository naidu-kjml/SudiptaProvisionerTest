module "approle" {
  source = "github.com/wings-software/Terraform-Infrastructure//modules/terraform-harness-vault-approle"
  secret_id = "${var.secret_id}"
  role_id = "${var.role_id}"
  vault_addr = "${var.vault_addr}"
}

data "vault_generic_secret" "gcp_credentials" {
  path = "${var.gcp_credentials_path}"
}

provider "vault" {	
  address = "${var.vault_addr}"	
  token = "${module.approle.vault_token}"	
}

provider "google" {
  credentials = "${data.vault_generic_secret.gcp_credentials.data["json"]}"
  project     = "${data.vault_generic_secret.gcp_credentials.data["project_name"]}"
  region      = "us-west1"
}
