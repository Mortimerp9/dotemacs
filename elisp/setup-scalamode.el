(require 'scala-mode2)

(add-hook 'scala-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") '(lambda ()
                                          (interactive)
                                          (newline-and-indent)
                                          (scala-indent:insert-asterisk-on-multiline-comment)))
            
            (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
            (ggtags-mode 1)
            (flycheck-mode 1)
            (flycheck-select-checker 'sbt)
            ))

(provide 'setup-scalamode)
