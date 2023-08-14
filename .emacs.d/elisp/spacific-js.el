;; Settings from
;; http://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/

;; Add js2 as default for js-mode
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'my-js-mode-hook)

;; Add .json files to js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; Ajust syntax highlighting
(setq js2-highlight-level 3)

;; Add curly braces to paredit
(defun my-js-mode-hook()
    (define-key js-mode-map "{" 'paredit-open-curly)
    (define-key js-mode-map "}" 'paredit-close-curly-and-newline))

(provide 'spacific-js)
