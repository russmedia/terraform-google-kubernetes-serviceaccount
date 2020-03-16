output "serviceaccount_id" {
  value = google_service_account.serviceaccount.unique_id
}

output "serviceaccount_private_key" {
  value = google_service_account_key.account_key.private_key
}

output "serviceaccount_email" {
  value = google_service_account.serviceaccount.email
}

