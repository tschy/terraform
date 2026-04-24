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