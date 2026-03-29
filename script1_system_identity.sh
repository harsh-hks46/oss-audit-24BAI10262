#!/bin/bash

# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software
# Purpose: Display a welcome screen showing this Linux system's
#          identity, including kernel, user, uptime, and licence info.
# ============================================================

# --- Variables ---
STUDENT_NAME="[Your Name Here]"        # Fill in your name
SOFTWARE_CHOICE="Python"               # Chosen OSS software

# --- Gather system information using command substitution $() ---
KERNEL=$(uname -r)                     # Kernel release version
ARCH=$(uname -m)                       # System architecture (x86_64, etc.)
USER_NAME=$(whoami)                    # Current logged-in username
HOME_DIR=$HOME                         # Home directory of current user
UPTIME=$(uptime -p)                    # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')   # e.g. Monday, 01 January 2025
CURRENT_TIME=$(date '+%H:%M:%S')       # e.g. 14:35:22

# --- Get the Linux distribution name from /etc/os-release ---
# This file exists on all modern Linux distributions
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Display the system identity report ---
echo "============================================================"
echo "     OPEN SOURCE AUDIT — System Identity Report"
echo "     Student : $STUDENT_NAME"
echo "     Software: $SOFTWARE_CHOICE"
echo "============================================================"
echo ""
echo "  Operating System : $DISTRO"
echo "  Kernel Version   : $KERNEL"
echo "  Architecture     : $ARCH"
echo "  Logged-in User   : $USER_NAME"
echo "  Home Directory   : $HOME_DIR"
echo "  System Uptime    : $UPTIME"
echo "  Current Date     : $CURRENT_DATE"
echo "  Current Time     : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  LICENCE NOTE:"
echo "  The Linux kernel (this OS foundation) is covered under"
echo "  the GNU General Public Licence version 2 (GPL v2)."
echo "  This means you have the freedom to use, study, modify,"
echo "  and redistribute it — as long as derivatives remain GPL."
echo "------------------------------------------------------------"
echo ""
echo "  Python ($SOFTWARE_CHOICE) is covered under the PSF Licence v2,"
echo "  a permissive open-source licence that allows commercial use."
echo ""
echo "============================================================"
