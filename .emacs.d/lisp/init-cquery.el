;; init-cquery.el : Initialise cquery for cc-mode

(use-package init-cquery-exec)

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
  :ensure t
  :commands lsp-cquery-enable
  :hook ((c-mode   . cquery//enable)
	 (c++-mode . cquery//enable))
  :config
  (setq cquery-extra-init-params
	'(:index (:comments 2) :completion (:detailedLabel t))))

(provide 'init-cquery)
