;; init-clang-format.el : Initialise clang-format for cc-mode

(use-package cc-mode)

(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
	      ("C-c C-f" . clang-format-region)
	      ("C-c C-v" . clang-format-buffer)))

;;(define-key c-mode-base-map (kbd "C-c C-f") 'clang-format-region)
;;(define-key c-mode-base-map (kbd "C-c C-v") 'clang-format-buffer)

;;(global-set-key (kbd "C-c C-f") 'clang-format-region)
;;(global-set-key (kbd "C-c C-v") 'clang-format-buffer)
(provide 'init-clang-format)
