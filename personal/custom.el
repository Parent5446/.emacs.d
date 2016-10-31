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
 '(company-tooltip-align-annotations t)
 '(default-frame-alist (quote ((font . "DejaVu Sans Mono-10"))))
 '(delete-old-versions t)
 '(doc-view-continuous t)
 '(file-precious-flag t)
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-disabled-checkers (quote (php-phpmd)))
 '(flycheck-phpmd-rulesets nil)
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
 '(multi-term-program "/bin/bash")
 '(osx-clipboard-mode t)
 '(osx-pseudo-daemon-mode t)
 '(package-selected-packages
   (quote
    (ac-php-core anaconda-mode avy company dash f flycheck gh git-commit go-mode helm helm-core magit magit-popup multiple-cursors pcache php-mode projectile typescript-mode with-editor yasnippet js2-refactor tide page-break-line page-break-lines company-php company-go company-c-headers zop-to-char zenburn-theme yaml-mode web-mode volatile-highlights undo-tree symon smex smartrep smartparens rainbow-mode rainbow-delimiters ov osx-pseudo-daemon osx-clipboard operate-on-number move-text mediawiki mc-extras magit-p4 magit-gh-pulls magit-gerrit linum-relative key-chord json-mode js2-mode ido-ubiquitous hyde helm-projectile helm-mt helm-descbinds helm-bibtex helm-ag guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flx-ido expand-region elisp-slime-nav easy-kill discover-my-major diminish diff-hl company-auctex company-anaconda cdlatex browse-kill-ring bind-key apache-mode anzu anything-git-grep anything-git-files ace-window ace-jump-mode ace-jump-buffer)))
 '(prelude-clean-whitespace-on-save nil)
 '(safe-local-variable-values
   (quote
    ((web-mode-indent-style . 2)
     (web-mode-attr-indent-offset)
     (web-mode-block-padding . 4)
     (web-mode-css-indent-offset . 2)
     (web-mode-markup-indent-offset . 2)
     (css-indent-offset . 4)
     (js2-strict-inconsistent-return-warning)
     (js2-indent-switch-body . t)
     (php-mode-coding-style quote symfony2))))
 '(save-interprogram-paste-before-kill t)
 '(send-mail-function (quote sendmail-query-once))
 '(symon-delay 1)
 '(symon-mode t)
 '(symon-monitors
   (quote
    (symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-battery-monitor symon-current-time-monitor)))
 '(tex-bibtex-command "biber")
 '(typescript-expr-indent-offset 4)
 '(typescript-indent-level 2)
 '(user-full-name "Tyler Romeo")
 '(user-mail-address "tylerromeo@gmail.com")
 '(version-control t)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-line-column 120)
 '(whitespace-style (quote (face empty trailing lines-tail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "SourceCodePro+Powerline+Awesome Regular")))))
