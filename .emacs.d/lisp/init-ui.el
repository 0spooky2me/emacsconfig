;;; init-ui.el --- Configure universal UI preferences

;;; Commentary:

;;; Code:

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
;; Show time in the mode line without load average
(setq display-time-default-load-average nil
      display-time-24hr-format 1)
(display-time-mode 1)
;; Smart mode line
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful
	sml/name-width 24)
  (sml/setup))

;;; Theming
;; Use pseudo Google material theme
(use-package doneburn-theme
  :ensure t
  :config
  (load-theme 'doneburn t))

;;; Misc
;; Remove the startup screen
(setq inhibit-startup-screen t)
;; Highlight paired parentheses.
(show-paren-mode t)
;; Enable windmove
(windmove-default-keybindings)

(provide 'init-ui)
;;; init-ui.el ends here
