#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ -z "${QT_QPA_PLATFORM:-}" ]; then
  if [ -n "${WAYLAND_DISPLAY:-}" ]; then
    export QT_QPA_PLATFORM="wayland"
  else
    export QT_QPA_PLATFORM="xcb"
  fi
fi

if [ -x ".venv/bin/python" ]; then
  exec .venv/bin/python -m codex_usage_widget
fi

exec python3 -m codex_usage_widget
