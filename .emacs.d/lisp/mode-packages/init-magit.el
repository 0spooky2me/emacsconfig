;;; init-magit.el --- Initialise Magit for version control

;;; Commentary:

;;; Code:
(use-package magit
  :ensure t
  :config
  ;; Magit configuration:
  ;; Set commit log to show 16 older commits
  ;; Unless showing process, revision, diff, stash, or status, open new buffers in the same window.
  (setq magit-log-section-commit-count 16
		magit-diff-paint-whitespace t
		magit-diff-paint-whitespace-lines (quote all)
		magit-diff-highlight-trailing t)

  (setq magit-display-buffer-function
		(lambda (buffer)
		  (display-buffer
		   buffer (if (and (derived-mode-p 'magit-mode)
						   (memq (with-current-buffer buffer major-mode)
								 '(magit-process-mode
								   magit-revision-mode
								   magit-diff-mode
								   magit-stash-mode
								   magit-status-mode)))
					  nil
					'(display-buffer-same-window))))))

(provide 'init-magit)
;;; init-magit.el ends here
