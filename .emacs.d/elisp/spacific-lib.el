;; define a function

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

(provide 'spacific-lib)
