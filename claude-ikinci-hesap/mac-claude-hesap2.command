#!/bin/bash
# 2. Claude hesabi icin ayri pencere (ayri oturum/veri klasoru)
# Ilk kullanimdan once bir kez: chmod +x mac-claude-hesap2.command
DATA="${CLAUDE_HESAP2_DIR:-$HOME/claude-hesap2}"
mkdir -p "$DATA"
open -n -a "Claude" --args --user-data-dir="$DATA"
