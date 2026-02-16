# Neovim Configuration

This module contains Neovim configuration files using lazy.nvim as the plugin manager.

## Prerequisites

- Neovim 0.8+ (installed via prerequisites.sh)
- Git (for cloning lazy.nvim)
- Node.js and npm (for Mason LSP servers)
- GCC/G++ (for Treesitter parsers)
- Python 3 (for some LSP servers)

## Installation

### Option 1: Using the root install script
```bash
cd ~/setting
./install.sh --nvim
```

### Option 2: Manual installation
```bash
# Install prerequisites first
cd ~/setting
./prerequisites.sh

# Install Neovim configuration
cd nvim
./install.sh
```

## What Gets Installed

The install script copies all configuration files to `~/.config/nvim/`:
- `init.lua` - Main entry point
- `lua/config/` - Core configuration (options, mappings, lazy.lua)
- `lua/plugins/` - Plugin specifications
- `lazy-lock.json` - Plugin version lock file

## Plugin Management

This configuration uses **lazy.nvim** for plugin management:
- Plugins are automatically installed on first run
- Plugins are defined in `lua/plugins/*.lua` files
- Run `:Lazy` in Neovim to open the plugin manager UI
- Run `:Lazy sync` to update all plugins

## LSP Servers

Mason automatically installs these LSP servers:
- `clangd` - C/C++ language server
- `pyright` - Python language server

## Treesitter Parsers

The following parsers are automatically installed:
- c, lua, vim, vimdoc, query
- elixir, heex, javascript, html
- llvm, verilog, vhdl

## Post-Installation

1. Start Neovim: `nvim`
2. lazy.nvim will automatically:
   - Clone itself if not present
   - Install all configured plugins
   - Install LSP servers via Mason
   - Install Treesitter parsers
3. Run `:checkhealth` to verify everything is working

## Custom LLVM/MLIR Support

This configuration includes custom filetype detection and syntax highlighting for:
- LLVM IR (.ll files)
- MLIR (.mlir files)
- TableGen (.td files)
- LLVM-lit test files