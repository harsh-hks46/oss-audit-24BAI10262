#!/bin/bash

# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Course: Open Source Software
# Purpose: Loop through important Linux directories and report
#          their disk usage, owner, group, and permissions.
#          Also check Python's configuration directory.
# ============================================================

# --- Array of important system directories to audit ---
# Arrays in bash are defined with parentheses and space-separated values
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "============================================================"
echo "         Disk and Permission Auditor"
echo "============================================================"
echo ""
printf "  %-20s %-12s %-30s\n" "DIRECTORY" "SIZE" "PERMISSIONS (type owner group)"
echo "  --------------------------------------------------------------------"

# --- for loop: iterate over each directory in the DIRS array ---
# ${DIRS[@]} expands all elements of the array
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then

        # Get permissions, owner, and group using ls -ld
        # awk extracts specific fields: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get disk usage using du -sh (human-readable summary)
        # 2>/dev/null suppresses "permission denied" errors on subdirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print a formatted row using printf for aligned columns
        printf "  %-20s %-12s %-30s\n" "$DIR" "$SIZE" "$PERMS"

    else
        # Directory does not exist on this system
        printf "  %-20s %-12s %-30s\n" "$DIR" "N/A" "[does not exist]"
    fi

done

echo ""
echo "------------------------------------------------------------"
echo "  PYTHON-SPECIFIC DIRECTORY CHECK"
echo "------------------------------------------------------------"
echo ""

# --- Check Python's key directories and their permissions ---
# Find the active Python version to build the correct path
PYTHON_VERSION=$(python3 --version 2>/dev/null | awk '{print $2}' | cut -d. -f1,2)

# Build the paths for Python's library and dist-packages directories
PYTHON_LIB="/usr/lib/python${PYTHON_VERSION}"
PYTHON_DIST="/usr/lib/python3/dist-packages"
PYTHON_BIN=$(which python3 2>/dev/null)

# Check each Python-specific path
for PY_DIR in "$PYTHON_LIB" "$PYTHON_DIST"; do
    if [ -d "$PY_DIR" ]; then
        PY_PERMS=$(ls -ld "$PY_DIR" | awk '{print $1, $3, $4}')
        PY_SIZE=$(du -sh "$PY_DIR" 2>/dev/null | cut -f1)
        echo "  Directory : $PY_DIR"
        echo "  Size      : $PY_SIZE"
        echo "  Perms     : $PY_PERMS"
        echo ""
    else
        echo "  $PY_DIR — not found (version may differ)"
        echo ""
    fi
done

# Check the Python binary itself
if [ -f "$PYTHON_BIN" ]; then
    BIN_PERMS=$(ls -l "$PYTHON_BIN" | awk '{print $1, $3, $4}')
    echo "  Python Binary : $PYTHON_BIN"
    echo "  Permissions   : $BIN_PERMS"
    echo ""
fi

echo "============================================================"
