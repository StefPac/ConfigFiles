;; define a function

(defun spacific/kill-all-dired-buffers ()
  "Kill all dired buffers."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (eq major-mode 'dired-mode)
        (kill-buffer buffer)))))

(defun spacific/osx-copy-to-clipboard ()
  "Copy the current buffer to the clipboard."
  (interactive)
  (shell-command-on-region (point-min) (point-max) "pbcopy"))

(provide 'spacific-lib)
