resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
  labels = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform__gcp__gcs_tf"
    git_last_modified_at = "2021-08-19-12-44-42"
    git_last_modified_by = "eurogig"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "2335fe6b-1fd3-45f0-a503-06e263cede72"
  }
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}