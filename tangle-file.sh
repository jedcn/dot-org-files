#!/bin/bash

FILE=$1
emacs --batch \
      --eval "(progn
                (require 'ob-tangle)
                (org-babel-tangle-file \"$FILE\"))"
