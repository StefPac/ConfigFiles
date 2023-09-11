
;; see https://github.com/redguardtoo/emacs.d/blob/6dc3fa2c460bdae63b2442455599358efb76a546/lisp/init-essential.el#L151
(with-eval-after-load "tramp"
  (setq tramp-default-method "sshx") ;; faster for file transfer
  (setq tramp-default-remote-shell "/bin/zsh")
  (setq tramp-encoding-shell "/bin/zsh")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (push (cons tramp-file-name-regexp nil) backup-directory-alist)
  ;; @see https://github.com/syl20bnr/spacemacs/issues/1921
  ;; If you tramp is hanging, you can uncomment below line.
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq tramp-chunksize 8192))
  ;; read specific host config from  tramp-ssh-config.el file
  ;; (load (concat user-emacs-directory "tramp-ssh-config.el") t))

(provide 'spacific-tramp)
