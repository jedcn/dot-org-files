
;;
;; Do not modify this file!
;;
;; It is generated from init.org
;;

(global-set-key (kbd "C-c i")
                (lambda()
                  (interactive)
                  (org-babel-load-file "~/.emacs.d/init.org")))

(setq jedcn-explicit-env-path
      (concat "/opt/boxen/rbenv/shims:/opt/boxen/nodenv/shims:"
              "/usr/bin:/bin:/usr/sbin:/sbin:"
              "/usr/local/bin:/usr/local/share/npm/bin"))
(defun jedcn-sync-env-path-and-exec-path (desired-path)
  "Sets exec-path and env 'PATH' based on DESIRED-PATH"
  (setenv "PATH" desired-path)
  (setq exec-path (split-string desired-path ":")))
(jedcn-sync-env-path-and-exec-path jedcn-explicit-env-path)

(setenv "NODENV_VERSION" "v0.10")

(if (file-exists-p "/opt/boxen/homebrew/Cellar/cask/0.7.2/cask.el")
    (require 'cask "/opt/boxen/homebrew/Cellar/cask/0.7.2/cask.el"))
(if (file-exists-p "/usr/local/share/emacs/site-lisp/cask.el")
    (require 'cask "/usr/local/share/emacs/site-lisp/cask.el"))
(cask-initialize)

(setq magit-last-seen-setup-instructions "1.4.0")
(require 'magit)

(global-set-key (kbd "M-g") 'magit-status)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

(setq magit-diff-refine-hunk 'all)

(setq org-startup-folded 'showeverything)
(setq org-hide-leading-stars 'hidestars)
(setq org-src-fontify-natively t)

(setq coffee-tab-width 2)

(setq js-indent-level 2)

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
(diminish 'magit-auto-revert-mode)
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))

(require 'yasnippet)
(setq yas-snippet-dirs
      (concat user-emacs-directory "snippets"))
(yas-global-mode 1)

(setq mac-command-modifier 'meta)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'leuven-theme)

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

(server-start)
