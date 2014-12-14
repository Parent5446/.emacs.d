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
 '(delete-old-versions t)
 '(doc-view-continuous t)
 '(file-precious-flag t)
 '(global-linum-mode t)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(linum-relative-current-symbol "")
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(mode-line-format
   (quote
    ("%e" mode-line-position mode-line-client mode-line-modified mode-line-buffer-identification smartrep-mode-line-string
     (vc-mode vc-mode)
     mode-line-modes)))
 '(tex-bibtex-command "biber")
 '(version-control t)
 '(whitespace-line-column 120)
 '(whitespace-style
   (quote
    (face empty trailing lines-tail space-before-tab space-after-tab))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
