#!/bin/bash

DIR=$1
FILE=$2
pushd $DIR
emacs --no-init-file --no-site-file --batch \
      --eval "(progn
                (require 'ob-tangle)
                (org-babel-load-file \"$FILE\"))"
popd
