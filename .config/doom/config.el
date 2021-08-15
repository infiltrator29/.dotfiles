;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; == KEYBINDIGS ==
(map! :ne "SPC a" #'+hydra/window-nav/body) ;easy deal with emacs windows
(map! :n "s" nil
      :m  "s" #'evil-avy-goto-char-2
      :nm "g s s" nil
      :nm "g s s" #'evil-avy-goto-char-timer)

;; == CUSTOM FUNCTIONS ==
(defun insert-last-screenshot-org ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)

  (setq screenpath "/home/user/QubesIncoming/dom0")

  (setq filename
        ;; Get filename and trail whitespaces
        (replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" ""
                                                                             (shell-command-to-string (concat "cd " screenpath " && ls -1t *.png | head -1")))))
  (setq newfilename
        (concat
         (make-temp-name
          (concat (file-name-sans-extension (buffer-name))
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (setq newpath
        (concat (file-name-directory (buffer-file-name)) (file-name-sans-extension (buffer-name))))


  ;; Rename file as a first step
  (shell-command (concat "mv "screenpath"/"filename " " screenpath"/"newfilename))

  ;; Move screenshot into relative directory (and create this directory)
  (shell-command (concat "mkdir --parents "newpath"; mv " screenpath"/"newfilename " $_"))

  (insert (concat "[[" newpath"/"newfilename "]]"))
  (org-display-inline-images))


(doom/set-frame-opacity 100)
(setq +doom-dashboard-banner-dir "~/.config/doom/banner/")
(setq +doom-dashboard-banner-padding '(1 . 2))
;;(toggle-frame-fullscreen)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or ;; xlfd font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight
;; 'semi-light)
;;
;;  doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed
;; and available. You can either set `doom-theme' or manually load a
;; theme with the `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(add-hook 'after-init-hook 'global-color-identifiers-mode)


(after! olivetti
  (setq olivetti-body-width 79))

(after! undo-tree
  (setq undo-tree-auto-save-history nil))

(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-hide-emphasis-markers t
        org-bullets-bullet-list '("⁖")
        org-pretty-entities t
        org-ellipsis "  "
        org-log-done 'time
        org-agenda-files (list "~/org/roam/journal/" "~/org/roam/" org-directory))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "STRT(s)" "NEXT(n)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
          (sequence "IDEA(i)" "MEMORY(m)" "VICTORY(v)" "NOTE(N)" "|" "NoNe")
          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))


  (setq org-tag-alist '(("meet" . ?m)

                        (:startgrouptag)
                        ("people")
                        (:grouptags)
                        ("{@[^_].*[^_]$}")
                        (:endgrouptag)

                        (:startgrouptag)
                        ("projects")
                        (:grouptags)
                        ("{^_.*_}")
                        (:endgrouptag)

                        (:startgrouptag)
                        ("places")
                        (:grouptags)
                        ("{^@_.*[^_]$}")
                        (:endgrouptag)))

  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
   '(org-document-title ((t (:inherit outline-1 :height 1.4))))
   ))

(after! org-journal
  (add-hook 'org-journal-mode-hook (lambda ()
                                     (olivetti-mode)
                                     (setq display-line-numbers nil)
                                     (setq indicate-empty-lines nil)
                                     (setq header-line-format " ")
                                     (custom-set-faces
                                      '(header-line ((t (:inherit header-line :height 1.5))))
                                      )
                                     (setq fill-column 70)
                                     ))

  (setq org-journal-date-format "%A, %d %B %Y"
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-dir "~/org/roam/journal"
        org-journal-file-type 'daily
        org-journal-time-prefix "*** "
        org-extend-today-until 5))

(after! deft
  (setq deft-directory "~/org/"
        deft-extensions '("org")
        deft-recursive t))

(after! vterm
  (add-hook 'vterm-mode-hook (lambda ()
                               (map! :mode 'vterm-mode :ne "SPC j" #'vterm-send-escape)
                               (map! :mode 'vterm-mode :i "Q Q" #'vterm-send-escape))))


;;(setq org-roam-directory "~/org/roam/")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over



;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
