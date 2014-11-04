;; Set droid-sans-mono 12pt as default
(cond ((string-equal system-type "darwin")
       (set-default-font "Menlo-15")
       )
      ((string-equal system-type "gnu/linux")
       (set-default-font "Droid Sans Mono-12")
       )
)

;; Disable Bell
(setq visible-bell t)

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Remove scroll bars
(scroll-bar-mode -1)

;; Remove tool bars
(tool-bar-mode 0)

(provide 'spacific-looknfeel)
