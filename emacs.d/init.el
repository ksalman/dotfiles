(package-initialize)
;; Do we need the following two lines?
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq custom-safe-themes t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)


(require 'init-elpa)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
	(package-install 'use-package))

(require 'init-evil)
(require 'init-powerline)

(use-package helm
	:ensure t
	:config
	(helm-mode 1))

(use-package solarized-theme
	:ensure t)

(load-theme 'solarized-dark)
