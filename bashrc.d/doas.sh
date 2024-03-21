#!/bin/sh
#
# Configure completion for doas
# -c : Complete arguments as if they were commands
#     (eg: `doas emer<tab>` -> `doas emerge`)
#     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
# -f : Complete arguments as if they were directory names (default behaviour)
#     (eg: `doas /bi<tab>` -> `doas /bin/`)
complete -cf doas
