(require 'spacific-base)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; if package persp-projectile is installed use it
(when (package-installed-p 'persp-projectile)
  (require 'persp-projectile)
  ;; if persp-mode is enabled, use persp-projectile
  (when (default-value 'persp-mode)
    (define-key projectile-mode-map (kbd "C-c p p") 'projectile-persp-switch-project)))

;; don't use elisp index, but rely on utilities
(setq projectile-indexing-method 'alien)

(provide 'spacific-projectile)
