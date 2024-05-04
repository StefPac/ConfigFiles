(use-package copilot
  :after evil
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

;; enable completion in insert mode
(customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))

;; Will note enable copilot-mode by default on every buffer to avoid
;; continuously sending data to it.
;;
;; TODO: assign a hot-key for copilot-mode in buffer

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(use-package gptel)

(provide 'spacific-gpt)
