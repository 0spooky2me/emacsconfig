;; init-org.el : Initialize and config org-mode

(use-package org-bullets
  :ensure t
  :config
  (setq org-bullets-bullet-list
	'("◉" "◎" "⚫" "○" "✪" "◇"))
  :hook
  (org-mode . org-bullets-mode))

(provide 'init-org)
