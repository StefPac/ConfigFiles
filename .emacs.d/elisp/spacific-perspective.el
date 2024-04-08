(use-package perspective
  
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
  (persp-state-load persp-state-default-file)
  ;; if consult is loaded
  (with-eval-after-load 'consult)
  (add-to-list 'consult-buffer-sources persp-consult-source))


(provide 'spacific-perspective)
