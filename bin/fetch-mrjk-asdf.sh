#!/bin/bash

# Simple script to generate mise shorthands for mrjk's plugins
# See: https://mise.jdx.dev/configuration.html#mise-shorthands-file-config-mise-shorthands-toml
# Usage:
#   fetch-mrjk-asdf.sh  > ~/.config/mise/shorthands.toml


fetch_gh_topic ()
{
  local topic=$1

  # GitHub API URL
  API_URL="https://api.github.com/search/repositories?q=topic:$topic&per_page=500"
  
  # Fetch repositories and extract name and clone URL
  curl -s "$API_URL" \
    | jq -r '.items[] | "\(.name),\(.clone_url)"' \
    | sed -E 's/asdf-//;s/,/ = "/;s/$/"/'

}

gen_mise_config ()
{
  for topic in $@; do
    echo "# Topic modules: $topic"
    fetch_gh_topic "$topic"
    echo
  done
}

main ()
{
  gen_mise_config "${@-"mrjk-asdf-plugin"}"
}

main "$@"
