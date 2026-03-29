#!/bin/bash

# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Course: Open Source Software
# Purpose: Ask the user three questions about open source and
#          generate a personalised philosophy statement, saving
#          it to a .txt file with the current date.
# ============================================================

# --- alias concept demonstrated via a comment ---
# In a real shell session you could type: alias today='date "+%d %B %Y"'
# Then use 'today' instead of the full date command.
# Aliases are personal shortcuts — a small but real example of
# the open-source value of customising your own tools.

# --- Get the current date for the manifesto header ---
DATE=$(date '+%d %B %Y')

# --- Build the output filename using the current username ---
# whoami returns the logged-in username; $() is command substitution
OUTPUT="manifesto_$(whoami).txt"

# --- Display introduction ---
echo "============================================================"
echo "         Open Source Manifesto Generator"
echo "         Course: Open Source Software"
echo "============================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""
echo "------------------------------------------------------------"

# --- Read user input with prompts ---
# read -p displays a prompt and stores the answer in a variable
echo ""
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Compose the manifesto using string concatenation ---
# Write each line to the file using echo and >> (append redirection)
# The first line uses > (overwrite) to start fresh, then >> for the rest

# Overwrite (or create) the file with the header
echo "============================================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "         Generated on: $DATE" >> "$OUTPUT"
echo "         Author: $(whoami)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the personalised paragraph by concatenating the user's answers
echo "Every day, I rely on $TOOL — a tool that exists because" >> "$OUTPUT"
echo "someone, somewhere, chose to share their work freely with" >> "$OUTPUT"
echo "the world. That act of sharing is not naive. It is a" >> "$OUTPUT"
echo "deliberate statement: that $FREEDOM belongs to everyone," >> "$OUTPUT"
echo "not just those who can afford it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe that the greatest software is built in the open," >> "$OUTPUT"
echo "improved by strangers, and given away without condition." >> "$OUTPUT"
echo "One day, I hope to contribute to that tradition by building" >> "$OUTPUT"
echo "$BUILD — and releasing it freely, so that someone else" >> "$OUTPUT"
echo "can stand on my shoulders the way I stand on the shoulders" >> "$OUTPUT"
echo "of those who came before me." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a licence. It is a promise." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "                              — $(whoami), $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  [OK] Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"

# --- Display the manifesto using cat ---
# cat reads the file and prints it to the terminal
cat "$OUTPUT"

echo ""
echo "============================================================"
