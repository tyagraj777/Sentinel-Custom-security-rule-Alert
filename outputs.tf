output "pubsub_topic" {
  description = "Pub/Sub topic for custom security alerts"
  value       = google_pubsub_topic.custom_alerts.name
}

output "custom_policy" {
  description = "Custom Sentinel security policy name"
  value       = google_securitycenter_organization_security_policy.custom_policy.display_name
}
