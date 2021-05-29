#!/bin/bash

if ! command -v ack >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    brew install fzf
  fi
fi
