(use-package copilot
  :after evil
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

;; enable completion in insert mode
(customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))
(add-hook 'prog-mode-hook 'copilot-mode)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide 'spacific-copilot)

