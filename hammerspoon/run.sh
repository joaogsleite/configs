#!/bin/sh

func="$1"
shift

args=""
sep=""

for arg in "$@"; do
  case "$arg" in
    # integers or floats
    ''|*[!0-9.]*)
      case "$arg" in
        true|false) args="$args$sep$arg" ;;
        *)          args="$args$sep\"$arg\"" ;;
      esac
      ;;
    *)
      # pure number
      args="$args$sep$arg"
      ;;
  esac
  sep=", "
done

/opt/homebrew/bin/hs -c "$func($args)"
