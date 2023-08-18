(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(provide 'spacific-cpp)

