#!/usr/bin/env bash

# --- Ubuntu Pro LTS: UK Keyboard Inverter Setup ---
# Target: Ubuntu 22.04 / 24.04 / Debian
# Feature: Direct Layout Enforcement & Source Build
set -euo pipefail

log() { echo -e "\e[32m[+]\e[0m $1"; }

echo "------------------------------------------------"
echo "Starting UK Keyboard Inverter Installation..."
echo "------------------------------------------------"

# 1. Force UK Layout (Bypassing localectl to avoid Debian errors)
log "Configuring system-wide UK Keyboard Layout..."
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="gb"/g' /etc/default/keyboard 2>/dev/null || true
# Trigger system to acknowledge the layout change
sudo udevadm trigger --subsystem-match=input --action=change

# 2. Dependency Check & Build keyd
if ! command -v keyd &> /dev/null; then
    log "Checking for required tools (build-essential, git)..."
    sudo apt update
    sudo apt install -y build-essential git

    log "Cloning and building keyd from source..."
    cd /tmp
    rm -rf keyd
    git clone https://github.com/rvaiya/keyd
    cd keyd
    make
    sudo make install
    
    sudo systemctl daemon-reload
    cd ~
else
    log "keyd is already installed."
fi

# 3. Configure Mapping (UK ISO)
log "Writing UK configuration to /etc/keyd/default.conf..."
sudo mkdir -p /etc/keyd

sudo tee /etc/keyd/default.conf > /dev/null << 'EOF'
[ids]
*

[main]
# On a UK board, " is Shift+2. We force that specifically.
1 = S-1
2 = S-2
3 = S-3
4 = S-4
5 = S-5
6 = S-6
7 = S-7
8 = S-8
9 = S-9
0 = S-0
minus = S-minus
semicolon = S-semicolon
# Next to Enter: Physical UK '@' key
apostrophe = S-apostrophe
# Next to Enter: Physical UK '#' key
backslash = S-backslash
# Next to Left Shift: Physical UK '\' key
102nd = S-102nd

[shift]
# Holding shift now returns the raw numbers/base keys
1 = 1
2 = 2
3 = 3
4 = 4
5 = 5
6 = 6
7 = 7
8 = 8
9 = 9
0 = 0
minus = minus
semicolon = semicolon
apostrophe = apostrophe
backslash = backslash
102nd = 102nd
EOF

# 4. Enable and Start
log "Activating keyboard service..."
sudo systemctl enable keyd
sudo systemctl restart keyd

echo "------------------------------------------------"
echo "INSTALLATION COMPLETE!"
echo "Keys 1-0, ; , - , @ , and # are now INVERTED."
echo "Hardware layout: UK ISO"
echo "------------------------------------------------"