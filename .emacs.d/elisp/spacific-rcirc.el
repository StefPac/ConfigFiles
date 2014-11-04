(require 'rcirc)
(require 'tls)
;; Auto authentication
(load "~/.emacs.d/.rcirc.auth")
(setq rcirc-authinfo freenode-auth-info)

;; Non-nil means automatically send authentication string to server.
(setq rcirc-auto-authenticate-flag 1)

;; Non-nil means authenticate to services before joining channels.;; Currently only works with NickServ on some networks.
(setq rcirc-authenticate-before-join 1)

;; Join these channels at startup.

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook (lambda ()
			     (flyspell-mode 1)))

;; Include date in time stamp.
(setq rcirc-time-format "%Y-%m-%d %H:%M ")

(provide 'spacific-rcirc)
