#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Installing system prerequisites...${NC}"

sudo apt-get update

echo -e "${YELLOW}Installing build tools...${NC}"
sudo apt-get install -y build-essential git curl wget

echo -e "${YELLOW}Installing Neovim...${NC}"
if ! command -v nvim &> /dev/null || [ "$(nvim --version | head -1 | grep -o 'v[0-9]\\+\\.[0-9]\\+' | cut -d. -f2)" -lt 11 ]; then
    echo "Installing Neovim 0.11+ from official release..."
    wget -q --show-progress -O /tmp/nvim-linux-x86_64.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf /tmp/nvim-linux-x86_64.tar.gz
    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    rm -f /tmp/nvim-linux-x86_64.tar.gz
fi
nvim --version | head -1

echo -e "${YELLOW}Installing Node.js 24+...${NC}"
NODE_VERSION="v24.13.1"
wget -q --show-progress -O /tmp/node-linux-x64.tar.xz "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"
sudo rm -rf /opt/node
sudo mkdir -p /opt/node
sudo tar -C /opt/node --strip-components=1 -xf /tmp/node-linux-x64.tar.xz
sudo ln -sf /opt/node/bin/node /usr/local/bin/node
sudo ln -sf /opt/node/bin/npm /usr/local/bin/npm
sudo ln -sf /opt/node/bin/npx /usr/local/bin/npx
rm -f /tmp/node-linux-x64.tar.xz
node --version

echo -e "${YELLOW}Installing Python dependencies...${NC}"
sudo apt-get install -y python3 python3-pip python3-venv unzip xclip

echo -e "${YELLOW}Installing C compiler for Treesitter...${NC}"
sudo apt-get install -y gcc g++

echo -e "${YELLOW}Installing optional tools...${NC}"
sudo apt-get install -y ripgrep fd-find 2>/dev/null || echo "Optional tools skipped"

echo -e "${YELLOW}Installing Zsh prerequisites...${NC}"
sudo apt-get install -y zsh

echo -e "${YELLOW}Installing clang-format...${NC}"
sudo apt-get install -y clang-format || sudo apt-get install -y clang-format-14 || echo "clang-format installation skipped"

echo -e "${GREEN}All prerequisites installed successfully!${NC}"
