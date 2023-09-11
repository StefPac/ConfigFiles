;; Write customizations to a separate file instead of this file.
(setq custom-file (concat user-emacs-directory "custom.el"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'use-package)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; setup package environment
(require 'spacific-package)

;; generic
(require 'spacific-base)

;; editor
(require 'spacific-editing)

;; tramp
(require 'spacific-tramp)

;; git
(require 'spacific-git)

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

;; Setup Projectile
(require 'spacific-projectile)

;; Setup Helm
(require 'spacific-helm)

;; Set LSP for languages
(require 'spacific-lsp)

;; Set eglot
;; (require 'spacific-eglot)

;; Load Rust settings
(require 'spacific-rust)

;; Load javascript settings
(require 'spacific-js)

;; Load typescript settings
(require 'spacific-typescript)

;; Load C++ settings
(require 'spacific-cpp)

;; setup emacs server environment
(require 'spacific-server)

;; Emacs ERC
(require 'spacific-erc)

;; eye-candy
(require 'spacific-looknfeel)

;; Github copilot
(require 'spacific-copilot)

;; My own functions
(require 'spacific-lib)
