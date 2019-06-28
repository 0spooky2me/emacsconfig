;;; init-expand-region.el --- Initialise expand region

;;; Commentary:

;;; Code:

;; Just add hotkeys for clang-format to the c-mode-base-map
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
	 ("C-+" . er/contract-region)))

(provide 'init-expand-region)
;;; init-expand-region.el ends here
