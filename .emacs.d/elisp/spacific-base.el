;; Increase the garbage collection threshold to 100MB to ease startup
(setq gc-cons-threshold 100000000)

;; Enable transient mark region (highlighiting of the region)
(transient-mark-mode 1)

;; short answers
(setq use-short-answers t)

;; Various
;;(require 'folding)
(require 'flyspell)
(require 'ffap) ; find-file-at-point
(require 'ansi-color) ; translate ansi escape sequences into colors
(require 'xterm-color)
(require 'tooltip)

(defun xterm-color-colorize-shell-command-output ()
  "Colorize `shell-command' output."
  (let ((bufs
         (seq-remove
          (lambda (x)
            (not (or (string-prefix-p " *Echo Area" (buffer-name x))
                     (string-prefix-p "*Shell Command" (buffer-name x)))))
          (buffer-list))))
    (dolist (buf bufs)
      (with-current-buffer buf
        (xterm-color-colorize-buffer)))))

(defun xterm-color-colorize-shell-command-output-advice (proc &rest rest)
  (xterm-color-colorize-shell-command-output))

(advice-add 'shell-command :after #'xterm-color-colorize-shell-command-output-advice)
;; (advice-remove 'shell-command #'xterm-color-colorize-shell-command-output-advice)

;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1)
  (setq apheleia-remote-algorithm "remote")
  (add-to-list 'apheleia-formatters
               '(black "black" "-v" "--line-length" "79" "-")))

;; modify the command for apheleia python black

;; prevent warnings from native compilation
(setq native-comp-async-report-warnings-errors nil)

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

;; Don't let emacs hog the system
(setq native-comp-async-jobs-number 3)

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

;; Dired auto-revert
(setq dired-auto-revert-buffer t)

;; Enable vertico
(use-package vertico
  :ensure t
  :init
  (setq vertico-resize t)  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-count 15)  ;; Show more candidates
  (vertico-mode)
  :custom
  (with-eval-after-load 'evil
    (define-key vertico-map (kbd "C-j") 'vertico-next)
    (define-key vertico-map (kbd "C-k") 'vertico-previous)
    (define-key vertico-map (kbd "M-h") 'vertico-directory-up))

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)


  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))


(use-package deadgrep
  :ensure t
  :bind (("C-c H" . #'deadgrep)))

(use-package consult
  :ensure t
  :config
  :custom
    (completion-in-region-function #'consult-completion-in-region)
    (xref-show-xrefs-function #'consult-xref)
    (xref-show-definitions-function #'consult-xref)
    (consult-project-root-function #'deadgrep--project-root));; ensure ripgrep works
    (global-set-key (kbd "C-s") 'consult-line)


(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package embark
  :ensure t
  :bind ("C-c ." . #'embark-act)
  :custom (global-set-key [remap describe-bindings] #'embark-bindings))

(use-package embark-consult
  :ensure t
  :after (embark consult))


;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Scroll one line at a time
(setq scroll-step            1
      scroll-margin          7
      scroll-conservatively  10000)

(use-package corfu-terminal
  :ensure t
  :after corfu)

(use-package corfu
  :ensure t
  :requires (corfu-terminal)
  :init
    (unless (display-graphic-p)
        (require 'corfu-terminal)
        (corfu-terminal-mode +1))
  :config
    (setq corfu-cycle t); Allows cycling through candidates
    (setq corfu-auto t); Enable auto completion
    (setq corfu-auto-prefix 2) ; Complete with less prefix keys
    (setq corfu-auto-delay 0.0); No delay for completion
    (setq corfu-echo-documentation 0.25); Echo docs for current completion option

    :custom
    (global-corfu-mode 1)
    (corfu-popupinfo-mode 1)
    (eldoc-add-command #'corfu-insert)
    (define-key corfu-map (kbd "M-p") #'corfu-popupinfo-scroll-down)
    (define-key corfu-map (kbd "M-n") #'corfu-popupinfo-scroll-up)
    (define-key corfu-map (kbd "M-d") #'corfu-popupinfo-toggle))


(provide 'spacific-base)

