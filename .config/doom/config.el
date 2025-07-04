;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq catppuccin-flavor 'mocha)
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Add spacing between entries in org mode

(after! org
  (setq org-log-done 'time)

  (setq org-cycle-separator-lines 2)

  (setq org-log-into-drawer "LOGBOOK")

  (setq org-todo-keywords
        '(
          (sequence "TODO(t)" "NEXT(n!)" "HOLD(h@/!)" "WAIT(w@/!)" "IDEA(i)" "LOOP(l)" "|" "DONE(d!)" "KILL(k@)")
          (sequence "[ ](T)" "[-](N)" "[?](W)" "|" "[X](D)")
          ))

  (setq org-agenda-custom-commands
        '(("p" "Planning"
           ((tags-todo "+@planning"
                       ((org-agenda-overriding-header "Planning Tasks")))
            (tags-todo "-{.*}"
                       ((org-agenda-overriding-header "Untagged Tasks")))
            (todo ".*" ((org-agenda-files '("~/Notes/Inbox.org"))
                        (org-agenda-overriding-header "Unprocessed Inbox Items")))))

          ("d" "Daily Agenda"
           ((agenda "" ((org-agenda-span 'day)
                        (org-deadline-warning-days 7)
                        (org-agenda-start-day "+0d")
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-remove-times-when-invisible t)))
            (tags-todo "+PRIORITY=\"A\""
                       ((org-agenda-overriding-header "High Priority Tasks")))))

          ("w" "Weekly Review"
           ((agenda ""
                    ((org-agenda-overriding-header "Completed Tasks")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'done))
                     (org-agenda-span 'week)))

            (agenda ""
                    ((org-agenda-overriding-header "Unfinished Scheduled Tasks")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                     (org-agenda-span 'week)))))))

  (setq org-todo-keyword-faces
        '(
          ("TODO" . (:foreground "#fab387" :underline t :weight light))
          ("NEXT" . (:foreground "#89b4fa" :underline t :weight light))
          ("HOLD" . (:foreground "#b4befe" :underline t :weight light))
          ("WAIT" . (:foreground "#a6adc8" :underline t :weight light))
          ("LOOP" . (:foreground "#cba6f7" :underline t :weight light))
          ("IDEA" . (:foreground "#94e2d5" :underline t :weight light))
          ("DONE" . (:foreground "#a6e3a1" :underline t :weight light))
          ("KILL" . (:foreground "#f38ba8" :underline t :weight light)))))


(use-package! org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("⁖" "◉" "○" "✸" "✿")))

;; https://www.reddit.com/r/emacs/comments/1d4ks7s/can_someone_share_their_org_agenda_file_layout/
