(require 'evil)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-mode 1)

;; Use 'jj' to return to Normal Mode;
;; Source: http://stackoverflow.com/questions/10569165/how-to-map-jj-to-esc-in-emacs-evil-mode

(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

;; Move visually around wrapped lines.

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)

;; From https://www.emacswiki.org/emacs/NeoTree#h5o-12
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

;; From https://github.com/noctuid/evil-guide#leader-key
;; set leader key in all states
(evil-leader/set-leader ",") t
(evil-set-leader nil (kbd "C-SPC"))

;; set leader key in normal state
(evil-set-leader 'normal (kbd "SPC"))

;; set local leader
(evil-set-leader 'normal "," t)

; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

;; Remap ';' to ':'
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; Insert new line in normal mode with <RET>
;; (define-key evil-normal-state-map (kbd "RET") (lambda ()
;;   (interactive)
;;   (evil-insert-newline-below)

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

;; Undo
(setq evil-undo-system 'undo-redo)

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
