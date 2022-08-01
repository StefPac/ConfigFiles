(use-package magit
  :init
  (message "Loading Magit!")
  :config
  (message "Loaded Magit!")
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))
  ;;Currently, `evil-magit` is not working
  ;;
  ;;:after (if (featurep `spacific-evil)
  ;;           (require 'evil-magit))


(provide 'spacific-git)
