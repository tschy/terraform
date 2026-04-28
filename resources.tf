#
# import {
#   to = railway_project.classifieds-lifecycle
#   id = "44f12661-648c-4127-9edb-6f62916c607a"
# }
#
# import {
#   to = railway_service.scraper
#   id = "2bbcb9ae-18da-4429-a43f-ef80f4af1178"
# }
#
# import {
#   to = railway_service.db
#   id = "91673c0b-c1a8-45ce-9eb2-5666d2aa63c0"
# }


import {
  to = railway_variable.scraper_datasource_url
  id = "2bbcb9ae-18da-4429-a43f-ef80f4af1178"
}

resource "railway_variable" "scraper_datasource_url" {
  for_each = {
    SPRING_DATASOURCE_URL           = var.database_url
    SPRING_DATASOURCE_USERNAME      = var.dropbox_refresh_token
    SPRING_DATASOURCE_PASSWORD      = var.dropbox_app_key
  }
}


module "scraper" {
  source     = "./modules/scraper"
  name       = "classifieds-scraper"
  project_id = railway_project.classifieds-lifecycle.id
}


# The Backup Service
resource "railway_service" "db_backup" {
  name          = "classifieds-backup-service"
  project_id    = var.railway_project_id
  source_image  = "ghcr.io/tschy/classifieds-backup-service:latest"

  # This tells Railway to run it every night at midnight
  cron_schedule = "0 0 * * *"
}

# Environment Variables for the service
resource "railway_variable" "db_backup_vars" {
  for_each = {
    DATABASE_URL           = var.database_url
    DROPBOX_REFRESH_TOKEN  = var.dropbox_refresh_token
    DROPBOX_APP_KEY        = var.dropbox_app_key
    DROPBOX_APP_SECRET     = var.dropbox_app_secret
  }

  service_id = railway_service.db_backup.id
  environment_id = railway_project.classifieds-lifecycle.default_environment.id

  name       = each.key
  value      = each.value
}

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
