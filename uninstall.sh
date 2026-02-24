#!/usr/bin/env bash

# --- Ubuntu Pro LTS: UK Keyboard Inverter Uninstaller ---
set -euo pipefail

echo "------------------------------------------------"
echo "Reverting Keyboard Changes..."
echo "------------------------------------------------"

# 1. Stop and disable the service immediately
echo "[1/3] Stopping keyd service..."
sudo systemctl disable --now keyd 2>/dev/null || echo "Service already stopped."

# 2. Remove configuration files
echo "[2/3] Removing custom layout configuration..."
sudo rm -rf /etc/keyd

# 3. Software Removal
read -p "Do you want to completely remove the 'keyd' software? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "[3/3] Removing keyd binaries and system files..."
    
    sudo rm -f /usr/local/bin/keyd
    sudo rm -f /usr/local/bin/keyd-application-mapper

    # Remove the group created during install
    sudo groupdel keyd 2>/dev/null || echo "Group 'keyd' not found or already removed."
    
    # Remove service files from all common locations
    sudo rm -f /lib/systemd/system/keyd.service
    sudo rm -f /usr/lib/systemd/system/keyd.service
    sudo rm -f /etc/systemd/system/keyd.service
    
    sudo systemctl daemon-reload
    echo "Software successfully removed."
else
    echo "[3/3] Skipping software removal. Inversion is now disabled."
fi

# Final touch: Refresh system input state
# This ensures Ubuntu drops the keyd virtual mapping immediately
sudo udevadm trigger --subsystem-match=input --action=change

echo "------------------------------------------------"
echo "SUCCESS: Your keyboard is back to normal."
echo "Note: System layout remains 'gb' (UK) for hardware compatibility."
echo "------------------------------------------------"