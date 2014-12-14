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

(linum-on)

(defun prelude-update ()
  "Update Prelude to its latest version."
  (interactive)
  (when (y-or-n-p "Do you want to update Prelude? ")
    (message "Updating installed packages...")
    (epl-upgrade)
    (message "Updating Prelude...")
    (cd prelude-dir)
    (shell-command "git fetch upstream")
    (shell-command "git merge --ff-only upstream/master")
    (prelude-recompile-init)
    (message "Update finished. Restart Emacs to complete the process.")))
