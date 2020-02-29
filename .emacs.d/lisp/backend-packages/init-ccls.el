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
  ;; index.comments 2: This means treat all comments as documentation
  ;; completion.detailedLabel t: This means show the full signature of the candidate
  ;; request.timeout 30000: Increase time for indexing for big projects.  I can wait!
  (setq ccls-initialization-options
	'(:index (:comments 2
			  :threads 10)
	  :completion (:detailedLabel t)
	  :request (:timeout 30000))))

(provide 'init-ccls)
