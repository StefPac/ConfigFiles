;; Add git-el to the loadpath
(load "/usr/share/emacs24/site-lisp/git/git.el")
(load "/usr/share/emacs24/site-lisp/git/git-blame.el")
(add-to-list 'vc-handled-backends 'GIT)

(provide 'spacific-git)
