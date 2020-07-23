
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; setup emacs server environment
(require 'spacific-server)

;; setup package aenvironment
(require 'spacific-package)

;;generic
(require 'spacific-base)

;; eye-candy
(require 'spacific-looknfeel)

;; org-mode
(require 'spacific-org) 

;; Load Markdown 
(require 'spacific-markdown)

;; Load Macbook specific settings 
(require 'spacific-macbook)

;; Load Evil Mode
(require 'spacific-evil)

;; Load clojure setup
(require 'spacific-clojure)

;; Setup Helm
(require 'spacific-helm)

;; Load javascript settings
(require 'spacific-js)

;; Load C++ settings
(require 'spacific-cpp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "f9aede508e587fe21bcfc0a85e1ec7d27312d9587e686a6f5afdbb0d220eab50" "0daf22a3438a9c0998c777a771f23435c12a1d8844969a28f75820dd71ff64e1" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(org-agenda-files (quote ("~/workspace/todo/todo.org")))
 '(package-selected-packages
   (quote
    (github-review forge atom-one-dark-theme monokai-theme magit ob-ipython tuareg ox-rst ox-gfm org-plus-contrib markdown-mode key-chord js2-refactor helm-projectile helm-bibtex evil-visualstar evil-terminal-cursor-changer evil-tabs evil-surround evil-space evil-search-highlight-persist evil-paredit evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-leader evil-god-state evil-exchange evil-escape evil-args cider auctex ac-js2)))
 '(pos-tip-background-color "#FFFFrF")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
