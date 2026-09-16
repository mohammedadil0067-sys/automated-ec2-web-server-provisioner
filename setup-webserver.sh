#!/bin/bash

# ---- Automated EC2 Web Server Provisioner ----
# This script installs Apache, starts it, enables it on boot,
# and deploys a basic HTML page.

echo "Step 1: Updating package lists..."
sudo apt update -y

echo "Step 2: Installing Apache2..."
sudo apt install apache2 -y

echo "Step 3: Starting Apache service..."
sudo systemctl start apache2

echo "Step 4: Enabling Apache to start on every boot..."
sudo systemctl enable apache2

echo "Step 5: Deploying a custom homepage..."
sudo bash -c 'cat > /var/www/html/index.html' <<EOF
<!DOCTYPE html>
<html>
<head><title>Automated Deployment</title></head>
<body>
  <h1>Success! Apache was installed automatically.</h1>
  <p>Provisioned via Bash script on $(date)</p>
</body>
</html>
EOF

echo "Step 6: Verifying Apache is running..."
sudo systemctl status apache2 --no-pager

echo "Setup complete. Visit http://YOUR_PUBLIC_IP in your browser."
