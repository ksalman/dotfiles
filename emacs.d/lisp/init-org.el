(use-package org
  :ensure t
  :bind ("C-c t A" . org-agenda)
  :config (setq org-agenda-files '("~/work/org/")))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("•")))

(provide 'init-org)
