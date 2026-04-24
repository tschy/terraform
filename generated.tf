# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "44f12661-648c-4127-9edb-6f62916c607a"
resource "railway_project" "classifieds-lifecycle" {
  default_environment = {
    name = "production"
  }
  has_pr_deploys = false
  name           = "classifieds-lifecycle"
  private        = true
  workspace_id   = "fdecf6ba-6b48-4c3c-b865-eecdc59311f2"
}

# __generated__ by Terraform from "91673c0b-c1a8-45ce-9eb2-5666d2aa63c0"
resource "railway_service" "db" {
  name          = "Postgres"
  project_id    = "44f12661-648c-4127-9edb-6f62916c607a"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    },
  ]
  source_image                   = "ghcr.io/railwayapp-templates/postgres-ssl:18"
  volume = {
    mount_path = "/var/lib/postgresql/data"
    name       = "postgres-volume"
  }
}

