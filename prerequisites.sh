#!/usr/bin/env bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() {
    printf '%b%s%b\n' "${YELLOW}" "$1" "${NC}"
}

die() {
    printf '%b%s%b\n' "${RED}" "$1" "${NC}" >&2
    exit 1
}

install_macos() {
    info "Detected macOS. Installing prerequisites with Homebrew..."

    if ! command -v brew >/dev/null 2>&1; then
        info "Homebrew is not installed. Installing Homebrew..."
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Homebrew is installed in /opt/homebrew on Apple Silicon and /usr/local
    # on Intel Macs. The current shell may not have either location in PATH yet.
    if [ -x /opt/homebrew/bin/brew ]; then
        BREW_BIN=/opt/homebrew/bin/brew
    elif [ -x /usr/local/bin/brew ]; then
        BREW_BIN=/usr/local/bin/brew
    else
        BREW_BIN="$(command -v brew)"
    fi

    eval "$("${BREW_BIN}" shellenv)"

    info "Installing development tools..."
    "${BREW_BIN}" install git curl neovim node python ripgrep fd clang-format

    printf 'Neovim: %s\n' "$(nvim --version | head -1)"
    printf 'Node.js: %s\n' "$(node --version)"
    printf '%bAll macOS prerequisites installed successfully!%b\n' "${GREEN}" "${NC}"
}

linux_asset_arch() {
    case "$(uname -m)" in
        x86_64|amd64) printf 'x86_64' ;;
        aarch64|arm64) printf 'arm64' ;;
        *) die "Unsupported Linux architecture: $(uname -m)" ;;
    esac
}

node_asset_arch() {
    case "$(uname -m)" in
        x86_64|amd64) printf 'x64' ;;
        aarch64|arm64) printf 'arm64' ;;
        *) die "Unsupported Linux architecture: $(uname -m)" ;;
    esac
}

install_linux() {
    export DEBIAN_FRONTEND=noninteractive

    if ! command -v apt-get >/dev/null 2>&1; then
        die "This Linux distribution is not supported yet (apt-get is required)."
    fi

    info "Detected Linux. Installing system prerequisites..."
    sudo apt-get update

    info "Installing build tools..."
    sudo apt-get install -y build-essential git curl wget

    info "Installing Neovim..."
    local nvim_minor=0
    if command -v nvim >/dev/null 2>&1; then
        nvim_minor="$(nvim --version | head -1 | sed -n 's/.*v[0-9][0-9]*\.\([0-9][0-9]*\).*/\1/p')"
        nvim_minor="${nvim_minor:-0}"
    fi

    if [ "${nvim_minor}" -lt 11 ]; then
        local nvim_arch nvim_archive nvim_dir
        nvim_arch="$(linux_asset_arch)"
        nvim_dir="nvim-linux-${nvim_arch}"
        nvim_archive="/tmp/${nvim_dir}.tar.gz"
        wget -q --show-progress -O "${nvim_archive}" \
            "https://github.com/neovim/neovim/releases/latest/download/${nvim_dir}.tar.gz"
        sudo rm -rf "/opt/${nvim_dir}"
        sudo tar -C /opt -xzf "${nvim_archive}"
        sudo ln -sf "/opt/${nvim_dir}/bin/nvim" /usr/local/bin/nvim
        rm -f "${nvim_archive}"
    fi
    nvim --version | head -1

    info "Installing Node.js 24+..."
    local node_major=0
    if command -v node >/dev/null 2>&1; then
        node_major="$(node --version | sed 's/^v//' | cut -d. -f1)"
    fi

    if [ "${node_major}" -lt 24 ]; then
        local node_version node_arch node_archive
        node_version="v24.13.1"
        node_arch="$(node_asset_arch)"
        node_archive="/tmp/node-linux-${node_arch}.tar.xz"
        wget -q --show-progress -O "${node_archive}" \
            "https://nodejs.org/dist/${node_version}/node-${node_version}-linux-${node_arch}.tar.xz"
        sudo rm -rf /opt/node
        sudo mkdir -p /opt/node
        sudo tar -C /opt/node --strip-components=1 -xf "${node_archive}"
        sudo ln -sf /opt/node/bin/node /usr/local/bin/node
        sudo ln -sf /opt/node/bin/npm /usr/local/bin/npm
        sudo ln -sf /opt/node/bin/npx /usr/local/bin/npx
        rm -f "${node_archive}"
    fi
    node --version

    info "Installing Python and clipboard dependencies..."
    sudo apt-get install -y python3 python3-pip python3-venv unzip xclip

    info "Installing optional tools..."
    sudo apt-get install -y ripgrep fd-find 2>/dev/null || printf 'Optional tools skipped\n'

    info "Installing Zsh and clang-format..."
    sudo apt-get install -y zsh
    sudo apt-get install -y clang-format || sudo apt-get install -y clang-format-14 || \
        printf 'clang-format installation skipped\n'

    printf '%bAll Linux prerequisites installed successfully!%b\n' "${GREEN}" "${NC}"
}

case "$(uname -s)" in
    Darwin) install_macos ;;
    Linux) install_linux ;;
    *) die "Unsupported operating system: $(uname -s)" ;;
esac
