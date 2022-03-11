#!/usr/bin/env bash
set -eo pipefail

# globals variables
# hook ID, see `- id` for details in .pre-commit-hooks.yaml file
# shellcheck disable=SC2155 # No way to assign to readonly variable in separate lines
readonly SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
# shellcheck source=_common.sh
. "$SCRIPT_DIR/pre-commit-terraform/hooks/_common.sh"

function main {
  common::initialize "$SCRIPT_DIR/pre-commit-terraform/hooks"
  common::parse_cmdline "$@"
  common::passthrough_env_vars
}


[ "${BASH_SOURCE[0]}" != "$0" ] || main "$@"
echo "${ARGS}"
