#resource "type" "name" {}

resource "railway_project" "classifieds-lifecycle" {
  name = "classifieds-lifecycle"
}

resource "railway_service" "scraper" {
  name       = "classifieds-scraper"
  project_id = railway_project.classifieds-lifecycle.id
}

resource "railway_service" "db" {
  name       = "Postgres"
  project_id = railway_project.classifieds-lifecycle.id
}