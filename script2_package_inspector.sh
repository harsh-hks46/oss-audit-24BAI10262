#!/bin/bash

# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Course: Open Source Software
# Purpose: Check if Python is installed, show its version and
#          licence info, and print philosophy notes about FOSS packages.
# ============================================================

# --- The package to inspect (our chosen OSS software) ---
PACKAGE="python3"

echo "============================================================"
echo "         FOSS Package Inspector"
echo "============================================================"
echo ""

# --- Check if the package is installed using if-then-else ---
# 'dpkg -l' lists installed packages on Debian/Ubuntu systems
# We redirect output to /dev/null to suppress it; we only need exit code
if dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
    # Package IS installed — retrieve info
    echo "  [OK] $PACKAGE is INSTALLED on this system."
    echo ""

    # Get version using dpkg-query (works on Debian/Ubuntu)
    VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
    echo "  Version  : $VERSION"

    # Show a summary line from dpkg
    SUMMARY=$(dpkg-query -W -f='${binary:Summary}' "$PACKAGE" 2>/dev/null)
    echo "  Summary  : $SUMMARY"

    # Show the licence (Python uses PSF Licence)
    echo "  Licence  : Python Software Foundation Licence v2 (PSF)"

    # Show where the binary lives
    BINARY_PATH=$(which python3 2>/dev/null)
    echo "  Binary   : $BINARY_PATH"

else
    # Package is NOT installed — inform the user
    echo "  [!!] $PACKAGE is NOT installed on this system."
    echo ""
    echo "  To install it, run:"
    echo "    sudo apt update && sudo apt install python3"
    echo ""
fi

echo ""
echo "------------------------------------------------------------"
echo "  PHILOSOPHY NOTES (case statement)"
echo "------------------------------------------------------------"

# --- case statement: print a philosophy note based on package name ---
# The case keyword matches a variable against several patterns
case "$PACKAGE" in
    python3|python)
        echo "  Python: A language born from a desire to make programming"
        echo "  readable, shareable, and free — shaped entirely by its"
        echo "  community for over three decades."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that made the open internet possible."
        echo "  Powers approximately 30% of all websites globally."
        ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        echo "  MySQL's dual licence model is a lesson in open-source economics."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who just wanted to watch video."
        echo "  Now the world's most capable media player — free forever."
        ;;
    git)
        echo "  Git: Created by Linus Torvalds in two weeks after a proprietary"
        echo "  tool failed him. Now the foundation of all collaborative coding."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight to keep the web open."
        echo "  Without it, a single company might control the browser market."
        ;;
    *)
        # Default case — catches anything not listed above
        echo "  $PACKAGE: An open-source tool standing on decades of"
        echo "  shared knowledge and community contribution."
        ;;
esac

echo ""
echo "============================================================"
