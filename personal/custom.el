(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style
   (quote
    (("" "%(PDF)%(latex) %(extraopts) -file-line-error %S%(PDFout)"))))
 '(TeX-command-BibTeX "Biber")
 '(backup-by-copying t)
 '(backward-delete-char-untabify-method (quote hungry))
 '(delete-old-versions t)
 '(doc-view-continuous t)
 '(file-precious-flag t)
 '(global-linum-mode t)
 '(indent-tabs-mode t)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(linum-relative-current-symbol "")
 '(mac-command-modifier (quote super))
 '(mac-emulate-three-button-mouse t)
 '(mac-option-modifier (quote meta))
 '(mac-system-move-file-to-trash-use-finder t)
 '(message-send-mail-function (quote smtpmail-send-it))
 '(mode-line-format
   (quote
    ("%e" mode-line-position mode-line-client mode-line-modified mode-line-buffer-identification smartrep-mode-line-string
     (vc-mode vc-mode)
     mode-line-modes)))
 '(osx-clipboard-mode t)
 '(osx-pseudo-daemon-mode t)
 '(prelude-clean-whitespace-on-save nil)
 '(save-interprogram-paste-before-kill t)
 '(send-mail-function (quote sendmail-query-once))
 '(tex-bibtex-command "biber")
 '(user-full-name "Tyler Romeo")
 '(user-mail-address "tylerromeo@gmail.com")
 '(version-control t)
 '(whitespace-line-column 120)
 '(whitespace-style (quote (face empty trailing lines-tail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
