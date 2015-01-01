(setq guru-warn-only nil)

(define-key mac-apple-event-map [core-event reopen-application] nil)

(setq hyde-home "/home/parent5446/Documents/parent5446-blog")
(setq insert-directory-program "/usr/local/Cellar/coreutils/8.23_1/bin/gls")

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(linum-on)

(global-set-key (kbd "M-s-%") 'replace-string)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(add-hook 'web-mode-hook '(lambda ()
                            (local-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)
                            (local-set-key (kbd "C-c DEL") sgml-delete-tag)
                            (local-set-key (kbd "C-c C-e") sgml-close-tag)))

(defun prelude-update ()
  "Update Prelude to its latest version."
  (interactive)
  (when (y-or-n-p "Do you want to update Prelude? ")
    (message "Updating installed packages...")
    (epl-upgrade)
    (message "Updating Prelude...")
    (cd prelude-dir)
    (shell-command "git fetch upstream")
    (shell-command "git merge upstream/master")
    (prelude-recompile-init)
    (message "Update finished. Restart Emacs to complete the process.")))
