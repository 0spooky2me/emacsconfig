;;; init-frontend-packages.el --- Configure frontend support for editing

;;; Commentary:
;; Configure frontend support for editing
;; Packages should providing editing support and not just ui tweaks

;;; Code:
;; Load expand-region configuration
(use-package init-expand-region)

;; Load smart tabs mode and configuration
(use-package init-smart-tabs-mode)

;; Load flycheck and configuration
(use-package init-flycheck)

;; Load company mode and configuration
(use-package init-company)

(provide 'init-frontend-packages)
;;; init-frontend-packages.el ends here
