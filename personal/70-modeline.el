(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
                    :foreground "gray60" :background "gray20"
                    :inverse-video nil
                    :box '(:line-width 6 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
                    :foreground "gray80" :background "gray40"
                    :inverse-video nil
                    :box '(:line-width 6 :color "gray40" :style nil))
(set-face-attribute 'mode-line-read-only-face nil
                    :inherit 'mode-line-face
                    :foreground "#4271ae"
                    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
                    :inherit 'mode-line-face
                    :foreground "#c82829"
                    :background "#ffffff"
                    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
                    :inherit 'mode-line-face
                    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
                    :inherit 'mode-line-face
                    :foreground "#eab700"
                    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
                    :inherit 'mode-line-face
                    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
                    :inherit 'mode-line-face
                    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
                    :inherit 'mode-line-mode-face
                    :foreground "gray40"
                    :height 110)
(set-face-attribute 'mode-line-process-face nil
                    :inherit 'mode-line-face
                    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
                    :inherit 'mode-line-position-face
                    :foreground "black" :background "#eab700")

mode-line-format

(setq-default
 mode-line-modified
 '(" "
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t "    ")))
   " "))

(setq-default
 mode-line-buffer-identification
 '((:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b  "
                face mode-line-filename-face)))

(setq-default
 mode-line-position
 '((:propertize "%4l:" face mode-line-position-face)
   (:eval (propertize "%3c" 'face
                      (if (>= (current-column) fill-column)
                          'mode-line-80col-face
                        'mode-line-position-face)))))

(setq-default
 mode-line-modes
 '(
   (t erc-modified-channels-object)
   #("%n" 0 2
     (local-map (keymap (mode-line keymap
                                   (mouse-2 . mode-line-widen)))
                mouse-face mode-line-highlight
                help-echo "mouse-2: Remove narrowing from buffer"))
   #(" %[" 0 2 (help-echo "Recursive edit, type C-M-c to get out"))
   (:propertize
    ("" mode-name)
    help-echo "Major mode
mouse-1: Display major mode menu
mouse-2: Show help for major mode
mouse-3: Toggle minor modes"
    face mode-line-mode-face
    mouse-face mode-line-highlight
    local-map (keymap
               (mode-line
                keymap
                (mouse-2 . describe-mode)
                (down-mouse-1 menu-item "Menu Bar" ignore
                              :filter #[(_) "\300 \207" [mouse-menu-major-mode-map] 1]))))
   #("%]" 0 2 (help-echo "Recursive edit, type C-M-c to get out"))
   " "
   (:propertize mode-line-process
                face mode-line-process-face)
   (:propertize
    ("" minor-mode-alist)
    face mode-line-minor-mode-face
    mouse-face mode-line-highlight
    help-echo "Minor mode
mouse-1: Display minor mode menu
mouse-2: Show help for minor mode
mouse-3: Toggle minor modes"
    local-map (keymap
               (mode-line
                keymap
                (mouse-2 . mode-line-minor-mode-help)
                (down-mouse-1 . mouse-minor-mode-menu)
                (down-mouse-3 keymap
                              (abbrev-mode menu-item "Abbrev (Abbrev)"
                                           abbrev-mode
                                           :help "Automatically expand abbreviations"
                                           :button (:toggle . abbrev-mode))
                              (auto-fill-mode menu-item "Auto fill (Fill)"
                                              auto-fill-mode
                                              :help "Automatically insert new lines"
                                              :button (:toggle . auto-fill-function))
                              (auto-revert-mode menu-item "Auto revert (ARev)"
                                                auto-revert-mode
                                                :help "Revert the buffer when the file on disk changes"
                                                :button (:toggle bound-and-true-p auto-revert-mode))
                              (auto-revert-tail-mode menu-item "Auto revert tail (Tail)"
                                                     auto-revert-tail-mode
                                                     :help "Revert the tail of the buffer when buffer grows"
                                                     :enable (buffer-file-name)
                                                     :button (:toggle bound-and-true-p auto-revert-tail-mode))
                              (flyspell-mode menu-item "Flyspell (Fly)"
                                             flyspell-mode
                                             :help "Spell checking on the fly"
                                             :button (:toggle bound-and-true-p flyspell-mode))
                              (font-lock-mode menu-item "Font Lock"
                                              font-lock-mode
                                              :help "Syntax coloring"
                                              :button (:toggle . font-lock-mode))
                              (hide-ifdef-mode menu-item "Hide ifdef (Ifdef)"
                                               hide-ifdef-mode
                                               :help "Show/Hide code within #ifdef constructs"
                                               :button (:toggle bound-and-true-p hide-ifdef-mode))
                              (highlight-changes-mode menu-item "Highlight changes (Chg)"
                                                      highlight-changes-mode
                                                      :help "Show changes in the buffer in a distinctive color"
                                                      :button (:toggle bound-and-true-p highlight-changes-mode))
                              (outline-minor-mode menu-item "Outline (Outl)"
                                                  outline-minor-mode
                                                  :help ""
                                                  :button (:toggle bound-and-true-p outline-minor-mode))
                              (overwrite-mode menu-item "Overwrite (Ovwrt)"
                                              overwrite-mode
                                              :help "Overwrite mode: typed characters replace existing text"
                                              :button (:toggle . overwrite-mode))
                              "Minor Modes")
                )))
   (global-mode-string global-mode-string)
   ))
