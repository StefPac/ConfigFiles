;,--------------------------------------
;| MAIN GROUP: Editing
;`--------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Editing -> Editing Basics   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; you can set a value to one variable
(setq
 global-mark-ring-max 5000
 mark-ring-max 5000
 mode-require-final-newline t
 tab-width 4)

(delete-selection-mode)

;; UNDO TREE
(use-package undo-tree
  :ensure t
  :diminish
  :bind (("C-c _" . undo-tree-visualize))
  :config
  (global-undo-tree-mode +1)
  (unbind-key "M-_" undo-tree-map)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)  ; Automatically indent when press RET.
(setq-default indent-tabs-mode nil)  ; Don't use tabs, use spaces.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Editing -> Electricity      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; you can see these variables Eletricity group. However, these variables
;; are not for setting because setting them have no effect. You have to activate
;; command of the same name. If some variables are required to be activated through
;; commands, the description of those variables explicitly say so.
(electric-indent-mode) ;; activate automatic indent when press RET
(electric-pair-mode) ;; activate automatic paring

;; an example of association list, also an example of how to write a character
;; add more pairs if you want
;; (setq electric-pair-pairs '(( ?\< . ?\>)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Editing -> Killing          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq
 kill-ring-max 5000 ;; increase kill-ring capacity
 kill-whole-line t  ;; if NIL, kill whole line and move the next line up
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Editing -> Matching         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; As you can see, I only use a single option in the inner sub-group
;; It's not worth to create a file
(setq show-paren-delay 0) ; highlight parentheses immediately
(show-paren-mode) ; activate show-paren-mode

;; Consider a period followed by a single space to be end of sentence.
(setq sentence-end-double-space nil)

;; Display the distance between two tab stops as 4 characters wide.
(setq-default tab-width 4)

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(setq linum-format "%d ")

;; Tree sitter
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(provide `spacific-editing)
