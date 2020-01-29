(package-initialize)

;; disable automatic description as this is both annoying and can easily
;; get intero stuck
(global-eldoc-mode -1)

(add-hook 'minibuffer-setup-hook
    (lambda () (setq truncate-lines nil)))

(setq resize-mini-windows t) ; grow and shrink as necessary
(setq max-mini-window-height 10) ; grow up to max of 10 lines

(setq minibuffer-scroll-window t)

;; will search for cabal in these directories
(add-to-list 'exec-path
  "/usr/local/bin")

(add-to-list 'exec-path
  "~/.local/bin")

;; load packages
(load "~/.emacs.d/my-loadpackages.el")

;; cycle through buffers with Ctrl-Tab
(global-set-key (kbd "<C-tab>") 'other-window)

(global-set-key (kbd "M-<left>") 'windmove-left)          ; move to left window
(global-set-key (kbd "M-<right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "M-<up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "M-<down>") 'windmove-down)          ; move to lower window

;; enable visual feedback on selections
;(setq transient-mark-mode t)


(global-set-key (kbd "C-~") 'next-buffer)
(global-set-key (kbd "C-`") 'previous-buffer)

;; line numbers
(global-linum-mode 1)

;; no tabs
(setq c-basic-indent 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; font
;; (set-frame-font "Anonymous Pro-16")

;; scrolling
(setq scroll-step 1
   scroll-conservatively 10000)

;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; parens
(show-paren-mode 1)

;; Warn before you exit emacs!
(setq confirm-kill-emacs 'yes-or-no-p)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; I use version control, don't annoy me with backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-haskell graphviz-dot-mode ein anaconda-mode jedi exec-path-from-shell helm projectile clang-format+ company-glsl babel flycheck-mypy flycheck-irony irony-eldoc irony glsl-mode dante attrap flycheck-color-mode-line flycheck-pos-tip flycheck company popup neotree seti-theme popwin evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq org-confirm-babel-evaluate nil)

(setq org-src-preserve-indentation t)
 (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (haskell . t)
     (ein . t)
     (dot . t)
     ;; (shell   . t)
     (C . t)
     (python . t)))
;; mypy--doesnt' work great
;; (require 'flycheck-mypy)

;; https://stackoverflow.com/questions/16770868/org-babel-doesnt-load-graphviz-editing-mode-for-dot-sources
(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))
;; TODO: actually activate python-mode upon opening .py files
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
;; If you want to use mypy you probably don't want pylint or flake8.
;(add-to-list 'flycheck-disabled-checkers 'python-flake8)
;(add-to-list 'flycheck-disabled-checkers 'python-pycompile) ;; doesnt work
;; (add-to-list 'flycheck-disabled-checkers 'python-pylint)

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; 
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)     

(require 'ein)
(require 'ein-notebook)
(require 'ein-subpackages)
(add-to-list 'load-path "~/.emacs.d/lisp")
