;; init-company.el : Initialize and config company

(use-package company
  :ensure t
  :commands global-company-mode
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
	      ("TAB" . company-complete-common))
  :config
  (setq company-tooltip-align-annotations t
	company-tooltip-limit 12
	company-idle-delay .2
	company-minimum-prefix-length 2))

(provide 'init-company)
