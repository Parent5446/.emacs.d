(add-to-list 'auto-mode-alist '("\\.xsd\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))
(add-to-list 'company-backends #'company-capf)

(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'help-mode-hook 'page-break-lines-mode)
(add-hook 'web-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)
             (local-set-key (kbd "C-c DEL") sgml-delete-tag)
             (local-set-key (kbd "C-c C-e") sgml-close-tag)))
(add-hook 'find-file-not-found-functions 'google-autogen-file-not-found-hook)
(add-hook 'typescript-mode-hook
          '(lambda ()
             (tide-setup)
             (flycheck-mode +1)
             (eldoc-mode +1)
             (company-mode +1)))
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'google3-build-mode-hook #'ac-capf-setup)

(let* ((restart-requested (make-hash-table :test 'equal))
       (restart-timers (make-hash-table :test 'equal))
       (restart-function '(lambda (project-name)
                            (let ((buffer (gethash project-name restart-requested)))
                              (when buffer
                                (with-current-buffer buffer '(lambda () (tide-restart-server)))))))
       (watch-tsconfig '(lambda (tsconfig-file)
                          (file-notify-add-watch
                           tsconfig-file
                           '(created changed)
                           '(lambda (event)
                              (puthash (tide-project-name) t restart-requested))))))
  (add-hook
   'typescript-mode-hook
   '(lambda ()
      (when (not (gethash (tide-project-name) restart-timers))
        (puthash (tide-project-name)
                 (run-at-time "1 sec" 15 restart-function (tide-project-name))
                 restart-timers)
        (remhash (tide-project-name) restart-timers))
      (let ((root-directory (locate-dominating-file
                             (file-name-directory buffer-file-name)
                             '(lambda (dir)
                                (not (string-suffix-p
                                      "Empty results"
                                      (shell-command-to-string
                                       "blaze --noblock_for_lock query 'kind(\"ts_config\", :*)")
                                      t))
                                )))
            (tsconfig-file (concat root-directory "tsconfig.json")))
        (if (file-symlink-p tsconfig-file)
            (watch-tsconfig tsconfig-file)
          (file-notify-add-watch
           (file-chase-links (concat root-directory "tsconfig.json"))
           '(created changed)
           '(lambda (event)
              (watch-tsconfig tsconfig-file)
              (puthash (tide-project-name) t restart-requested))))))))
