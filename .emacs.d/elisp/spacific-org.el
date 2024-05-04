;; set the path for ditaa
;; TODO fix for working on linux too
(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")

;; Make Org-mode add timestamps when completing TODOs
(setq org-log-done 'time)

;; Require Agenda
(require 'org-agenda)
'(org-agenda-files '("~/work.org" "~/personal.org"))

;; Fix exporting
(require 'ox-publish)

;; IPython
;; TODO test if still works
;; (require 'ob-ipython)

;; Enable Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ditaa . t) ; this line activat
   (shell . t)
   ))

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

;; ORG-LATEX
(require 'ox-latex)

;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; but adapted to use latexmk 4.20 or higher.
(defun my-auto-tex-cmd (backend-symbol)
  "When exporting from .org with latex, automatically run latex,
     pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: oldstyle latex via dvi
  ;;(setq texcmd "latexmk -dvi -pdfps -quiet %f")
  ;; pdflatex -> .pdf
  ;;(if (string-match "LATEX_CMD: pdflatex" (buffer-string))
  (setq texcmd "latexmk -pdf -f -quiet %f")
  ;; xelatex -> .pdf
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq texcmd "latexmk -pdflatex='xelatex -f -shell-escape' -pdf -quiet %f"))
  ;; LaTeX compilation command
  (setq org-latex-pdf-process (list texcmd)))

(add-hook 'org-export-before-processing-hook 'my-auto-tex-cmd)



(defun my-auto-tex-parameters (backend-symbol)
  ;; "Automatically select the tex packages to include."
  ;; default packages for ordinary latex or pdflatex export
  (setq org-latex-default-packages-alist
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

  ;; Packages to include when xelatex is used
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-latex-default-packages-alist
	        '(("" "xunicode" t)
	          ("" "url" t)
	          ("" "rotating" t)
	          ("american" "babel" t)
	          ("babel" "csquotes" t)
	          ("" "soul" t)
	          ("" "float" nil)
              ("" "longtable" nil)
	          ("xetex" "graphicx" nil)
	          ("xetex" "hyperref" nil)
	          )))

  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-latex-classes
	        (cons '("article"
		            "\\documentclass[11pt,article,oneside]{memoir}"
		            ("\\section{%s}" . "\\section*{%s}")
		            ("\\subsection{%s}" . "\\subsection*{%s}")
		            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		            ("\\paragraph{%s}" . "\\paragraph*{%s}")
		            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
		          org-latex-classes)))
  )

(add-hook 'org-export-before-processing-hook 'my-auto-tex-parameters)

;; Add LATEX_CMD: 

;; need to be here to append to the list

(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
;; (setq org-latex-listings 'minted)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-to-pdf-process
;; '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Add 'letter' document class
(add-to-list 'org-latex-classes
             '("letter"
               "\\documentclass{letter}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
             )
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  ;; TODO: fix ox-bibtex configuration
  ;; (require 'ox-bibtex)
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
                                        ;enable auto-revert-mode to update reftex when bibtex file changes on disk
	     (global-auto-revert-mode t)
	     (reftex-parse-all)
                                        ;add a custom reftex cite format to insert links
	     (reftex-set-cite-format
	      '((?b . "[[bib:%l][%l-bib]]")
	        (?n . "[[notes:%l][%l-notes]]")
	        (?p . "[[papers:%l][%l-paper]]")
	        (?c . "[[cite:%l][%l-cite]]")
	        (?i . "[[citep:%l][%l-citep]]")
	        (?t . "[[citet:%l][%l-citet]]")
	        (?l . "%t")
	        (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))
(define-key org-mode-map (kbd "C-c x b") 'org-narrow-to-block)

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(defun org-mode-reftex-search ()
  ;;jump to the notes for the paper pointed to at from reftex search
  (interactive)
  (org-open-link-from-string (format "[[notes:%s]]" (first (reftex-citation t)))))

(if (require 'toc-org nil t)
    (progn
      (add-hook 'org-mode-hook 'toc-org-mode)

      ;; TODO enable in markdown, too
      ;; (add-hook 'markdown-mode-hook 'toc-org-mode)
      ;; (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
      (warn "toc-org not found"))
  )

;; setup denote
(use-package denote
  :ensure t
  :config
  (setq denote-extensions '(("org" . org-mode)))
  )


(provide 'spacific-org)
