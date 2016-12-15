#!/bin/sh

/usr/sbin/groupadd hoge -g 200

find /var/cofu-users/sample -name "*" -type f | xargs -I{} -n 1 cofu -var-file={} /var/cofu-users/recipe.lua
