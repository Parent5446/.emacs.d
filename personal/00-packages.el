(prelude-require-package 'anything)
(prelude-require-package 'anything-git-files)
(prelude-require-package 'anything-git-grep)
(prelude-require-package 'apache-mode)
(prelude-require-package 'bind-key)
(prelude-require-package 'company)
(prelude-require-package 'company-c-headers)
(prelude-require-package 'company-go)
(prelude-require-package 'company-php)
(prelude-require-package 'company-ycmd)
(prelude-require-package 'flycheck-ycmd)
(prelude-require-package 'helm-bibtex)
(prelude-require-package 'helm-mt)
(prelude-require-package 'hyde)
(prelude-require-package 'linum-relative)
(prelude-require-package 'multiple-cursors)
(prelude-require-package 'multi-term)
(prelude-require-package 'mc-extras)
(prelude-require-package 'osx-clipboard)
(prelude-require-package 'osx-pseudo-daemon)
(prelude-require-package 'page-break-lines)
(prelude-require-package 'tide)
(prelude-require-package 'ycmd)

(require 'hyde)
(require 'linum-relative)
(require 'magit-gerrit)
(require 'multiple-cursors)
(require 'multi-term)
(require 'mc-extras)
(require 'filenotify)
(require 'flycheck)
(require 'simple)
(require 'tide)
(require 'ycmd)
(require 'company-ycmd)
(require 'flycheck-ycmd)

(defvar google-exclude-load-path-items
  '("third_party/.*/auto_complete"
    "third_party/.*/cl_lib"
    "third_party/.*/company_mode"
    "third_party/.*/dash"
    "third_party/.*/ess_mode"
    "third_party/.*/ess_mode/lisp"
    "third_party/.*/f"
    "third_party/.*/git_modes"
    "third_party/.*/magit"
    "third_party/.*/markdown_mode"
    "third_party/.*/yasnippet"))

(defun allowed-google-load-path-additions (path)
  "Decides which PATH items should be added to the load path."
  (let ((value t))
    (dolist (exclude-suffix google-exclude-load-path-items value)
      (when (string-match exclude-suffix path)
        (setq value nil)))))

(setq google-update-load-path 'allowed-google-load-path-additions)

(require 'google)
(require 'google3-mode)
(require 'google-cc-extras)
(require 'googlemenu)
(require 'csearch)
(require 'csearch-ui)
(require 'citc)
(require 'google-lsp)
(require 'rotate-among-files)
(require 'compilation-colorization)
