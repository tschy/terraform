`terraform import railway_project.classifieds-lifecycle classifieds-lifecycle`

robert@hypatia:~/terraform$ terraform import railway_project.classifieds-lifecycle classifieds-lifecycle
railway_project.classifieds-lifecycle: Importing from ID "classifieds-lifecycle"...
railway_project.classifieds-lifecycle: Import prepared!
  Prepared railway_project for import
railway_project.classifieds-lifecycle: Refreshing state... [id=classifieds-lifecycle]
╷
│ Error: Client Error
│ 
│ Unable to read project, got error: input:3: project Project not found
│ 
╵

`terraform import railway_project.classifieds-lifecycle 44f12661-648c-4127-9edb-6f62916c607a`
--> from Railway website

https://github.com/tschy/terraform

export RAILWAY_TOKEN=...

robert@hypatia:~/terraform$ terraform import railway_project.classifieds-lifecycle 44f12661-648c-4127-9edb-6f62916c607a
railway_project.classifieds-lifecycle: Importing from ID "44f12661-648c-4127-9edb-6f62916c607a"...
railway_project.classifieds-lifecycle: Import prepared!
  Prepared railway_project for import
railway_project.classifieds-lifecycle: Refreshing state... [id=44f12661-648c-4127-9edb-6f62916c607a]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

`terraform import railway_service.scraper 2bbcb9ae-18da-4429-a43f-ef80f4af1178`

robert@hypatia:~/terraform$ terraform import railway_service.scraper 2bbcb9ae-18da-4429-a43f-ef80f4af1178
railway_service.scraper: Importing from ID "2bbcb9ae-18da-4429-a43f-ef80f4af1178"...
railway_service.scraper: Import prepared!
  Prepared railway_service for import
railway_service.scraper: Refreshing state... [id=2bbcb9ae-18da-4429-a43f-ef80f4af1178]

Import successful!                                                                                                                                                                 
                                                                                                                                                                                   
The resources that were imported are shown above. These resources are now in                                                                                                       
your Terraform state and will henceforth be managed by Terraform.

`terraform import railway_service.db 91673c0b-c1a8-45ce-9eb2-5666d2aa63c0`

robert@hypatia:~/terraform$ terraform import railway_service.db 91673c0b-c1a8-45ce-9eb2-5666d2aa63c0
railway_service.db: Importing from ID "91673c0b-c1a8-45ce-9eb2-5666d2aa63c0"...
railway_service.db: Import prepared!
  Prepared railway_service for import
railway_service.db: Refreshing state... [id=91673c0b-c1a8-45ce-9eb2-5666d2aa63c0]

Import successful!                                                                                                                                                                 
                                                                                                                                                                                   
The resources that were imported are shown above. These resources are now in                                                                                                       
your Terraform state and will henceforth be managed by Terraform.                                                                                                                  
                                                                                                                                                                                   
robert@hypatia:~/terraform$ terraform plan
railway_project.classifieds-lifecycle: Refreshing state... [id=44f12661-648c-4127-9edb-6f62916c607a]
railway_service.scraper: Refreshing state... [id=2bbcb9ae-18da-4429-a43f-ef80f4af1178]
railway_service.db: Refreshing state... [id=91673c0b-c1a8-45ce-9eb2-5666d2aa63c0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # railway_service.db will be updated in-place
  ~ resource "railway_service" "db" {
        id           = "91673c0b-c1a8-45ce-9eb2-5666d2aa63c0"
        name         = "Postgres"
      ~ regions      = [
          - {
              - num_replicas = 1 -> null
              - region       = "europe-west4-drams3a" -> null
            },
        ] -> (known after apply)
      - source_image = "ghcr.io/railwayapp-templates/postgres-ssl:18" -> null
      - volume       = {
          - id         = "16d4547b-7c8b-435f-8c48-17f95caf028c" -> null
          - mount_path = "/var/lib/postgresql/data" -> null
          - name       = "postgres-volume" -> null
          - size       = 500 -> null
        } -> null
        # (1 unchanged attribute hidden)
    }

  # railway_service.scraper will be updated in-place
  ~ resource "railway_service" "scraper" {
      - cron_schedule = "0 * * * *" -> null
        id            = "2bbcb9ae-18da-4429-a43f-ef80f4af1178"
        name          = "classifieds-scraper"
      ~ regions       = [
          - {
              - num_replicas = 1 -> null
              - region       = "europe-west4-drams3a" -> null
            },
        ] -> (known after apply)
      - source_image  = "ghcr.io/tschy/classifieds-scraper:19" -> null
        # (1 unchanged attribute hidden)
    }

Plan: 0 to add, 2 to change, 0 to destroy.