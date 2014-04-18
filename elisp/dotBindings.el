;; move the actual line to the top of the screen
(defun center0 ()
  (interactive)
  (recenter 0)
  )


;;key bindings
(global-set-key [(control meta <)] 'center0) ;C-M-< move the actual line to the top of the screen
(global-set-key [(control c) (g)] 'goto-line);C-c g go to line

(global-set-key [(kp-delete)] 'delete-char);delete real delete :)
(global-set-key [(control tab)] 'bury-buffer);C-tab navigate thougth buffers
(global-set-key [(delete)] 'delete-char);delete real delete :)
(global-set-key [(control c) (s)] 'shell)
(global-set-key [(control c) (b)] 'View-back-to-mark);; when you press home, pgUp, etc... use this to come back where you was
(global-set-key [(control c)(control i)] 'indent-region)
(global-set-key [(end)] 'end-of-buffer)
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(control kp-delete)] 'kill-word)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control s)] 'isearch-forward-regexp)

(global-set-key [(control shift q)] 'ispell-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)
(global-set-key [(control <)] 'hippie-expand);C-< auto complete

(require 'misc)
(global-set-key (kbd "s-.") 'copy-from-above-command)

(require 'paren)
(global-set-key [(control +)] 'show-paren-mode) ;activate mode that shows paren matching


;;aliases
(defalias 'qrr 'query-replace-regexp)
(defalias 'qr 'query-replace)
(defalias 'eb 'ediff-buffers)

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

;;misc-cmds
(substitute-key-definition 'recenter 'recenter-top-bottom global-map)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

(require 'dash)

(global-set-key (kbd "s-u") 'universal-argument)
(global-set-key (kbd "s--") 'negative-argument)
(--dotimes 5 (global-set-key (read-kbd-macro (format "s-%d" it)) 'digit-argument))

(global-set-key [(control c) (control f) (control b)] 'indent-buffer)
(global-set-key [(control c) (control f) (control w)] 'whitespace-cleanup)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
