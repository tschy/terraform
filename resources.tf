#resource "type" "name" {}

resource "railway_project" "classifieds-lifecycle" {
  name = "classifieds-lifecycle"
}

# resource "railway_environment" "classifieds-lifecycle" {
#   name = "classifieds-lifecycle"
#   project_id = railway_project.classifieds-lifecycle.id
#
# }

resource "railway_service" "example" {
  name       = "api"
  project_id = railway_project.classifieds-lifecycle.id
}