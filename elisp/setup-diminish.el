;; Unclutter the modeline
(require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "git-gutter+" '(diminish 'git-gutter+-mode))
(eval-after-load "volatile-highlights" '(diminish 'volatile-highlights-mode "vh"))
(eval-after-load "Helm" '(diminish 'helm-mode "hl"))
(eval-after-load "Guide-Key" '(diminish 'guide-key-mode))
(eval-after-load "abbrev"  '(diminish 'abbrev-mode "Ab"))
;;(eval-after-load "yasnippet" '(diminish 'yas/minor-mode "Y"))
(eval-after-load "Anzu" '(diminish 'anzu-mode))

;;make projectile shorter
(setq projectile-mode-line-lighter " P")
;;no need for ggtags project name (projectile gives that already)
(setq ggtags-mode-line-project-name nil)


(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")

(provide 'setup-diminish)
