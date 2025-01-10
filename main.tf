provider "google" {
  project = var.project_id
}

# Enable Security Health Analytics
resource "google_securitycenter_organization_settings" "organization_settings" {
  org_id               = var.organization_id
  enable_asset_discovery = true

  asset_discovery_config {
    project_ids = [var.project_id]
  }
}

# Create a custom Sentinel policy
resource "google_securitycenter_organization_security_policy" "custom_policy" {
  org_id    = var.organization_id
  display_name = "Unusual VM Activity Detection"
  description  = "Detect unusual VM activity like unauthorized region deployments."

  query = <<-EOT
    resource.type = "gce_instance"
    AND logName = "projects/${var.project_id}/logs/cloudaudit.googleapis.com%2Factivity"
    AND jsonPayload.methodName = "v1.compute.instances.insert"
    AND jsonPayload.resourceLocation.region != "us-central1"
  EOT
}

# Create a Pub/Sub topic for alerts
resource "google_pubsub_topic" "custom_alerts" {
  name = "custom-alerts-topic"
}

# Create a notification config for policy violations
resource "google_securitycenter_notification_config" "notification_config" {
  name               = "custom-policy-violations"
  parent             = "organizations/${var.organization_id}"
  description        = "Notification for custom policy violations"
  pubsub_topic       = google_pubsub_topic.custom_alerts.id
  streaming_config {
    filter = "severity = 'HIGH' AND source_properties.policy_name = 'Unusual VM Activity Detection'"
  }
}
