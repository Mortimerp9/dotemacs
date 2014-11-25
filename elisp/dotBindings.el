;; move the actual line to the top of the screen
(defun center0 ()
  (interactive)
  (recenter 0)
  )

(defun p/projectile-or-file ()
  (interactive)
  (if (projectile-project-p)
;;      (projectile-find-file)
      (helm-ls-git-ls)
    (ido-find-file)
      )
  )

(defun p/projectile-or-buffer ()
  (interactive)
  (if (projectile-project-p)
      (projectile-switch-to-buffer)
      (ido-switch-buffer)
    )
  )



;; change command to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

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

(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)


;;aliases
(defalias 'qrr 'query-replace-regexp)
(defalias 'qr 'query-replace)
(defalias 'eb 'ediff-buffers)

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

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

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "fg" 'iy-go-to-char)
(key-chord-define-global "df" 'iy-go-to-char-backward)
(key-chord-define-global "dd" 'kill-and-retry-line)
(key-chord-define-global "qr" 'vr/query-replace)
;;aliases
(defalias 'qr 'vr/query-replace)
(defalias 'eb 'ediff-buffers)


(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

;; Set anchor to start rectangular-region-mode
(global-set-key (kbd "H-SPC") 'set-rectangular-region-anchor)
;; Quickly jump in document with ace-jump-mode
(define-key global-map (kbd "C-/") 'ace-jump-mode)

(global-set-key [(control x) (control f)] 'p/projectile-or-file)
(global-set-key [(control x) (control F)] 'ido-find-file)
(global-set-key [(control x) (b)] 'p/projectile-or-buffer)
(global-set-key [(control x) (control b)] 'ido-switch-buffer)


(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

(global-set-key (kbd "C-c ;") 'comment-dwim)

(global-undo-tree-mode)
(browse-kill-ring-default-keybindings)

(provide 'dotBindings)
