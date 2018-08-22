;;; init-lsp.el : Initialize and cong Language Server Protocol modules

(use-package lsp-mode
  :ensure t
  :config (use-package lsp-imenu)
  :hook (lsp-after-open . lsp-enable-imenu))

;; Load and configure company-lsp backend
(use-package company-lsp
  :ensure t
  :after company
  :defines company-backends
  :init (push 'company-lsp company-backends)
  :config
  (setq company-lsp-cache-candidates nil
	company-lsp-enable-recompletion t))

;; Load and configure UI elements for LSP, currently only Flycheck and Docs
(use-package lsp-ui
  :ensure t
  :hook ((lsp-mode . lsp-ui-mode)
	 (lsp-mode . flycheck-mode))
  :config
  (setq lsp-ui-sideline-enable nil
	lsp-ui-imenu-enable nil
	lsp-ui-peek-enable nil
	lsp-ui-doc-include-signature t))

(provide 'init-lsp)
