;; Turn off startup message
(setq viper-inhibit-startup-message 't)

;; Default Viper-mode level
(setq viper-expert-level '3)

;; Map 'jj' in insert mode to 'ESC'
(define-key viper-insert-global-user-map "jj" "\e")

;; Fix backspace at the beginning of the line not
;; having an effect.
(setq viper-ex-style-editing nil)

;; Fix motion commands not working at the beginning of a line.
(setq viper-ex-style-motion nil)

;; This causes viper to ignore case when doing searches (such as
;; with the '/' key.
(setq viper-case-fold-search 't)

;; If you don't have this line, C-d will not delete in insert state,
;; which can be confusing...  The default binding is to back tab.
(define-key viper-insert-global-user-map "\C-d" 'delete-char) 

;; This next is probadly the most crucial re-binding in this file.
;; If you don't set this line, C-h moves backwards a character.)
(setq viper-want-ctl-h-help 't)

;; These two bindings don't overwrite anything, and they allow you
;; to cycle the binding of the '.' key.
(define-key viper-vi-global-user-map "\M-p" 'viper-prev-destructive-command)
(define-key viper-vi-global-user-map "\M-n" 'viper-next-destructive-command)

;;;; The default behavior of 'v' and 'V' confuses me, so I reverse them.
(setq ex-cycle-other-window nil)

;; If not nil, point is not moved when the user repeats the
;; previous command by typing `.' This is very useful for doing
;; repeated changes with the . key.
(setq viper-keep-point-on-repeat 't)

;; Map ';' to ":" 
(define-key viper-vi-global-user-map ";" ":")



