(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

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
;;(require 'spacific-rcirc) 

;; Load Markdown 
(require 'spacific-markdown)

;; Load Macabook specific settings 
(require 'spacific-macbook)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/AeroFS/todo/todo.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
