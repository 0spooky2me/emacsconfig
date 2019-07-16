;;; init-web-mode.el --- Setup web-mode configuration

;;; Commentary:

;; We associate web-mode only with .html and .htm files.
;; Because I have only been working with Meteor.js, I associate all .html files with ctemplate.

;;; Code:

;; Load and configure web-mode
(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" . web-mode)
  :config (setq web-mode-engines-alist
		'(("ctemplate" . "\\.html?\\'"))))

(provide 'init-web-mode)
;;; init-web-mode.el ends here
