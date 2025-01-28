#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/init.sh"

log "INFO" "Configure provider with totp engine #0"
outcome=$(bao write totp/keys/new-user \
    generate=true \
    issuer=OpenBao \
    account_name=user@test.com)
[ "$?" -ne 0 ] && log "ERROR" "Can't configure provider with totp engine #0"
url=$( echo "$outcome" \
    | grep url \
    | awk '{print $2}')
echo "$outcome"

log "INFO" "Configure key with totp engine #0"
outcome=$(bao write totp/keys/new-key url="$url")
[ "$?" -ne 0 ] && log "ERROR" "Can't configure key with totp engine #0"
echo "$outcome"

log "INFO" "Retrieve otp with totp engine #0"
outcome=$(bao read totp/code/new-key)
[ "$?" -ne 0 ] && log "ERROR" "Can't retrieve otp with totp engine #0"
otp=$(echo "$outcome" | grep code | awk '{print $2}')
echo "$outcome"

log "INFO" "Validate code with totp engine #0"
outcome=$(bao write totp/code/new-user code="$otp")
[ "$?" -ne 0 ] && log "ERROR" "Can't validate otp with totp engine #0"
echo "$outcome"


