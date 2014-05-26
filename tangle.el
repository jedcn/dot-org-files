(require 'find-lisp)
(require 'ob-tangle)

(defun jedcn/tangle-dot-org-file (file)
  (org-babel-tangle-file file))

(mapc 'jedcn/tangle-dot-org-file (find-lisp-find-files "." "\\.org$"))
