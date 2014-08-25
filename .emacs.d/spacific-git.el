;; Add git-el to the loadpath
(add-to-list 'load-path "/usr/local/share/git-core/contrib/emacs")
(require 'git)
(require 'git-blame)
(add-to-list 'vc-handled-backends 'GIT)

(provide 'spacific-git)
