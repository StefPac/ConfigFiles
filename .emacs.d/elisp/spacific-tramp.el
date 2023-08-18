(setq tramp-default-method "scp") ;; faster for file transfer

;; see https://github.com/redguardtoo/emacs.d/blob/6dc3fa2c460bdae63b2442455599358efb76a546/lisp/init-essential.el#L151
(with-eval-after-load 'tramp
  (push (cons tramp-file-name-regexp nil) backup-directory-alist)
  ;; @see https://github.com/syl20bnr/spacemacs/issues/1921
  ;; If you tramp is hanging, you can uncomment below line.
  ;; (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq tramp-chunksize 8192))

