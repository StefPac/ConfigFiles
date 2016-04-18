(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; Enable spotlight (from
;; https://github.com/codemac/config/blob/master/emacs.d/boot.org)
;;(delete helm-c-source-locate helm-for-files-preferred-list)

;;(when (eq system-type 'darwin)
;;    (add-to-list 'helm-for-files-preferred-list 'helm-c-source-mac-spotlight))

;; Fix helm-top to work on mac os x..
(when (eq system-type 'darwin)
    (setq helm-c-top-command "COLUMNS=%s top -l 1"))

(provide 'spacific-helm)
