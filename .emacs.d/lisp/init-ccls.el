;; init-ccls.el : Initialise ccls for cc-mode

;; Load auto-generated init-ccls-exec.el
(use-package init-ccls-exec)

;; Only load ccls for c-mode, c++-mode, and objc-mode.  ccls doesn't handle other CC mode languages.
(use-package ccls
  :ensure t
  :hook
  ((c-mode c++-mode objc-mode) .
   (lambda () (require 'ccls) (lsp)))
  :config
  ;; ccls configuration:
  ;; comments 2: This means treat all comments as documentation
  ;; detailedLabel t: This means show the full signature of the candidate
  (setq cquery-initialization-options
	'(:index (:comments 2) :completion (:detailedLabel t))))

(provide 'init-ccls)
