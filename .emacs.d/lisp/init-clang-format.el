;; init-clang-format.el : Initialise clang-format for cc-mode

;; We must have CC mode (mode for editing C, C++, Java, etc.) in order to access c-mode-base-map
(use-package cc-mode)

;; Just add hotkeys for clang-format to the c-mode-base-map
(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
	      ("C-c C-f" . clang-format-region)
	      ("C-c C-v" . clang-format-buffer)))

(provide 'init-clang-format)
