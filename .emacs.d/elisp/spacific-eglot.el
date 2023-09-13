(use-package eglot
  :ensure t
  :defer t
  :config 
  (add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio" )))
  :hook
  ((python-mode . eglot-ensure)))

(provide 'spacific-eglot)
