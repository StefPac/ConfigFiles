;; define function to shutdown emacs server instance
(require 'server)

(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
    (kill-emacs))

(unless (server-running-p)
  (server-start))

(provide 'spacific-server)
