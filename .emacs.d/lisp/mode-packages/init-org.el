;;; init-org.el --- Initialize and config org-mode

;;; Commentary:

;;; Code:
(use-package org
  :ensure t
  ;; windmove conflicts with org, so fix hooks
  :hook ((org-shiftup-final . windmove-up)
		 (org-shiftleft-final . windmove-left)
		 (org-shiftdown-final . windmove-down)
		 (org-shiftright-final . windmove-right)))

(use-package org-bullets
  :ensure t
  :after (org)
  :config (setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "✪" "◇"))
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)
;;; init-org.el ends here
