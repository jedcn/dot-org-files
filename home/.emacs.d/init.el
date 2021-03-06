
;;
;; Do not modify this file!
;;
;; It is generated from init.org
;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq jedcn-explicit-env-path
      (concat "/opt/boxen/rbenv/shims:/opt/boxen/nodenv/shims:"
              "/usr/bin:/bin:/usr/sbin:/sbin:"
              "/usr/local/bin:/usr/local/share/npm/bin"))
(defun jedcn-sync-env-path-and-exec-path (desired-path)
  "Sets exec-path and env 'PATH' based on DESIRED-PATH"
  (setenv "PATH" desired-path)
  (setq exec-path (split-string desired-path ":")))
(jedcn-sync-env-path-and-exec-path jedcn-explicit-env-path)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq magit-last-seen-setup-instructions "1.4.0")
(require 'magit)

(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(autoload 'magit-status-fullscreen "magit")

(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))
     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

(defalias 'jedcn-git-blame 'vc-annotate)

(setq magit-diff-refine-hunk 'all)

(setq org-startup-folded 'showeverything)
(setq org-hide-leading-stars 'hidestars)
(setq org-src-fontify-natively t)

(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setq coffee-tab-width 2)

(setq js-indent-level 2)

(defun my-web-mode-hook ()
  "Hooks for web-mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-/") 'company-complete)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "M-n") nil)
     (define-key company-active-map (kbd "M-p") nil)
     (define-key company-active-map (kbd "C-n") #'company-select-next)
     (define-key company-active-map (kbd "C-p") #'company-select-previous)))

(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)
(global-set-key (kbd "M-t") 'projectile-find-file)

(diminish 'projectile-mode)
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))

(require 'yasnippet)
(setq yas-snippet-dirs
      (concat user-emacs-directory "snippets"))
(yas-global-mode 1)

(defun my-sh-mode-hook ()
  "Hook for sh-mode."
  (setq sh-basic-offset 2
        sh-indentation 2))
(add-hook 'sh-mode-hook  'my-sh-mode-hook)

(setq mac-command-modifier 'meta)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(defalias 'yes-or-no-p 'y-or-n-p)

(load-theme 'sanityinc-tomorrow-night t)

(if window-system
    (set-face-attribute 'default nil :font "Menlo-18"))

(setq line-number-mode t)
(setq column-number-mode t)

(defun highlight-current-line ()
  (hl-line-mode t))
(add-hook 'prog-mode-hook 'highlight-current-line)
(add-hook 'text-mode-hook 'highlight-current-line)

(tool-bar-mode -1)

(show-paren-mode 1)

(setq jedcn-remove-trailing-whitespace-on-save t)

(defun remove-trailing-whitespace ()
  "Perform a bunch of safe operations on the whitespace content of a buffer."
  (interactive)
  (if (equal jedcn-remove-trailing-whitespace-on-save t)
      (progn
        (untabify (point-min) (point-max))
        (delete-trailing-whitespace)
        (set-buffer-file-coding-system 'utf-8))))

(add-hook 'before-save-hook 'remove-trailing-whitespace)

(defun jedcn-toggle-remove-trailing-whitespace-on-save ()
  "Toggle whether or not whitespace will be removed on save"
  (interactive)
  (if jedcn-remove-trailing-whitespace-on-save
      (progn
        (message "The next save will *not* remove trailing whitespace.")
        (setq jedcn-remove-trailing-whitespace-on-save nil))
    (progn
      (message "The next save will remove trailing whitespace.")
      (setq jedcn-remove-trailing-whitespace-on-save t))))

(setq visible-bell t)

(setq inhibit-startup-message t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(setq require-final-newline t)

(setq save-interprogram-paste-before-kill t)

(setq indent-tabs-mode nil)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(setq make-backup-files nil)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\M-P" 'execute-extended-command)

(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(setq linum-format " %4d ")

(global-set-key (kbd "C-M-+") 'er/expand-region)
(global-set-key (kbd "C-M--") 'er/contract-region)

(defconst jedcn-eval-buffer-commands
  '(("js" . "/opt/boxen/nodenv/shims/node")
    ("rb" . "/opt/boxen/rbenv/shims/ruby")
    ("py" . "/opt/boxen/pyenv/shims/python")
    ("php" . "/usr/bin/php")))

(defconst jedcn-eval-buffer-name "*EVALBUFFER*")

(defun jedcn-eval-buffer ()
  "Evaluate the current buffer and display the result in a buffer."
  (interactive)
  (save-buffer)
  (let* ((file-name (buffer-file-name (current-buffer)))
         (file-extension (file-name-extension file-name))
         (buffer-eval-command-pair (assoc file-extension jedcn-eval-buffer-commands)))
    (if buffer-eval-command-pair
        (let ((command (concat (cdr buffer-eval-command-pair) " " file-name)))
          (shell-command-on-region (point-min) (point-max) command jedcn-eval-buffer-name nil)
          (pop-to-buffer jedcn-eval-buffer-name)
          (other-window 1)
          (jedcn-eval-buffer-pretty-up-errors jedcn-eval-buffer-name)
          (message ".."))
      (message "Unknown buffer type"))))

(defun jedcn-eval-buffer-pretty-up-errors (buffer)
  "Fix up the buffer to highlight the error message (if it contains one)."
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (let ((pos (search-forward-regexp "\\.rb:[0-9]+:\\(in.+:\\)? +" (point-max) t)))
      (if pos (progn
                (goto-char pos)
                (insert-string "\n\n")
                (end-of-line)
                (insert-string "\n"))))))

(defun jedcn-clear-eval-buffer ()
  (interactive)
  (save-excursion
    (set-buffer jedcn-eval-buffer-name)
    (kill-region (point-min) (point-max))))

(defun jedcn-eval-or-clear-buffer (n)
  (interactive "P")
  (cond ((null n) (jedcn-eval-buffer))
        (t (jedcn-clear-eval-buffer))))

(server-start)
