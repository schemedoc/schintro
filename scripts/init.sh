#!/bin/sh
set -eu
cd "$(dirname "$0")"
cd ..
echo "Entering directory '$PWD'"

download() {
    basename="$1"

    echo "Download $basename"
    find www -type f -delete
    (cd www &&
        wget \
            --mirror \
            --no-host-directories \
            --no-parent \
            --cut-dirs=4 \
            --reject 'index.html*' \
            "https://www.cs.utexas.edu/ftp/garbage/cs345/$basename/" \
            >"../misc/$basename.log" 2>&1)
    rm -f www/robots.txt
    git add misc www
    git commit -m "Download $basename"
}

mkdir -p misc www
download schintro-v13
download schintro-v14
