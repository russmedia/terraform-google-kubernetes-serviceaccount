resource "google_service_account" "serviceaccount" {
  account_id   = "${var.name}-${var.environment}"
  display_name = "${var.name}-${var.environment} - managed by Terraform"
  project      = var.project
}

resource "google_project_iam_member" "project" {
  project = var.project
  role    = var.role
  member  = "serviceAccount:${google_service_account.serviceaccount.email}"
}

resource "google_service_account_key" "account_key" {
  service_account_id = google_service_account.serviceaccount.id
}

resource "kubernetes_secret" "serviceaccount-credentials" {
  metadata {
    name      = "${var.name-prefix}${var.name}"
    namespace = var.namespace
  }

  data = {
    "credentials.json" = base64decode(google_service_account_key.account_key.private_key)
  }

  type = "kubernetes.io/credentials"
}

