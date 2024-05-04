;; define a function

(defun spacific/pyvenv-workon ()
  "Activate a python virtualenv."
  ;; run pyvenv-workon as if invoked from alt-x
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (call-interactively 'pyvenv-workon))

  ;; check if eglot is running and reconnect
  (if (bound-and-true-p eglot--managed-mode)
      (call-interactively 'eglot-reconnect)))


(defun spacific/save-buffers-persp-kill-terminal ()
  "Save the current perspective before kill emacs."
  (interactive)
  (persp-state-save)
  (save-buffers-kill-terminal)
  )

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

(defun spacific/shell-command-on-line ()
  "Run a shell command on the current line."
  (interactive)
  (shell-command (thing-at-point 'line)))

(defun spacific/persp-move-buffer (direction)
  "Move to the next or previous buffer in the current perspective."
  (let* ((idx-delta (if (eq direction 'next) 1 -1))
         (bufs (persp-buffers (persp-curr)))
         (cur-buf (current-buffer))
         (cur-idx (cl-position cur-buf bufs))
         (next-idx (mod (+ cur-idx idx-delta) (length bufs)))
         (next-buf (nth next-idx bufs)))
    (unless (memq direction '(next prev))
      (error "Direction must be 'next or 'prev"))
    (switch-to-buffer next-buf)))

(defun spacific/persp-next-buffer ()
  "Move to the next buffer in the current perspective"
  (spacific/persp-move-buffer 'next))

(defun spacific/persp-prev-buffer ()
  "Move to the previous buffer in the current perspective"
  (spacific/persp-move-buffer 'prev))

(defun spacific/tmux-send-region ()
  "Send each line in the selected region to the tmux pane `emacs.2`"
  ;; for each line of the region
  (interactive
   (if (use-region-p)
       (let ((beg (region-beginning))
             (end (region-end)))
         (while (< beg end)
           (goto-char beg)

           ;; put the line between single quotes
           (setq line (buffer-substring-no-properties beg (line-end-position)))
           (setq line (concat "'" line "'"))
           (call-process-shell-command (concat "tmux send -t emacs.2 " line " C-m"))
           (setq beg (1+ (line-end-position))))))))

(provide 'spacific-lib)
