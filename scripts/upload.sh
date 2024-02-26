#!/bin/sh
set -eu
cd "$(dirname "$0")"
cd ..
rsync --links -crv www/ tuonela.scheme.org:/production/docs/www/schintro/
