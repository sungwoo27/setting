#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building Docker image for dotfiles testing..."
docker build -t dotfiles-test .

echo ""
echo "Docker image built successfully!"
echo ""
echo "To test the installation, run one of:"
echo "  docker run --rm -it dotfiles-test"
echo "  docker run --rm -it dotfiles-test bash"
echo "  docker run --rm -it dotfiles-test bash -c 'cd ~/setting && ./install.sh --nvim'"
echo "  docker run --rm -it dotfiles-test bash -c 'cd ~/setting && ./install.sh --zsh'"
echo ""
echo "See DOCKER_TESTING.md for more options."