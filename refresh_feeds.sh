#!/bin/bash

rm -rf feeds/*.index feeds/*.targetindex feeds/*.tmp packages/feeds
git clone https://github.com/CHN-beta/rkp-ipid package/rkp-ipid
git clone https://github.com/Zxilly/UA2F package/UA2F
./scripts/feeds update -i
./scripts/feeds install -a
git add feeds package/feeds

if [ -n "$(git diff --cached)" ]; then
    git commit -m "refresh feeds"
fi

exit 0
