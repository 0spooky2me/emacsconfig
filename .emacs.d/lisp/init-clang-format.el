;; init-clang-format.el : Initialise clang-format for cc-mode

(use-package clang-format)

(global-set-key (kbd "C-c C-f") 'clang-format-region)
(global-set-key (kbd "C-c C-v") 'clang-format-buffer)
(provide 'init-clang-format)
