#!/usr/bin/env bash

require_mise() {
  # Try to activate mise if it was just installed but not yet in PATH
  if ! command -v mise &>/dev/null; then
    if [[ -x "$HOME/.local/bin/mise" ]]; then
      export PATH="$HOME/.local/bin:$PATH"
      eval "$("$HOME/.local/bin/mise" activate bash)"
    fi
  fi

  if ! command -v mise &>/dev/null; then
    echo "mise is not installed. Skipping."
    exit 0
  fi
}

mise_install() {
  local pkg="$1"
  require_mise

  if mise list "$pkg" 2>/dev/null | grep -q "$pkg"; then
    echo "$pkg is already installed. Skipping."
    return 0
  fi

  mise use --global "${pkg}@latest"
}
