(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; setup emacs server environment
(require 'spacific-server)

;; setup package aenvironment
(require 'spacific-package)

;; generic
(require 'spacific-base)

;; eye-candy
(require 'spacific-looknfeel)

;; git
(require 'spacific-git)

;; org-mode
(require 'spacific-org) 

;; IRC settings
(require 'spacific-erc) 

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
 '(org-agenda-files (quote ("~/workspace/todo/todo.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
