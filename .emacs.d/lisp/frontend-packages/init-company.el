;; init-company.el : Initialize and config company

;; Always automatically load company mode
(use-package company
  :ensure t
  :diminish company-mode
  :commands global-company-mode
  :hook (after-init . global-company-mode)
  ;; Set tab to finish auto-completion
  :bind (:map company-active-map
	      ("TAB" . company-complete-common))
  ;; Company configuration:
  ;; Display 12 options
  ;; Wait .2 seconds before displaying
  ;; Wait for 2 characters before displaying
  :config
  (setq company-tooltip-align-annotations t
	company-tooltip-limit 12
	company-idle-delay .2
	company-minimum-prefix-length 2))

(provide 'init-company)
