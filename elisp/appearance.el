(load-theme 'naquadah t)



(global-font-lock-mode t);start with higlight mode when needed
(column-number-mode t);show column number
(transient-mark-mode t);higlight to mark
(delete-selection-mode t);delete selection on any key press (replace selection) :o)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))  ;;remove scrollbar
(tool-bar-mode -1);Hate this toolbar. remove it
(display-time);self explaining
(c-set-offset 'case-label '+);case should be idented from switch
(global-hl-line-mode 1) ;; Highlight current line

(setq display-time-24hr-format t;24h time
	  visible-bell t;no more beeep, just screen flash
	  default-tab-width 4;tab takes 4 spaces
	  require-final-newline t ;; Always end a file with a newline
	  next-line-add-newlines nil ;; Stop at the end of the file, not just add lines
	  font-lock-maximum-decoration t
	  default-major-mode 'text-mode
      redisplay-dont-pause t       ;; Don't defer screen updates when performing operations
)

;;(require 'powerline)
;;(powerline-center-theme)
(sml/setup)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "grey19")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(define-globalized-minor-mode global-fancy-narrow-mode fancy-narrow-mode (lambda () (fancy-narrow-mode 1)))
(global-fancy-narrow-mode 1)



(provide 'appearance)
