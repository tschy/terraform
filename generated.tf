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
  config_path   = null
  cron_schedule = null
  name          = "Postgres"
  project_id    = "44f12661-648c-4127-9edb-6f62916c607a"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    },
  ]
  root_directory                 = null
  source_image                   = "ghcr.io/railwayapp-templates/postgres-ssl:18"
  source_image_registry_password = null # sensitive
  source_image_registry_username = null
  source_repo                    = null
  source_repo_branch             = null
  volume = {
    mount_path = "/var/lib/postgresql/data"
    name       = "postgres-volume"
  }
}

# __generated__ by Terraform from "2bbcb9ae-18da-4429-a43f-ef80f4af1178"
resource "railway_service" "scraper" {
  config_path   = null
  cron_schedule = "0 * * * *"
  name          = "classifieds-scraper"
  project_id    = "44f12661-648c-4127-9edb-6f62916c607a"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    },
  ]
  root_directory                 = null
  source_image                   = "ghcr.io/tschy/classifieds-scraper:19"
  source_image_registry_password = null # sensitive
  source_image_registry_username = null
  source_repo                    = null
  source_repo_branch             = null
  volume                         = null
}
