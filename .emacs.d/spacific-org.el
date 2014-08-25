;; add latest org-mode to load path
(add-to-list 'load-path (expand-file-name "/Users/stefy/.emacs.d/elpa/org-plus-contrib-20140804" t))

;; Add better ELPA sources
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; set the path for ditaa
(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")

;; Make Org-mode add timestamps when completing TODOs
(setq org-log-done 'time)

;; Enable Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activat

;; Without this `fill-paragrah` does not work in `org-mode`
(setq org-list-allow-alphabetical t)

;;  — User Option: org-confirm-babel-evaluate When t (the default),
;; the user is asked before every code block evaluation. When nil, the
;; user is not asked. When set to a function, it is called with two
;; arguments (language and body of the code block) and should return t
;; to ask and nil not to ask.  For example, here is how to execute
;; "ditaa" code (which is considered safe) without asking:

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; Add LATEX_CMD: 
(require 'org-latex)
(setq org-export-latex-listings t)

;; ;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; ;; but adapted to use latexmk 4.20 or higher.
;; (defun my-auto-tex-cmd ()
;;   "When exporting from .org with latex, automatically run latex,
;;      pdflatex, or xelatex as appropriate, using latexmk."
;;   (let ((texcmd)))
;;   ;; default command: oldstyle latex via dvi
;;   ;;(setq texcmd "latexmk -dvi -pdfps -quiet %f")
;;   ;; pdflatex -> .pdf
;;   ;;(if (string-match "LATEX_CMD: pdflatex" (buffer-string))
;;   (setq texcmd "latexmk -pdf -quiet %f")
;;   ;; xelatex -> .pdf
;;   (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;       (setq texcmd "latexmk -pdflatex=xelatex -pdf -quiet %f"))
;;   ;; LaTeX compilation command
;;   (setq org-latex-to-pdf-process (list texcmd)))

;; (add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-cmd)


;; Specify default packages to be included in every tex file, whether pdflatex or xelatex
(setq org-export-latex-packages-alist
      '(("" "graphicx" t)
            ("" "longtable" nil)
            ("" "float" nil)))

;; (defun my-auto-tex-parameters ()
;;       "Automatically select the tex packages to include."
;;       ;; default packages for ordinary latex or pdflatex export
(setq org-export-latex-default-packages-alist
      '(("AUTO" "inputenc" t)
	("T1"   "fontenc"   t)
	(""     "fixltx2e"  nil)
	(""     "wrapfig"   nil)
	(""     "soul"      t)
	(""     "textcomp"  t)
	(""     "marvosym"  t)
	(""     "wasysym"   t)
	(""     "latexsym"  t)
	(""     "amssymb"   t)
	(""     "hyperref"  nil)))

;;       ;; Packages to include when xelatex is used
;;       (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;           (setq org-export-latex-default-packages-alist
;;                 '(("" "fontspec" t)
;;                   ("" "xunicode" t)
;;                   ("" "url" t)
;;                   ("" "rotating" t)
;;                   ("american" "babel" t)
;;                   ("babel" "csquotes" t)
;;                   ("" "soul" t)
;;                   ("xetex" "hyperref" nil)
;;                   )))

;;       (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;           (setq org-export-latex-classes
;;                 (cons '("article"
;;                         "\\documentclass[11pt,article,oneside]{memoir}"
;;                         ("\\section{%s}" . "\\section*{%s}")
;;                         ("\\subsection{%s}" . "\\subsection*{%s}")
;;                         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                         ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;                       org-export-latex-classes))))

;; (add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-parameters)

(provide 'spacific-org)
