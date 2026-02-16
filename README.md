# Setting Repository

Ubuntu 24.04 development environment configuration.

## Modules

- **Neovim** - Editor with lazy.nvim, LSP, and Treesitter
- **Zsh** - Shell with Oh My Zsh and Powerlevel10k

## Installation

```bash
cd ~/setting
./install.sh              # Install all
./install.sh --nvim       # Install only Neovim
./install.sh --zsh        # Install only Zsh
```

## Post-Installation

**Zsh:**
```bash
chsh -s $(which zsh)
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
