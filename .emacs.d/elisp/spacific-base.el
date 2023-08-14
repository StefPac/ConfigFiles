;; Enable transient mark region (highlighiting of the region)
(transient-mark-mode 1)

;; short answers
(setq use-short-answers t)

;; Various
;;(require 'folding)
(require 'flyspell)
(require 'ffap) ; find-file-at-point
(require 'ansi-color) ; translate ansi escape sequences into colors
(require 'tooltip)


;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))


;; enable company-mode everywhere (required for LSP)
(add-hook 'after-init-hook 'global-company-mode)

;; Always use UTF-8
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; Fix shell encodings
(setenv "LANG" "en_US.UTF-8")

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;;Temp files
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 auto-save-file-name-transforms
 '((".*" "~/.tmp/emacs/auto-save/" t))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Disable lockfiles.
(setq create-lockfiles nil)

;; Say y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn off bell
(setq ring-bell-function (lambda nil (message "")))

;; Check if rg is installed then use rg instead of grep
(require 'grep)
(when (executable-find "rg")
    (grep-apply-setting
           'grep-find-command
           "rg --no-heading "))

(provide 'spacific-base)
