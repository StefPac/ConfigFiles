;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; ;; Install use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Install org early before builtin version gets loaded
(straight-use-package 'org)

(require 'use-package)

;; TODO have the list printed to file upon init, and the load from
;; that file.

(setq required-packages ' (ac-js2 ;; on MacOS check tar is GNU tar
                           async              
                           ;;  auctex             
                           ;;  caml               
                           ;;  cider              
                           ;;  clojure-mode       
                           ;;  company
                           doom-modeline
                           doom-themes
                           evil               
                           evil-args          
                           evil-commentary
                           evil-escape        
                           evil-exchange      
                           evil-god-state     
                           evil-leader        
                           evil-lisp-state    
                           evil-matchit       
                           evil-nerd-commenter
                           evil-numbers       
                           evil-org           
                           evil-paredit       
                           evil-search-highlight-persist
                           evil-space         
                           evil-surround      
                           evil-tabs          
                           evil-tabs          
                           evil-terminal-cursor-changer
                           evil-visualstar    
                           forge
                           github-review
                           github-modern-theme
                           github-dark-vscode-theme
                           ;; god-mode           
                           ;; goto-chg           
                           highlight          ;; check later if used
                           indent-guide
                           js2-mode           
                           js2-refactor       
                           ;;  key-chord          
                           lsp-mode
                           lsp-ui
                           lsp-pyright
                           magithub
                           magit-reviewboard
                           magit-gh-pulls
                           magit-diff-flycheck
                           magit
                           markdown-mode      
                           multiple-cursors   ;; https://emacsrocks.com/e13.html
                           neotree
                           ob-ipython
                           ox-gfm             
                           ox-rst             
                           paredit            
                           parsebib           
                           pkg-info           
                           projectile         
                           pyenv-mode
                           python-black
                           pyvenv
                           ripgrep
                           rg
                           rust-mode
                           rustic
                           simple-httpd       
                           skewer-mode        
                           smartparens        
                           toc-org
                           tree-sitter
                           ;;  tuareg             
                           undo-tree          
                           yasnippet
                           yasnippet-snippets))

(mapcar #'straight-use-package required-packages)

;; update everything and install deps recursively
(straight-pull-all)

(provide 'spacific-package)
