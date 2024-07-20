terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.8.0"
    }
  }
}

provider "proxmox" {
  virtual_environment {
    endpoint = "https://<your proxmox ip>:8006/"
  }
}

--- a/files.tf
+++ b/files.tf
@@ -9,13 +9,3 @@ resource "proxmox_virtual_environment_file" "debian_cloud_image" {
     checksum  = "ba0237232247948abf7341a495dec009702809aa7782355a1b35c112e75cee81"
   }
 }
+
+resource "proxmox_virtual_environment_file" "cloud_config" {
+  content_type = "snippets"
+  datastore_id = "local"
+  node_name    = "<your proxmox node>"
+
+  source_file {
+    path = "cloud-init/user-data.yml"
+  }
+}
