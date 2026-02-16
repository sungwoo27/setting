# Zsh Configuration

This module contains Zsh configuration with Oh My Zsh and Powerlevel10k theme.

## Prerequisites

- Zsh shell (installed via prerequisites.sh)
- Git (for cloning plugins)
- curl (for Oh My Zsh installation)

## Installation

### Option 1: Using the root install script
```bash
cd ~/setting
./install.sh --zsh
```

### Option 2: Manual installation
```bash
# Install prerequisites first
cd ~/setting
./prerequisites.sh

# Install Zsh configuration
cd zsh
./install.sh
```

## What Gets Installed

The install script:
1. Installs Oh My Zsh (if not already installed)
2. Installs Powerlevel10k theme
3. Installs custom Zsh plugins:
   - zsh-syntax-highlighting
   - zsh-autosuggestions
4. Copies configuration files to home directory:
   - `.zshrc` - Main Zsh configuration
   - `.p10k.zsh` - Powerlevel10k theme configuration
   - `.env` - Environment variables (if present)

## Configuration Files

- `.zshrc` - Main configuration with Oh My Zsh settings
- `.p10k.zsh` - Powerlevel10k prompt customization
- `.env` - Custom environment variables

## Plugins

The following Oh My Zsh plugins are enabled:

### Standard Plugins (built into Oh My Zsh)
- `git` - Git aliases and completion
- `z` - Directory jumping (replaces autojump)
- `extract` - Extract any archive with `extract` command
- `docker` - Docker aliases and completion
- `docker-compose` - Docker Compose aliases and completion

### Custom Plugins (installed separately)
- `zsh-syntax-highlighting` - Command syntax highlighting
- `zsh-autosuggestions` - Fish-like autosuggestions

## Post-Installation

1. Change default shell to Zsh:
   ```bash
   chsh -s $(which zsh)
   ```
   (You may need to log out and back in for this to take effect)

2. Configure Powerlevel10k prompt:
   ```bash
   p10k configure
   ```

3. Source the configuration:
   ```bash
   source ~/.zshrc
   ```

## Customization

- Edit `~/.zshrc` to change Oh My Zsh settings or add aliases
- Run `p10k configure` to reconfigure the prompt theme
- Add custom functions to `~/.oh-my-zsh/custom/`

## Troubleshooting

If the prompt looks broken:
- Install a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and set it as your terminal font
- Run `p10k configure` and select the correct font options