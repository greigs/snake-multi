#!/bin/bash
  PROMPT="$1"
  MAX_RETRIES=10
  ATTEMPT=0
  codex exec -p local --full-auto "$PROMPT"
  while [ $? -ne 0 ] && [ $ATTEMPT -lt $MAX_RETRIES ]; do
    ATTEMPT=$((ATTEMPT + 1))
    echo "Attempt $ATTEMPT of $MAX_RETRIES - resuming in 10s..."
    sleep 10
    codex exec resume --last -p local --full-auto
  done
