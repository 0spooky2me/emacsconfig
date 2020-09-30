;;; init-lsp.el --- Setup LSP modules

;;; Commentary:

;; This package is used to install, initialize, and configure packages relating to
;; LSP client behaviour.

;;; Code:

;; Load and configure lsp-mode package
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  ((c-mode c++-mode objc-mode) . lsp)
  :config
  (setq gc-cons-threshold (* 100 1000 1000)
		read-process-output-max (* 1024	1024)))

;; Load and configure UI elements for LSP, disable most of sideline
(use-package lsp-ui
  :ensure t
  :bind
  (:map lsp-ui-mode-map
		(([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
		 ([remap xref-find-references] . lsp-ui-peek-find-references)))
  :config
  ;; Config docs
  (setq
   lsp-eldoc-render-all t
   lsp-ui-doc-include-signature t
   lsp-ui-doc-position 'top)
  ;; Config sideline
  (setq lsp-ui-sideline-show-code-actions nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
