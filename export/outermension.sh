#!/bin/sh
echo -ne '\033c\033]0;outermension\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/outermension.x86_64" "$@"
