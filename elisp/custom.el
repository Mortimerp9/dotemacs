;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customizations, do not touch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;some little settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "/usr/texbin/bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Refresh" "dvipdf %d" TeX-run-command nil t))))
 '(TeX-output-view-style (quote (("^dvi$" "." "xdvi %o") ("^pdf$" "." "open -a Skim.app %o") ("^html?$" "." "open %o"))))
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b"))))
 '(TeX-view-program-selection (quote ((output-pdf "Skim") (output-dvi "Skim"))) t)
 '(auto-completion-min-chars 2)
 '(completion-auto-show nil)
 '(font-latex-user-keyword-classes (quote (("textodo" ("todo" "globaltodo") (:height 1.5 :weight bold :foreground "red" :background "white") (command 1)))))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(mf-display-padding-width 49)
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(php-file-patterns nil)
 '(predictive-use-buffer-local-dict nil)
 '(safe-local-variable-values (quote ((TeX-master . "minibook") (Tex-PDF-mode . t) (TeX-master . "main") (TeX-master . t))))
 '(show-trailing-whitespace t)
 '(temporary-file-directory "/tmp/")
 '(user-full-name "Pierre Andrews")
 '(user-mail-address "pierre.andrews@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-2-face ((t (:foreground "SteelBlue4"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "wheat2"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "LightSkyBlue3"))))
)
