# Homebrew MCP

Homebrew tap repository for MCP tools and utilities.

## About

This repository contains Homebrew formulas for various MCP tools and utilities. Using Homebrew makes it easy to install, upgrade, and manage these tools on macOS and Linux systems.

## Available Tools

Currently, this tap provides the following formulas:

- **[mcp-trino](https://github.com/tuannvm/mcp-trino)**: A MCP server for interacting with Trino clusters.
- **[haproxy-mcp-server](https://github.com/tuannvm/haproxy-mcp-server)**: A MCP server for HAProxy management and monitoring.
- **[kafka-mcp-server](https://github.com/tuannvm/kafka-mcp-server)**: A MCP server for Apache Kafka cluster management.

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
# Always update taps first to get the latest formulas
brew update

# Install mcp-trino
brew install mcp-trino

# Install haproxy-mcp-server
brew install haproxy-mcp-server

# Install kafka-mcp-server
brew install kafka-mcp-server
```

### Updating

To update the formulas and tools:

```bash
# Update Homebrew formulas
brew update

# Upgrade specific tools
brew upgrade mcp-trino
brew upgrade haproxy-mcp-server
brew upgrade kafka-mcp-server

# Upgrade all tools from this tap
brew upgrade $(brew list --full-name | grep tuannvm/mcp/)
```

### Troubleshooting

If you encounter a SHA256 mismatch error like this:

```
Error: mcp-trino: SHA256 mismatch
Expected: [old-value]
  Actual: [new-value]
```

The formula in your local Homebrew installation is outdated. Run:

```bash
brew update && brew upgrade
# Or force reinstall specific tools:
brew reinstall mcp-trino
brew reinstall haproxy-mcp-server
brew reinstall kafka-mcp-server
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

Here's the plan to enable Homebrew installation:

1.  **Create the Homebrew Formula (`mcp-trino.rb`):**
    *   Once the tap repository exists, I will create a Ruby file named `mcp-trino.rb` inside it.
    *   This formula will tell Homebrew:
        *   The project's description and homepage (`https://github.com/tuannvm/mcp-trino`).
        *   How to download the correct `.tar.gz` archive for the user's OS (macOS/Linux) and architecture (amd64/arm64) from your GitHub Releases. It will automatically fetch the **latest** release version.
        *   How to extract the `mcp-trino` binary from the archive.
        *   Where to install the binary (Homebrew handles adding it to the PATH).