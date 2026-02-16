# Docker Testing Guide

## Quick Start

Build and run the Docker image to test your dotfiles:

```bash
cd ~/setting

# Build the image
docker build -t dotfiles-test .

# Run and test full installation
docker run --rm -it dotfiles-test

# Or run interactively to test specific parts
docker run --rm -it dotfiles-test bash
```

## Testing Individual Components

```bash
# Test only prerequisites
docker run --rm -it dotfiles-test bash -c "cd ~/setting && ./prerequisites.sh"

# Test only Neovim installation
docker run --rm -it dotfiles-test bash -c "cd ~/setting && ./install.sh --nvim"

# Test only Zsh installation
docker run --rm -it dotfiles-test bash -c "cd ~/setting && ./install.sh --zsh"
```

## Debugging

```bash
# Run with a shell to debug
docker run --rm -it dotfiles-test bash

# Inside the container:
cd ~/setting
ls -la
./install.sh --nvim  # Test specific module
```

## Keep Container for Inspection

If you need to inspect the container after a failed installation, omit `--rm`:

```bash
# Container will persist after exit
docker run -it dotfiles-test bash

# Later, find and remove it
docker ps -a  # Find the container ID
docker rm <container_id>
```

## Clean Build

```bash
# Remove old image and rebuild
docker rmi dotfiles-test
docker build --no-cache -t dotfiles-test .
```

## Notes

- The `--rm` flag automatically removes the container after exit (recommended for testing)
- The image creates a non-root user `tester` to simulate real usage
- Git configuration is pre-set to avoid git prompts
- Scripts are pre-made executable in the image
- The default CMD runs the full installation and starts zsh