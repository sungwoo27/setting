#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}====================================${NC}"
echo -e "${GREEN}  Dotfiles Installation Script${NC}"
echo -e "${GREEN}====================================${NC}"
echo ""

INSTALL_NVIM=false
INSTALL_ZSH=false
INSTALL_ALL=false

if [ $# -eq 0 ]; then
    INSTALL_ALL=true
else
    for arg in "$@"; do
        case $arg in
            --nvim)
                INSTALL_NVIM=true
                shift
                ;;
            --zsh)
                INSTALL_ZSH=true
                shift
                ;;
            --all)
                INSTALL_ALL=true
                shift
                ;;
            *)
                echo -e "${RED}Unknown option: $arg${NC}"
                echo "Usage: $0 [--nvim] [--zsh] [--all]"
                echo "  --nvim    Install only Neovim configuration"
                echo "  --zsh     Install only Zsh configuration"
                echo "  --all     Install all configurations (default)"
                exit 1
                ;;
        esac
    done
fi

echo -e "${YELLOW}Installing prerequisites...${NC}"
bash "$(dirname "$0")/prerequisites.sh"

if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_NVIM" = true ]; then
    if [ -d "$(dirname "$0")/nvim" ]; then
        echo -e "${YELLOW}Installing Neovim configuration...${NC}"
        bash "$(dirname "$0")/nvim/install.sh"
        echo -e "${GREEN}Neovim configuration installed successfully.${NC}"
    else
        echo -e "${RED}Neovim directory not found. Skipping...${NC}"
    fi
fi

if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_ZSH" = true ]; then
    if [ -d "$(dirname "$0")/zsh" ]; then
        echo -e "${YELLOW}Installing Zsh configuration...${NC}"
        bash "$(dirname "$0")/zsh/install.sh"
        echo -e "${GREEN}Zsh configuration installed successfully.${NC}"
    else
        echo -e "${RED}Zsh directory not found. Skipping...${NC}"
    fi
fi

echo ""
echo -e "${GREEN}====================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}====================================${NC}"
echo ""
echo "Next steps:"
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_ZSH" = true ]; then
    echo "  1. Restart your terminal or run 'source ~/.zshrc'"
    echo "  2. Run 'p10k configure' to customize your prompt"
fi
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_NVIM" = true ]; then
    echo "  3. Run 'nvim' to start Neovim (plugins will auto-install via lazy.nvim)"
fi