;; see https://github.com/redguardtoo/emacs.d/blob/6dc3fa2c460bdae63b2442455599358efb76a546/lisp/init-essential.el#L151
(use-package tramp
  :defer t
  :custom
  (tramp-default-method "sshx") ;; faster for file transfer
  (tramp-default-remote-shell "/bin/zsh")
  (tramp-encoding-shell "/bin/zsh")
  ;; If you tramp is hanging, you can uncomment below line.
  ;;(tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; testing that controlmaster is in ssh
  (tramp-use-ssh-controlmaster-options nil)
  (tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
  (tramp-chunksize 819)
  :config
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (push (cons tramp-file-name-regexp nil) backup-directory-alist)
  ;; @see https://github.com/syl20bnr/spacemacs/issues/1921
  ;; read specific host config from  tramp-ssh-config.el file
  (load (concat user-emacs-directory "tramp-ssh-config.el") t))

(provide 'spacific-tramp)
