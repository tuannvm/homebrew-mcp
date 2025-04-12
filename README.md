# Homebrew MCP

Homebrew tap repository for MCP tools and utilities.

## About

This repository contains Homebrew formulas for various MCP tools and utilities. Using Homebrew makes it easy to install, upgrade, and manage these tools on macOS and Linux systems.

## Available Tools

Currently, this tap provides the following formulas:

- **mcp-trino**: A MCP server for interacting with Trino clusters.
- *(More tools will be added in the future)*

## Using This Tap

### Prerequisites

- [Homebrew](https://brew.sh/) must be installed on your system

### Adding the Tap

To add this Homebrew tap to your system:

```bash
brew tap tuannvm/mcp
```

### Installing Tools

After adding the tap, you can install any of the available tools:

```bash
# Install mcp-trino
brew install mcp-trino

# Install other tools as they become available
# brew install <tool-name>
```

### Updating

To update the formulas and tools:

```bash
# Update Homebrew formulas
brew update

# Upgrade a specific tool
brew upgrade mcp-trino

# Upgrade all tools from this tap
brew upgrade $(brew list --full-name | grep tuannvm/mcp/)
```

## Supported Platforms

All tools in this tap support:
- macOS (Intel and Apple Silicon)
- Linux (AMD64 and ARM64)

## Development

### Adding New Formulas

To add a new formula to this tap:

1. Create a new `.rb` file in the repository root
2. Follow the Homebrew formula convention using the existing formulas as templates
3. Ensure SHA256 checksums are correctly set for all binaries
4. Test the formula before committing

## License

All tools and formulas in this repository are licensed under the MIT License unless otherwise specified.