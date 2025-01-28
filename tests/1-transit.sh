#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/init.sh"

log "INFO" "Encrypting secret with transit engine #0"
outcome=$(bao write transit/encrypt/my-key plaintext=$(echo "my secret data" | base64))
ciphertext=$( echo "$outcome" \
    | grep ciphertext \
    | awk '{print $2}')
[ "$?" -ne 0 ] && log "ERROR" "Can't encrypt secret with transit engine #0"
echo "$outcome"

log "INFO" "Decrypting secret with transit engine #0"
outcome=$(bao write transit/decrypt/my-key ciphertext="$ciphertext")
plaintext=$(echo "$outcome" \
    | grep plaintext \
    | awk '{print $2}' | base64 --decode)
[ "$?" -ne 0 ] && log "ERROR" "Can't decrypt secret with transit engine #0"
echo "$outcome"
echo "$plaintext"
