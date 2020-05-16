
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; setup emacs server environment
(require 'spacific-server)

;; setup package aenvironment
(require 'spacific-package)

;;generic
(require 'spacific-base)

;; eye-candy
(require 'spacific-looknfeel)

;; org-mode
(require 'spacific-org) 

;; Load Markdown 
(require 'spacific-markdown)

;; Load Macbook specific settings 
(require 'spacific-macbook)

;; Load Evil Mode
(require 'spacific-evil)

;; Load clojure setup
(require 'spacific-clojure)

;; Setup Helm
(require 'spacific-helm)

;; Load javascript settings
(require 'spacific-js)

;; Load C++ settings
(require 'spacific-cpp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/workspace/todo/todo.org")))
 '(package-selected-packages
   (quote
    (magit ob-ipython tuareg ox-rst ox-gfm org-plus-contrib markdown-mode key-chord js2-refactor helm-projectile helm-bibtex evil-visualstar evil-terminal-cursor-changer evil-tabs evil-surround evil-space evil-search-highlight-persist evil-paredit evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-leader evil-god-state evil-exchange evil-escape evil-args cider auctex ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
