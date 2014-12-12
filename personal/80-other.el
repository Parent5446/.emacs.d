(setq guru-warn-only nil)
(add-hook 'help-mode-hook 'page-break-lines-mode)
(define-key mac-apple-event-map [core-event reopen-application] nil)

(setq hyde-home "/home/parent5446/Documents/parent5446-blog")
(setq insert-directory-program "/usr/local/Cellar/coreutils/8.23_1/bin/gls")

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(add-to-list 'auto-mode-alist '("\\.xsd\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))
