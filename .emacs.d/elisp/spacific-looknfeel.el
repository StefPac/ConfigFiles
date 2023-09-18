(when window-system
  (cond ((string-equal system-type "darwin")
	 (set-frame-font "Menlo-15"))
	((string-equal system-type "gnu/linux")
	 (set-frame-font "Droid Sans Mono-12"))))

;; Disable Bell
(setq visible-bell t)

;; Remove splash screen
(setq inhibit-splash-screen t)

(require 'indent-guide)
(indent-guide-global-mode)

;; delete current theme when loading another
(defadvice load-theme (before theme-dont-propagate activate)
   (mapc #'disable-theme custom-enabled-themes))

;; With theme `github-dark-vscode`
(set-face-background 'evil-search-highlight-persist-highlight-face "dimgray")
;; (set-face-background 'helm-match "black")
;; (set-face-background 'helm-grep-file "dimgray")
;; (set-face-attribute  'helm-selection nil :background "dimgray" :foreground "white")
;; (set-face-attribute  'helm-selection-line nil :background "dimgray" :foreground "white")
;; (set-face-attribute  'helm-selection-line nil :background "dimgray" :foreground "white")
(set-face-attribute  'org-table nil :foreground "#a4cbff")
(set-face-attribute  'org-level-2 nil :foreground "lightgray")
(set-face-attribute  'org-level-3 nil :foreground "gray")
(set-face-attribute  'org-level-4 nil :foreground "lightslategray")

;; Modify the ansi blue color in the shell inside emacs 
(set-face-attribute  'ansi-color-blue nil :foreground "#a4cbff")

;; ;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; ;; theme may have their own settings.
(load-theme 'github-dark-vscode t)

;; ;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

(use-package all-the-icons
    :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

(provide 'spacific-looknfeel)
