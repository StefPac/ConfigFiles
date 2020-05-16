(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; Add better ELPA sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

(let ((required-packages '(  ac-js2             
  async              
  auctex             
  caml               
  cider              
  clojure-mode       
  dash               
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
  god-mode           
  goto-chg           
  helm               
  helm-bibtex        
  helm-projectile    
  highlight          
  js2-mode           
  js2-refactor       
  key-chord          
  magithub
  magit-reviewboard
  magit-gh-pulls
  magit-diff-flycheck
  magit
  markdown-mode      
  multiple-cursors   
  ob-ipython
  org-plus-contrib   
  ox-gfm             
  ox-rst             
  paredit            
  parsebib           
  parsebib           
  pkg-info           
  projectile         
  rust-mode
  s                  
  simple-httpd       
  skewer-mode        
  smartparens        
  tuareg             
  undo-tree          
  yasnippet ))

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package required-packages)
  (unless (package-installed-p package)
    (package-install package)))
(provide 'spacific-package)
