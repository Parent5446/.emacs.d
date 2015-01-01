(add-to-list 'auto-mode-alist '("\\.xsd\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))

(add-hook 'help-mode-hook 'page-break-lines-mode)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
