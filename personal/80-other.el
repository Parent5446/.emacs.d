(setq guru-warn-only nil)

(setq typescript-indent-level 2)
(setq tide-tsserver-directory
      (concat "/google/src/head/depot/google3"
              "/third_party/javascript/node_modules"
              "/typescript/stable/lib"))
(setq google3-eglot-ciderlsp-binary "ssh")
(setq google3-eglot--ciderlsp-args
      '("exelion.c.googlers.com"
        "/google/bin/releases/editor-devtools/ciderlsp"
        "--noforward_sync_responses"
        "--hub_addr=blade:languageservices-staging"
        "--request_options=enable_placeholders,debug_info"
        "--tooltag=emacs-eglot"))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(linum-on)

(global-set-key (kbd "M-s-%") 'replace-string)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c z l") #'google-lint)
(global-set-key (kbd "C-c z g") 'autogen)
(global-set-key (kbd "C-c z c") 'google3-build)
(global-set-key (kbd "C-c z C") 'google3-compile-current-file)
(global-set-key (kbd "C-c z t") 'google3-test)
(global-set-key (kbd "C-c z s") 'csearch-ui)
(global-set-key (kbd "C-c z f") 'fig-status)
(global-set-key (kbd "<f5>") #'company-complete)
(global-set-key (kbd "<f6>") 'cs)
(global-set-key (kbd "C-c z r") #'google-rotate-among-files)
(google-cc-extras/bind-default-keys)

(p4-enable-file-name-handler)
(p4-enable-ffap-support)
(google-yasnippets-load)
(google3-eglot-setup)
(google3-build-capf-enable-completions)

(defun citc-client-from-path (path)
  (let ((components (split-string path "/")))
    (if (and (>= (length components) 6)
             (string= (nth 0 components) "")
             (string= (nth 1 components) "google")
             (string= (nth 2 components) "src")
             (string= (nth 3 components) "cloud"))
        (nth 5 components))))

(defadvice create-file-buffer (after create-file-buffer-citc activate)
  "If this is a file in a CITC client, put the CITC client name"
  "into the buffer name."
  (let* ((path (expand-file-name (ad-get-arg 0)))
         (citc-client (citc-client-from-path path))
         (filename (file-name-nondirectory path)))
    (if citc-client
        (with-current-buffer ad-return-value
          (rename-buffer
           (generate-new-buffer-name
            (concatenate 'string filename "<" citc-client ">")
            (buffer-name ad-return-value)))))))

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
