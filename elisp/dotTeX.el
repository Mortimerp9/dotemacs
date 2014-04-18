;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize LaTeX parameters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'diction)

(require 'tex-site)

(defun my-LaTeX-mode-hook ()
  "My latex setting."
  (setq-default TeX-master nil)         ; Query for master file.
  (define-key LaTeX-mode-map [(control c) (m)] 'TeX-electric-macro)
  )

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
                                        ;(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'reftex-mode)
                                        ;(add-hook 'LaTeX-mode-hook 'predictive-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)


(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                                        ;                     (diminish 'predictive-mode "Pred")
                                        ;(diminish 'auto-fill-mode)
;                      (require 'predictive-latex)
                      (require 'font-latex)
                      (TeX-fold-mode 1)
                      (setq TeX-parse-self t) ; Enable parse on load.
                      (setq TeX-auto-save t)  ; Enable parse on save.
                                        ;                 (paren-toggle-matching-quoted-paren 1)
                                        ;                     (paren-toggle-matching-paired-delimiter 1)
                      ;;
                      (require 'reftex)
                      (turn-on-reftex)
                      (setq reftex-plug-into-AUCTeX t)
                      (setq reftex-default-bibliography (quote ("literature.bib")))
                      (diminish 'reftex-mode)
                      ;;
                      (require 'bib-cite)
                      (bib-cite-minor-mode 1)
                      (setq bib-cite-use-reftex-view-crossref t)
                      (setq bib-highlight-mouse-t nil)
                      (diminish 'bib-cite-minor-mode)
                      ;;
                      (outline-minor-mode 1)
                      (diminish 'outline-minor-mode)
                      (setq outline-minor-mode-prefix "\C-c\C-o")
                      ;;(ispell-hl-minor-mode)
                      (when (fboundp 'ispell)
                        (flyspell-mode 1)
                        (diminish 'flyspell-mode)
                        )
                      ;;
                      (defadvice TeX-command-filter
                        (before TeX-pipe-fill activate)
                        (when (< (length string) 80)
                          (sleep-for 0.05)))
                      )))


(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

(setq TeX-source-correlate-method 'synctex)

(add-hook 'LaTeX-mode-hook
      (lambda()
        (add-to-list 'TeX-expand-list
             '("%z" skim-make-url))))

(defun skim-make-url () (concat
        (TeX-current-line)
        " "
        (expand-file-name (funcall file (TeX-output-extension) t)
            (file-name-directory (TeX-master-file)))
        " "
        (buffer-file-name)))

(setq TeX-view-program-selection '((output-pdf "Skim")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
