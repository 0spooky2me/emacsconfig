;;; init-term.el ; Initialize and config terminal settings

;; Term is used for ansi-term as well and is always provided.
(use-package term
  :config
  ;; Set term-buffer-maximum-size to 0 for infinite terminal buffer
  (setq term-buffer-maximum-size 0))

(provide 'init-term)
