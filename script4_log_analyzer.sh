#!/bin/bash

# ============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Course: Open Source Software
# Purpose: Read a log file line by line, count occurrences of
#          a keyword, and print a summary with matching lines.
# Usage:   ./script4_log_analyzer.sh /path/to/logfile [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Command-line arguments ---
# $1 is the first argument (log file path)
# $2 is the second argument (keyword), defaulting to "error" if not given
LOGFILE=$1
KEYWORD=${2:-"error"}    # Default keyword is 'error' if $2 is not provided

# --- Counter variable to track matches ---
COUNT=0

echo "============================================================"
echo "         Log File Analyzer"
echo "============================================================"
echo ""

# --- Validate that a file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [!!] ERROR: No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [!!] ERROR: File '$LOGFILE' not found or is not a regular file."
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [!!] WARNING: The file '$LOGFILE' is empty. Nothing to analyse."
    exit 0
fi

echo "  Log File  : $LOGFILE"
echo "  Keyword   : '$KEYWORD' (case-insensitive)"
echo "  File Size : $(du -sh "$LOGFILE" | cut -f1)"
echo ""
echo "  Scanning... please wait."
echo ""

# --- while-read loop: read the file line by line ---
# IFS= prevents stripping of leading/trailing whitespace
# -r prevents backslash from being interpreted as escape character
while IFS= read -r LINE; do

    # --- if-then inside the loop: check each line for the keyword ---
    # grep -iq: -i = case-insensitive, -q = quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter using arithmetic expansion
    fi

done < "$LOGFILE"    # Redirect the file as input to the while loop

# --- Print the summary ---
echo "------------------------------------------------------------"
echo "  SUMMARY"
echo "------------------------------------------------------------"
echo "  Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Show the last 5 matching lines for context ---
if [ "$COUNT" -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo "  --"
    # grep -i for case-insensitive, then tail to get last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH_LINE; do
        echo "  > $MATCH_LINE"
    done
    echo ""
else
    echo "  No lines containing '$KEYWORD' were found."
    echo ""
fi

echo "============================================================"
