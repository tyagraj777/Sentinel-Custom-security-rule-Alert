# Sentinel-Custom-security-rule-Alert
how to create a project for defining a custom security rule using Sentinel and triggering an alert when the rule is violated

#Sample Directory structure
custom-security-rule/
├── main.tf           # Main Terraform configuration
├── variables.tf      # Variable definitions
├── outputs.tf        # Outputs for resources created
├── terraform.tfvars  # Variable values
├── README.md         # Documentation for setup and integration

# Custom Security Rule with Sentinel and Alerts

## Overview
This project creates a custom Sentinel security policy and sets up notifications for policy violations. It uses Terraform to automate the creation of the policy, Pub/Sub topic, and notification configuration.

---

## Features
- **Custom Sentinel Policy:** Detect unusual VM activity (e.g., unauthorized region deployments).
- **Alerting:** Pub/Sub-based notification for violations.
- **Integration Ready:** Designed for easy integration with SIEM systems.

---

## Prerequisites
1. **Google Cloud Project and Organization**: Ensure you have access to a GCP project and organization.
2. **Terraform Installed**: Install Terraform from [Terraform.io](https://www.terraform.io/downloads).

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone <repository-url>
cd custom-security-rule


