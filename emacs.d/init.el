(package-initialize)
;; Do we need the following two lines?
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setenv "PATH" (concat "c:/Users/ksalman/Documents/putty/;" (getenv "PATH")))

(setq custom-safe-themes t
      visible-bell t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)
(global-linum-mode 1)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(when (window-system)
    (setq mouse-drag-copy-region t)                   ;; Put highlighted region into clipboard
    (global-set-key [mouse-3] 'mouse-yank-at-click)   ;; Right click to paste
    )

(require 'init-elpa)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
	(package-install 'use-package))

(require 'init-org)
(require 'init-evil)
(require 'init-powerline)
(require 'init-fonts)

(use-package helm
	:ensure t
	:config
	(helm-mode 1))

;; Add this package to play around with text
(use-package lorem-ipsum
  :ensure t)

(when (window-system)
    (use-package solarized-theme
	    :ensure t)
    (setq solarized-use-variable-pitch nil)
    (setq solarized-height-plus-1 1.0)
    (setq solarized-height-plus-2 1.0)
    (setq solarized-height-plus-3 1.0)
    (setq solarized-height-plus-4 1.0)
    (setq solarized-high-contrast-mode-line t)
    (setq solarized-distinct-fringe-background t)
    (setq solarized-high-contrast-mode-line t)
    (load-theme 'solarized-dark t)
    )
