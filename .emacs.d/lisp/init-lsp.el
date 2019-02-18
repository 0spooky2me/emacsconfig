;;; init-lsp.el : Initialize and cong Language Server Protocol modules

;; Load LSP mode package, along with lsp-imenu
(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (setq lsp-auto-guess-root t)
  :hook
  ((c-mode c++-mode objc-mode) . lsp)
  :config
  (require 'lsp-clients))

;; Load and configure company-lsp backend
(use-package company-lsp
  :ensure t
  :after company
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates nil
	company-lsp-enable-recompletion t))

;; Load and configure UI elements for LSP, currently only Flycheck and Docs
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-eldoc-render-all t
	lsp-ui-doc-include-signature t))

(provide 'init-lsp)
