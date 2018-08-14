;;; init-ui.el : Configure universal UI preferences

;; Numbering
(setq-default fill-column 100)
(setq column-number-mode t)
(setq line-number-mode t)

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Misc
(setq inhibit-startup-screen t)
(show-paren-mode t)

(provide 'init-ui)
