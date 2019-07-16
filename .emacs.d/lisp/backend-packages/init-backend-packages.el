;;; init-backend-packages.el --- Configure non-ui backends

;;; Commentary:
;; Configure backends to other packages
;; These packages should depend only on modes and meta-packages

;;; Code:
;; Load CCLS backend and configuration
(use-package init-ccls)

;; Load LSP modules and configuration
(use-package init-lsp)

;; Load clang-format and configuration
(use-package init-clang-format)

(provide 'init-backend-packages)
;;; init-backend-packages.el ends here
