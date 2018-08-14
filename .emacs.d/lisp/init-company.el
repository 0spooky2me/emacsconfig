;; init-company.el : Initialize and config company

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-lsp))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
