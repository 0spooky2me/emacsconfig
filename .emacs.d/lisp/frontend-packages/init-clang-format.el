;;; init-clang-format.el --- Initialise clang-format for cc-mode

;;; Commentary:

;;; Code:
;; Just add hotkeys for clang-format to the c-mode-base-map
(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
			  ("C-c C-f" . clang-format-region)
			  ("C-c C-v" . clang-format-buffer)))

(provide 'init-clang-format)
;;; init-clang-format.el ends here
