# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Homebrew tap repository (`tuannvm/mcp`) containing formulas for MCP (Model Context Protocol) server tools. Formulas are Ruby files that define how Homebrew installs binary releases from GitHub.

## Common Commands

```bash
# Test a formula locally
brew install --build-from-source ./mcp-trino.rb

# Validate formula syntax
ruby -c mcp-trino.rb

# Audit a formula for Homebrew best practices
brew audit --strict ./mcp-trino.rb

# Test the installed formula
brew test mcp-trino
```

## Formula Structure

Each `.rb` file follows this pattern:
- **Class name**: CamelCase version of the formula filename (e.g., `mcp-trino.rb` → `McpTrino`)
- **Platform/arch blocks**: `on_macos`/`on_linux` with nested `on_intel`/`on_arm` for architecture-specific URLs and SHA256 checksums
- **Install**: Copies the binary to Homebrew's bin directory
- **Test**: Runs `--version` to verify installation

## Updating Formulas

When a new release is published in the upstream repo:
1. Update the `version` field
2. Update all `url` fields with the new version
3. Download each platform/arch tarball and update `sha256` values

The GitHub Actions workflow (`.github/workflows/update-formula.yml`) automates this via `repository_dispatch` or `workflow_dispatch`. It:
- Fetches the latest release tag from the upstream repo
- Downloads all platform/arch tarballs
- Calculates SHA256 checksums
- Updates the formula file and commits

## Triggering Automated Updates

From the upstream repo, trigger an update via:
```bash
gh api repos/tuannvm/homebrew-mcp/dispatches \
  -f event_type=update-formula \
  -f client_payload='{"repository":"tuannvm/mcp-trino","formula":"mcp-trino.rb"}'
```

## Adding a New Formula

1. Create a new `.rb` file following existing formulas as templates
2. Use the same platform/arch block structure
3. Ensure the binary name in `bin.install` matches the tarball contents
4. The automated workflow can create new formulas if triggered with a non-existent formula name
