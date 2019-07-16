;;; init-smart-tabs.el --- Initialise SmartTabs

;;; Commentary:

;;; Code:
(use-package smart-tabs-mode
  :ensure t
  :config
  (smart-tabs-insinuate 'c))

(provide 'init-smart-tabs)
;;; init-smart-tabs.el ends here
