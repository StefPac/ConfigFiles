(use-package copilot
  :after evil
  :quelpa (copilot :fetcher github
                   :repo "zerolfx/copilot.el"
                   :branch "main"
                   :files ("dist" "*.el")))

;; you can utilize :map :hook and :config to customize copilot
;; enable completion in insert mode
(customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))
(add-hook 'prog-mode-hook 'copilot-mode)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide 'spacific-copilot)

