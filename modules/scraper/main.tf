resource "railway_service" "scraper" {
  name          = var.name
  project_id    = var.project_id
  cron_schedule = "0 * * * *"
  source_image  = "ghcr.io/tschy/classifieds-scraper:19"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    }
  ]
}