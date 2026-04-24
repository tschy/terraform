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
module "scraper" {
  source     = "./modules/scraper"
  name       = "classifieds-scraper"
  project_id = railway_project.classifieds-lifecycle.id
}


# module "scraper_test" {
#   source     = "./modules/scraper"
#   name       = "classifieds-scraper-test"
#   project_id = railway_project.classifieds-lifecycle.id
# }

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
