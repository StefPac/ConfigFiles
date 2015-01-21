;; From http://piotrkazmierczak.com/2010/05/13/emacs-as-the-ultimate-latex-editor/

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

;; Enables Emacs to check the syntax of your TeX file on-the-fly
;; Beware, though — flymake consumes quite a lot of CPU power,
;; especially when used with large files (and paradoxically large
;; files make it most useful).
(require 'flymake)

(defun flymake-get-tex-args (file-name)
  (list "pdflatex"
    (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flymake-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)

;; Spell-checking while you type isn’t so cpu consuming, and you can
;; turn it on with:
(setq ispell-program-name "aspell") ; could be ispell as well,
				    ; depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any
				   ; language your spell-checking
				   ; program supports
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

