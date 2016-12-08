#!/bin/sh

find $USERS_DIR -name "*" -type f | xargs -I{} -n 1 cofu -var-file={} /var/cofu-users/recipe.lua
