;;(package-initialize)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; Add better ELPA sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
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
  evil-indent-texobject
  evil-jumper        
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
  god-mode           
  goto-chg           
  helm               
  helm-bibtex        
  helm-projectile    
  helm-projectile-all
  highlight          
  js2-mode           
  js2-refactor       
  key-chord          
  markdown-mode      
  multiple-cursors   
  org                
  org-plus-contrib   
  ox-gfm             
  ox-rst             
  paredit            
  parsebib           
  parsebib           
  pkg-info           
  projectile         
  queue              
  s                  
  simple-httpd       
  skewer-mode        
  smartparens        
  tuareg             
  undo-tree          
  yasnippet ))))

(provide 'spacific-package)
