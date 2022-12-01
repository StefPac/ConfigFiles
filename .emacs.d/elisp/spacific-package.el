(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;;(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

; activate all the packages (in particular autoloads)
(package-initialize)

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
  evil-escape        
  evil-exchange      
  evil-god-state     
  evil-leader        
  evil-lisp-state    
  evil-magit
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
  god-mode           
  goto-chg           
  helm               
  helm-bibtex        
  helm-projectile    
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
  python-black
  rust-mode
  rustic
  s                  
  simple-httpd       
  skewer-mode        
  smartparens        
  toc-org
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
(provide 'spacific-package)
