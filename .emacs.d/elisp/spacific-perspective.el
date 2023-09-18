(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  ("C-x C-p" . persp-switch)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (global-unset-key (kbd "C-x C-c"))
  (global-set-key (kbd "C-x C-c") 'spacific/save-buffers-persp-kill-terminal)
  (setq persp-state-default-file (concat user-emacs-directory "persp-auto-save"))
  (persp-mode)
  (persp-state-load persp-state-default-file))

(provide 'spacific-perspective)
