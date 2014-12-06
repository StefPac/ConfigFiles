(require 'evil)
(evil-mode 1)

;; Use 'jj' to return to Normal Mode;
;; Source: http://stackoverflow.com/questions/10569165/how-to-map-jj-to-esc-in-emacs-evil-mode

(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

;; Move visually around wrapped lines.

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Remap ';' to ':'

(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; Don't move back the cursor when exiting insert mode.

(setq evil-move-cursor-back nil)

;; Enable evil-paredit-mode
(require 'evil-paredit)
(add-hook 'paredit-mode-hook 'evil-paredit-mode)

;; Enable evil-org-mode
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)

;; Enable persistent highlight
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)


(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))
(provide 'spacific-evil)
