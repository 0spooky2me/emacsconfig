;;; init.el --- Configure Kevin's Emacs settings

;;; Commentary:

;;; Code:
;; Add subdirectory ./lisp/ to our load path, so we can (use-package [file])
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("meta-packages"
									   "mode-packages"
									   "backend-packages"
									   "frontend-packages"
									   "ui-packages")))

;; Before loading anything else, load our custom settings so Emacs is happy
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

;; Load meta-packages; packages other packages depend on
;; Note: Must be bootstrapped because use-package is unavailable at this point
(require 'init-meta-packages)

;; Load mode-packages; packages for installing/configuring specific modes
(use-package init-mode-packages)

;; Load backend-packages; packages which provide non-ui support for editing
(use-package init-backend-packages)

;; Load frontend-packages; packages which provide ui support for editing
(use-package init-frontend-packages)

;; Load simple UI tweaks
(use-package init-ui-packages)
;;; init.el ends here
