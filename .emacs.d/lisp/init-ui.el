;;; init-ui.el : Configure universal UI preferences

;;; Numbering
;; I like 100 characters per line.
(setq-default fill-column 100)
;; Display the cursor column at all times.
(setq column-number-mode t)
;; Display the cursor line at all times.
(setq line-number-mode t)

;;; GUI
;; Unless we're in MacOS, hide the menubar.  It makes no sense to hide it in MacOS since it's at the very top.
(unless (and (display-graphic-p) (eq system-type 'darwin)) (menu-bar-mode -1))
;; Disable tool bar
(tool-bar-mode -1)
;; Disable scroll bar
(scroll-bar-mode -1)

;;; Misc
;; Remove the startup screen
(setq inhibit-startup-screen t)
;; Highlight paired parentheses.
(show-paren-mode t)

(provide 'init-ui)
