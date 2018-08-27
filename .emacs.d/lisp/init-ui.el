;;; init-ui.el : Configure universal UI preferences

;; Numbering
(setq-default fill-column 100)
(setq column-number-mode t)
(setq line-number-mode t)

;; GUI
(unless (and (display-graphic-p) (eq system-type 'darwin)) (menu-bar-mode -1))
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Misc
(setq inhibit-startup-screen t)
(show-paren-mode t)

(provide 'init-ui)
