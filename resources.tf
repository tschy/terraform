#resource "type" "name" {}

resource "railway_project" "classifieds-lifecycle" {
  name = "classifieds-lifecycle"
}

resource "railway_service" "scraper" {
  name          = "classifieds-scraper"
  project_id    = railway_project.classifieds-lifecycle.id
  cron_schedule = "0 * * * *"
  source_image  = "ghcr.io/tschy/classifieds-scraper:19"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    }
  ]
}

resource "railway_service" "db" {
  name         = "Postgres"
  project_id   = railway_project.classifieds-lifecycle.id
  source_image = "ghcr.io/railwayapp-templates/postgres-ssl:18"
  regions = [
    {
      num_replicas = 1
      region       = "europe-west4-drams3a"
    }
  ]

  volume = {
    mount_path = "/var/lib/postgresql/data"
    name       = "postgres-volume"
  }
}
