#!/bin/bash
set -e

CONFIG_DIR="${HOME}/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "${CONFIG_DIR}"

cp -r "${SCRIPT_DIR}"/* "${CONFIG_DIR}/"

echo "Neovim configuration installed to ${CONFIG_DIR}"
echo "Start nvim to automatically install plugins via lazy.nvim"