(when window-system
  (cond ((string-equal system-type "darwin")
	 (set-default-font "Menlo-15"))
	((string-equal system-type "gnu/linux")
	 (set-default-font "Droid Sans Mono-12"))))

;; Disable Bell
(setq visible-bell t)

;; Remove splash screen
(setq inhibit-splash-screen t)

(require 'indent-guide)
(indent-guide-global-mode)

;; delete current theme when loading another
(defadvice load-theme (before theme-dont-propagate activate)
   (mapc #'disable-theme custom-enabled-themes))

;;(set-face-attribute 'default nil :background "brightwhite")

;;(set-face-background 'indent-guide-face "dimgray")

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
    doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
(load-theme 'doom-vibrant t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

(require 'doom-modeline)
(doom-modeline-mode 1)

(provide 'spacific-looknfeel)
