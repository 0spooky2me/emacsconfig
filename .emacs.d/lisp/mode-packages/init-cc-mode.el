;;; init-cc-mode.el --- Initialise cc-mode

;;; Commentary:

;;; Code:
(use-package cc-mode
  :ensure t
  :config
  (setq-default tab-width 4)
  (defvaralias 'c-basic-offset 'tab-width))

(provide 'init-cc-mode)
;;; init-cc-mode.el ends here
