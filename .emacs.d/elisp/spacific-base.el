;; Enable transient mark region (highlighiting of the region)
(transient-mark-mode 1)

;; Various
;;(require 'folding)
(require 'flyspell)
(require 'ffap) ; find-file-at-point
(require 'ansi-color) ; translate ansi escape sequences into colors
(require 'tooltip)

;; Always use UTF-8
(set-language-environment "UTF-8")

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;;Temp files 
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Say y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn off bell
(setq ring-bell-function (lambda nil (message "")))

(provide 'spacific-base)
