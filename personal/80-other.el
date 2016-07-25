(setq guru-warn-only nil)

(setq hyde-home "/home/parent5446/Documents/parent5446-blog")

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(linum-on)

(global-set-key (kbd "M-s-%") 'replace-string)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c z l") 'google-lint)
(global-set-key (kbd "C-c z g") 'autogen)
(global-set-key (kbd "C-c z c") 'google3-build)
(global-set-key (kbd "C-c z t") 'google3-test)
(global-set-key (kbd "C-x p c") 'p4-change)

(defun prelude-update ()
  "Update Prelude to its latest version."
  (interactive)
  (when (y-or-n-p "Do you want to update Prelude? ")
    (message "Updating installed packages...")
    (epl-upgrade)
    (message "Updating Prelude...")
    (cd prelude-dir)
    (shell-command "git fetch upstream")
    (shell-command "git merge upstream/master -m \"Updating prelude\"")
    (prelude-recompile-init)
    (message "Update finished. Restart Emacs to complete the process.")))

(setq magit-last-seen-setup-instructions "1.4.0")
