;; init-cquery.el : Initialise cquery for cc-mode


(use-package init-cquery-exec)

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
	     :commands lsp-cquery-enable
	     :init (add-hook 'c-mode-hook #'cquery//enable)
	     (add-hook 'c++-mode-hook #'cquery//enable))

(provide 'init-cquery)
