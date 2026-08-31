# Setting Repository

Development environment configuration for macOS and Ubuntu 24.04.

## Modules

- **Neovim** - Editor with lazy.nvim, LSP, and Treesitter
- **Zsh** - Shell with Oh My Zsh and Powerlevel10k

## Installation

Supported platforms:

- macOS (Apple Silicon and Intel) using Homebrew
- Ubuntu/Debian Linux (`x86_64` and `arm64`) using apt

```bash
cd ~/setting
./install.sh              # Install all
./install.sh --nvim       # Install only Neovim
./install.sh --zsh        # Install only Zsh
```

## Post-Installation

**Zsh:**
```bash
# Ubuntu/Debian only; macOS already uses Zsh by default
chsh -s "$(command -v zsh)"
p10k configure
source ~/.zshrc
```

**Neovim:**
```bash
nvim                      # Plugins auto-install
:Mason                    # Install LSP servers
:checkhealth              # Verify setup
```

## Structure

```
~/setting/
├── install.sh           # Main installer
├── prerequisites.sh     # System dependencies
├── nvim/                # Neovim config
└── zsh/                 # Zsh config
```

See module READMEs for details.

The installer detects the operating system automatically; a separate macOS
branch is not required. On macOS it installs Homebrew first when necessary.
