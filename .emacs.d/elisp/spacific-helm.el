;; (require 'helm-config)
(helm-mode 1)


;; Recommended from https://emacs-helm.github.io/helm/#configuration
(setq completion-styles '(flex))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-s o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; C-k will go up one level
;; (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))

;; Fuzzy matching
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

;; Enable spotlight (from
;; https://github.com/codemac/config/blob/master/emacs.d/boot.org)
;;(delete helm-c-source-locate helm-for-files-preferred-list)

;;(when (eq system-type 'darwin)
;;    (add-to-list 'helm-for-files-preferred-list 'helm-c-source-mac-spotlight))

;; Fix helm-top to work on mac os x..
(when (eq system-type 'darwin)
    (setq helm-c-top-command "COLUMNS=%s top -l 1"))

;; From https://nadeemkhedr.com/2016-08-24---emacs-tips-and-best-plugins-to-use-with-evil-mode/
(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
 
  :config
  (evil-leader/set-key
    "ps" 'helm-projectile-ag
    "pa" 'helm-projectile-find-file-in-known-projects))

(provide 'spacific-helm)
