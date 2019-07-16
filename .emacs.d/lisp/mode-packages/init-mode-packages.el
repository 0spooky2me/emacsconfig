;;; init-mode-packages.el --- Configure modes

;;; Commentary:
;; Configure editing modes

;;; Code:
;; Load org-mode configuration
(use-package init-org)

;; Load term package and configuration
(use-package init-term)

;; Load web-mode and configuration
(use-package init-web-mode)

;; Load magit and configuration
(use-package init-magit)

(provide 'init-mode-packages)
;;; init-mode-packages.el ends here
