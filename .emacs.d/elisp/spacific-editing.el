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

;; Undo 
;; (global-undo-tree-mode)

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

;; Scroll one line at a time
(setq scroll-step            1
      scroll-margin          7
      scroll-conservatively  10000)

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package company
  :ensure t
  :custom
  (company-idle-delay 0.5) ;; how long to wait until popup
  :init (global-company-mode)
  :diminish company-mode
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last)))

  :config
  ;; set default `company-backends'

  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf)  ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))
(use-package company-statistics
    :ensure t
    :init
    (company-statistics-mode))
(use-package company-web
    :ensure t)
(use-package company-try-hard
    :ensure t
    :bind
    (("C-<tab>" . company-try-hard)
     :map company-active-map
     ("C-<tab>" . company-try-hard)))
(use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode))

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(setq linum-format "%d ")

(provide `spacific-editing)
