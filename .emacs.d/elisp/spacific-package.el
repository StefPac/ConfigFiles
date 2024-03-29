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
;; (require 'package)
(require 'use-package)

;; (add-to-list 'package-archives
;; 	         '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

; activate all the packages (in particular autoloads)
;; (package-initialize)

;; TODO have the list printed to file upon init, and the load from
;; that file.

(setq required-packages ' (ac-js2
  async              
  auctex             
  caml               
  cider              
  clojure-mode       
  company
  dash               
  doom-modeline
  doom-themes
  elscreen           
  epl                
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
  f                  
  forge
  github-review
  github-modern-theme
  github-dark-vscode-theme
  god-mode           
  goto-chg           
  highlight          
  indent-guide
  js2-mode           
  js2-refactor       
  key-chord          
  lsp-mode
  lsp-ui
  lsp-pyright
  magithub
  magit-reviewboard
  magit-gh-pulls
  magit-diff-flycheck
  magit
  markdown-mode      
  multiple-cursors   
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
  quelpa
  quelpa-use-package ;; on MacOS check tar is GNU tar
  ripgrep
  rg
  rust-mode
  rustic
  s                  
  simple-httpd       
  skewer-mode        
  smartparens        
  toc-org
  tree-sitter
  tuareg             
  undo-tree          
  yasnippet
  yasnippet-snippets))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package required-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'quelpa-use-package)

(provide 'spacific-package)
