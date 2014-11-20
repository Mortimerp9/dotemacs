(require  'cl)
(load-library "cl-macs")

;;(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "vendor"))
(add-to-list 'load-path (concat user-emacs-directory "vendor/realtime-markdown-viewer"))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")

;;brew install path
(setq exec-path (append exec-path '("/usr/local/git/bin")) )
(setq exec-path (append exec-path '("/usr/local/bin")) )
(setq-default ispell-program-name "/usr/local/bin/aspell")

(getenv "PATH")
(setenv "PATH"
        (concat
         "/usr/texbin" ":"
         (getenv "PATH")))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))


(require 'setup-package)

(require 'better-defaults)
(require 'appearance)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(setq
  time-stamp-active t          ; do enable time-stamps
  time-stamp-line-limit 10     ; check first 10 buffer lines for Time-stamp:
  time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving

(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-js2-mode)

(require 'setup-hippie)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-c p" "C-x c"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)


;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;;smex
(require 'smex)
(smex-initialize)

;;(global-git-gutter+-mode t)

(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(add-to-list 'projectile-globally-ignored-directories "target")
(add-to-list 'projectile-globally-ignored-directories ".target")
(add-to-list 'projectile-globally-ignored-directories "bin")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

(autoload 'flycheck-mode "setup-flycheck" nil t)
(autoload 'scala-mode "setup-scalamode" nil t)

(load-library "dotBindings")
;;(load-library "dotTeX")

(helm-mode 1)

(require 'volatile-highlights)
(volatile-highlights-mode 1)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'setup-diminish)

(global-set-key [remap kill-ring-save] 'easy-kill)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-char "|")

(require 'fic-mode)
(turn-on-fic-mode)

(global-anzu-mode +1)

(require 'dotBindings)


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
