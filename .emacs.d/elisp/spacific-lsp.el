;; from https://ianyepan.github.io/posts/emacs-ide/

(use-package lsp-mode
  :hook ((python-mode
	  js-mode
	  js-jsx-mode
	  typescript-mode
	  ) . lsp-deferred)
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "pyright")
                     :major-modes '(python-mode)
                     :remote? t
                     :server-id 'pyright-remote))
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :commands lsp)


(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  ;;(setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-always-show t)
  (setq lsp-ui-sideline-show-hover t)
  ;;(setq lsp-ui-doc-enable nil)
  )

(use-package lsp-pyright
  :ensure
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(provide 'spacific-lsp)
