# Sentinel-Custom-security-rule-Alert
how to create a project for defining a custom security rule using Sentinel and triggering an alert when the rule is violated



---

### Testing and Validation

1. **Deploy the Terraform Code**
   - Follow the instructions in the **README.md** file to deploy the Terraform code.

2. **Simulate Violations**
   - Deploy a GCE instance in a non-allowed region to simulate unusual VM activity.

3. **Validate Alerts**
   - Check the Pub/Sub topic for alerts.
   - Confirm alerts are routed to your SIEM if integrated.


