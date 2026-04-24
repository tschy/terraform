variable "railway_project_id" {
  type        = string
  description = "The ID of your Railway project"
}

variable "railway_environment_id" {
type        = string
description = "The ID of your Railway project"
}

variable "database_url" {
  type        = string
  description = "The internal connection string for Postgres"
  sensitive   = true
}

variable "dropbox_refresh_token" {
  type      = string
  sensitive = true
}

variable "dropbox_app_key" {
  type      = string
  sensitive = true
}

variable "dropbox_app_secret" {
  type      = string
  sensitive = true
}