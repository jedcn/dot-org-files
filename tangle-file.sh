#!/bin/bash

FILE=$1
emacs --no-init-file --no-site-file --batch \
      --eval "(progn
                (require 'ob-tangle)
                (org-babel-tangle-file \"$FILE\"))"
