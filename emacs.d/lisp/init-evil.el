(defun air--config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "x"  'execute-extended-command))

(defun air--config-evil ()
	"Configure evil mode"

	(evil-add-hjkl-bindings occur-mode-map 'emacs
	(kbd "/")       'evil-search-forward
	(kbd "n")       'evil-search-next
	(kbd "N")       'evil-search-previous
	(kbd "C-d")     'evil-scroll-down
	(kbd "C-u")     'evil-scroll-up
	(kbd "C-w C-w") 'other-window)

;; Make escape quit everything, whenever possible.
;;  (define-key evil-normal-state-map [escape] 'keyboard-escape-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

	;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
	;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
	;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  )

(use-package evil
  :ensure t
  :init
  	(setq evil-want-C-i-jump nil)
	:commands (evil-mode evil-define-key)
  :config
	(add-hook 'evil-mode-hook 'air--config-evil)
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
		(air--config-evil-leader))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t))

(provide 'init-evil)
