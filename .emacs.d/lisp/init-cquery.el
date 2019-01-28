;; init-cquery.el : Initialise cquery for cc-mode

;; Load auto-generated init-cquery-exec.el
(use-package init-cquery-exec)

;; Try to enable LSP on cquery, or fail gracefully.
(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

;; Only load cquery for c-mode and c++-mode.  cquery doesn't handle other CC mode languages.
(use-package cquery
  :ensure t
  :commands lsp-cquery-enable
  :hook ((c-mode   . cquery//enable)
	 (c++-mode . cquery//enable))
  :config
  ;; cquery configuration:
  ;; comments 2: This means treat all comments as documentation
  ;; detailedLabel t: This means show the full signature of the candidate
  (setq cquery-extra-init-params
	'(:index (:comments 2) :completion (:detailedLabel t))))

(provide 'init-cquery)
