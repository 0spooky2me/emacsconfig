;;; init-yasnippet.el --- Initialize and config yasnippet

;;; Commentary:

;; For use with company-mode.
;;; Code:
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
