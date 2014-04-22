(require 'package)
;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


(require 'dash)


(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     smooth-scrolling
     paredit
     move-text
     gist
     htmlize
     visual-regexp
     flycheck
     flx
     flx-ido
     ido-ubiquitous
     yasnippet
     smartparens
     ido-vertical-mode
     ido-at-point
     guide-key
     highlight-escape-sequences
     whitespace-cleanup-mode
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     ace-jump-mode
     diminish
     git-gutter-fringe+
     projectile
     helm-projectile
     helm
     js2-mode
     js2-refactor
     powerline
     scala-mode2
     sbt-mode
     smex
     ggtags
     dash
     project-explorer
     helm-flycheck
     helm-swoop
     volatile-highlights
     rainbow-delimiters
     naquadah-theme
     markdown-mode+
     easy-kill
     expand-region
     highlight-symbol
     indent-guide
     fic-mode
     cl-lib
     anzu
     iy-go-to-char
     key-chord
     smart-forward
    undo-tree
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(provide 'setup-package)
