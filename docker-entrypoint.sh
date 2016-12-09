#!/bin/sh

find /var/cofu-users/sample -name "*" -type f | xargs -I{} -n 1 cofu -var-file={} /var/cofu-users/recipe.lua
