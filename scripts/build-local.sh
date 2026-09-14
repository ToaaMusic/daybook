#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BIN_NAME="${BIN_NAME:-daybook-custom}"
INSTALL_BIN="${INSTALL_BIN:-$HOME/.local/bin}"
OUTPUT="$INSTALL_BIN/$BIN_NAME"

echo "=> Building '$BIN_NAME' from $REPO_DIR"
( cd "$REPO_DIR" && go build -o "$OUTPUT" ./cmd/daybook )

echo "=> Installed: $OUTPUT"
ls -lh "$OUTPUT"

case ":$PATH:" in
  *":$INSTALL_BIN:"*) ;;
  *)
    echo ""
    echo "Warning: $INSTALL_BIN is not in your PATH."
    echo "Add this to your shell config (e.g. ~/.zshrc):"
    echo "  export PATH=\"\$PATH:$INSTALL_BIN\""
    ;;
esac
