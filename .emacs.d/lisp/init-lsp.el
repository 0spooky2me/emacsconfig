;;; init-lsp.el --- Setup LSP modules

;;; Commentary:

;; This package is used to install, initialize, and configure packages relating to
;; LSP client behaviour.

;;; Code:

;; Load and configure lsp-mode package
(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (setq lsp-auto-guess-root t
	lsp-prefer-flymake nil)
  :hook
  ((c-mode c++-mode objc-mode) . lsp)
  :config
  (require 'lsp-clients))

;; Load and configure company-lsp backend for company-mode
(use-package company-lsp
  :ensure t
  :after company
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates nil
	company-lsp-enable-recompletion t))

;; Load and configure UI elements for LSP, disable most of sideline
(use-package lsp-ui
  :ensure t
  :config
  ;; Config docs
  (setq lsp-eldoc-render-all t
	lsp-ui-doc-include-signature t)
  ;; Config peek
  (setq lsp-ui-peek-always-show t)
  ;; Config sideline
  (setq lsp-ui-sideline-show-code-actions nil
	lsp-ui-sideline-show-hover nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
