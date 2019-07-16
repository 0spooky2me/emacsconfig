;;; init-meta-packages.el --- Configure packages which other packages depend on

;;; Commentary:
;; Packages configured here should be packages which are dependencies of other packages,
;; their use-package requirements, or their configuration.

;;; Code:
;; Bootstrap package, no guarantee we have use-package.  We need use-package to auto-load packages we don't have.
;; Add this comment to prevent (package-initialize) from being added to this file (emacs25)
(require 'init-package)

;; Load diminish and configuration
;; Load diminish now as use-package commands  may depend on diminish!
(use-package init-diminish)

;; Load yasnippet and configuration
;; Some packages depend on yasnippet
(use-package init-yasnippet)

(provide 'init-meta-packages)
;;; init-meta-packages.el ends here
