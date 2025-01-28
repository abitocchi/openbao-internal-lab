#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/init.sh"

log "INFO" "Creating secret with kv engine named foo"
bao kv put -mount=kv foo bar=baz || log "ERROR" "Can't create secret with kv engine named foo"

log "INFO" "Get secret with kv engine named foo"
bao kv get -mount=kv foo || log "ERROR" "Can't get secret with kv engine named foo"

log "INFO" "Creating secret with kv engine name foo-file"
bao kv put -mount=kv foo-file @tests/data/0-data.json || log "ERROR" "Can't create secret with kv engine named foo-file"

log "INFO" "Get secret with kv engine named foo-file"
bao kv get -mount=kv foo-file || log "ERROR" "Can't get secret with kv engine named foo-file"