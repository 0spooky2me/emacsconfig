;;; init.el --- Configure Kevin's Emacs settings

;;; Commentary:

;;; Code:
;; Add subdirectory ./lisp/ to our load path, so we can (use-package [file])
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Before loading anything else, load our custom settings so Emacs is happy
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

;; Bootstrap package, no guarantee we have use-package.  We need use-package to auto-load packages we don't have.
;; Add this comment to prevent (package-initialize) from being added to this file (emacs25)
(require 'init-package)

;; Load simple UI tweaks
(use-package init-ui)

;; Load org-mode configuration
(use-package init-org)

;; Load term package and configuration
(use-package init-term)

;; Load yasnippet and configuration
(use-package init-yasnippet)

;; Load flycheck and configuration
(use-package init-flycheck)

;; Load company mode and configuration
(use-package init-company)

;; Load LSP modules and configuration
(use-package init-lsp)

;; Load CCLS backend and configuration
(use-package init-ccls)

;; Load clang-format and configuration
(use-package init-clang-format)

;; Load magit and configuration
(use-package init-magit)
;;; init.el ends here
