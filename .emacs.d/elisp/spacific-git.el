(use-package magit
  :init
  (message "Loading Magit!")
  :config
  (message "Loaded Magit!")
  :bind (("C-x g" . magit-status)
        ("C-x C-g" . magit-status)))


(use-package forge
  :ensure t
  :after magit)

;; hack to eliminate weirdness
(unless (boundp 'bug-reference-auto-setup-functions)
  (defvar bug-reference-auto-setup-functions '()))

;; (use-package code-review
;;   :ensure t
;;   :after magit
;;   :bind (:map forge-topic-mode-map ("C-c r" . #'code-review-forge-pr-at-point))
;;   :bind (:map code-review-mode-map (("C-c n" . #'code-review-comment-jump-next)
;;                                     ("C-c p" . #'code-review-comment-jump-previous))))

(provide 'spacific-git)
