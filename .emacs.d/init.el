;; configure custom settings

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

;; Bootstrap package, no guarantee we have use-package
;; Add this comment to prevent (package-initialize) from being added to this file (emacs25)
(require 'init-package)

(use-package init-ui)

(use-package init-yasnippet)

(use-package init-company)

(use-package init-lsp)

(use-package init-cquery)

(use-package init-clang-format)

(use-package init-magit)
