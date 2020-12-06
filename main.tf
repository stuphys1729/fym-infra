provider "google" {
    version = "3.49.0"
    credentials = file(var.credentials_file)
    project = var.project
    region = var.region
    zone = var.zone
}

// Meme Database
resource "random_id" "db_name_suffix" {
    byte_length = 4
}
resource "google_sql_database_instance" "postgres" {
    name = "memes-postgres-instance-${random_id.db_name_suffix.hex}"
    database_version = "POSTGRES_12"
  
    settings{
        tier = "db-f1-micro"
        user_labels = {
            "environment" = "development"
        }
        backup_configuration {
            enabled = true
            start_time = "04:30"
        }
    }

    deletion_protection = false
}
resource "google_sql_user" "users" {
    name     = var.db_username
    instance = google_sql_database_instance.postgres.name
    password = var.db_password
}
resource "google_sql_database" "database" {
    name     = "meme-info"
    instance = google_sql_database_instance.postgres.name
}