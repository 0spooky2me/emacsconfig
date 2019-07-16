;; init-package.el : Initialise package configurations

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;; Set up load path so we can override it
(package-initialize)
(setq package-enable-at-startup nil) ; To prevent initialising twice

(let*
    ;; We likely do not need this, but if we are on deprecated systems, try to use http
    ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		  (not (gnutls-available-p))))
     (proto (if no-ssl "http" "https")))
  ;; Override "gnu" in order to use https when possible
  (setq package-archives (list (cons "gnu" (concat proto "://elpa.gnu.org/packages/"))
			       (cons "melpa" (concat proto "://melpa.org/packages/")))))

;; Most configuration universally needs use-package so provide it everywhere
(unless (package-installed-p 'use-package)
  ;; Refresh to get use-package from melpa
  (package-refresh-contents)
  (package-install 'use-package)
  ;; Refresh again to pull more data.
  ;;Unsure why this is, but spinner package won't appear without this.
  (package-refresh-contents))
(eval-when-compile
  (require 'use-package))

(provide 'init-package)
