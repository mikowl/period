;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mikowl"
      user-mail-address "michael@mikowl.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;; Make window bigger on startup
(if (display-graphic-p)
  (progn
    (setq initial-frame-alist
      '(
        (tool-bar-lines . 0)
        (width . 146) ; chars
        (height . 47) ; lines
        (left . 0)
        (top . 0)))
      (setq default-frame-alist
        '(
          (tool-bar-lines . 0)
          (width . 146)
          (height . 47)
          (left . 0)
          (top . 0))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; transparent background
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; hide scrollbars
(scroll-bar-mode -1)

;; display time
(display-time)
(setq display-time-format "%I:%M:%S")
(setq display-time-interval 1)

;; line numbers
(setq display-line-numbers-type t)


;; PACKAGES
;; ivy
(use-package! ivy :ensure t
  :diminish (ivy-mode . "")
  :bind
   (:map ivy-mode-map
   ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 15)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
  ;; allow input not in order
    '((t   . ivy--regex-ignore-order))))


;; Org mode stuff

(setq org-directory "~/Documents/Notes/")
(setq org-roam-directory "~/Documents/Notes/")
;(setq org-archive-location "~/Documents/Notes/work-notes.org_archive")

; org-alert
; mode-line, log, message, notifier, osx-notifier
(use-package! org-alert
  :ensure t
  :custom (alert-default-style 'notifier)
  :config(setq org-alert-interval 60
               org-alert-notification-title "Org reminder")
  (org-alert-enable))

;(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

;; superstar-mode on in org-mode
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq
  org-superstar-headline-bullets-list '("✿" "◉" "○" "✸" "▷")
)
;; org download and dragndrop
(use-package! org-download
  :ensure t
  :defer t
  :init
  ;; Add handlers for drag-and-drop when Org is loaded.
  (with-eval-after-load 'org
    (org-download-enable)
  ))


(after! evil-org
  (setq org-startup-folded 'content
        org-ellipsis "..."
        )
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h)
)

(custom-set-faces
 '(egoge-display-time ((t (:foreground "#00ACCD"))))
 '(org-block ((t (:background "#282A3A"))))
 '(org-link ((t (:foreground "#88c0d0" :underline t))))
 '(org-underline ((t (:foreground "#5de4c7" :underline t))))
 '(org-italic ((t (:foreground "#5de4c7"))))
 '(org-bold ((t (:foreground "#5de4c7"))))
 '(org-verbatim ((t (:foreground "#a0abe9" :underline t))))
 '(org-block-begin-line ((t (:background "#5e5773" :foreground "#ada6c0"))))
 '(org-headline-done ((t (:foreground "#78849d"))))
 '(org-hide ((t (:foreground "#282A3A"))))
 '(org-date ((t (:foreground "#AB9DF2"))))
 '(org-level-1 ((t (:foreground "#78DCE8" :weight normal :height 175 :background nil :box nil))))
 '(org-level-2 ((t (:foreground "#A9DC76" :weight normal :height 170))))
 '(org-level-3 ((t (:inherit outline-3 :weight normal :height 170))))
 '(org-level-4 ((t (:foreground "#FC9867" :weight normal :height 170))))
 '(org-level-5 ((t (:inherit outline-5 :foreground "#FFD866" :weight normal :height 170))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "#FF6188" :weight normal :height 170)))))


;; Increase line spacing in org mode
(add-hook 'org-mode-hook (lambda () (setq line-spacing 0.15)))

;; Hide leading stars
(setq org-startup-indented t
      org-hide-leading-stars t
      org-hide-emphasis-markers t)

;; Enable visual-line-mode in org-mode
(with-eval-after-load 'org
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode)
  )

;; change time format to standard am/pm
(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%a %m/%d/%y>" . "<%a %B, %d %Y @ %l:%M%p>"))

;; org-agenda
(setq org-agenda-files (list "~/Documents/Notes/"))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))));
  (setq org-todo-keywords
  '(
  (sequence "TODO" "IN_PROGRESS" "CODE_REVIEW" "BLOCKED" "QA" "UAT" "TO_BE_DEPLOYED" "|" "DONE" "CANCELLED" "ON_HOLD")
  ))

;; org mode keywords
  (setq org-todo-keyword-faces
  '(
  ("TODO" . (:foreground "#a9dc76"))
  ("IN_PROGRESS" . (:foreground "#fc9867" :underline t))
  ("CODE_REVIEW" . (:foreground "#ffd866" :underline t))
  ("BLOCKED" . (:foreground "#ff6188" :underline t))
  ("QA" . (:foreground "#78dce8" :underline t))
  ("UAT" . (:foreground "#25e8ff" :underline t))
  ("TO_BE_DEPLOYED" . (:foreground "#78dce8" :underline t))
  ("CANCELLED" . (:foreground "#d3737d" :background "#4d4d4d"))
  ("DONE" . (:foreground "#ab9df2"))
  ("ON_HOLD" . "#8799e8")
  ("CODE" .  "#22262f")
  ("TO_READ" . "#d983dc")

  ("-_TODO-" . (:foreground "#98bd78" :background "#133560" :height 150))
  ("-_IN_PROGRESS-" . (:background "#2c7286" :foreground "#FFFFFF" :height 150))
  ("-⚐_CODE_REVIEW-" . (:background "#eb9d54" :foreground "#733d09" :height 150))
  ("-_BLOCKED-" . (:background "#b7565f" :foreground "#22262f" :height 150))
  ("-_OPEN-" . (:background "#f9c96f" :foreground "#22262f" :height 150))
  ("-_QA-" . (:background "#55c3b5" :foreground "#22262f" :height 150))
  ("-_UAT-" . (:background "#c491bb" :foreground "#22262f" :height 150))
  ("-_TO_BE_DEPLOYED-" . (:background "#c1d69f" :foreground "#22262f" :height 150))
  ("-_DONE-" . (:background "#091729" :foreground "#68765c" :height 150))
  ("-_CANCELLED-" . (:foreground "#d3737d" :background "#4d4d4d" :height 150))
  ("-_ON_HOLD-" . (:foreground "#FFFFFF" :background "#b6545d" :height 150))
  ))
(setq org-tag-faces
      '(("BOGO" . org-warning) ("STARTED" . "yellow")
        ("HOME" . (:foreground "blue" :weight bold))))

;; theme options
(setq doom-themes-treemacs-enable-variable-pitch nil)

(use-package doom-themes
   :config
   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled
   (load-theme 'doom-tokyo-night t)
   (doom-themes-treemacs-config)
   ;; Corrects (and improves) org-mode's native fontification.
   (doom-themes-org-config))

(setq doom-themes-treemacs-theme "doom-colors")

;; fonts
(setq doom-font (font-spec :family "Source Code Pro for Powerline" :size 16 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Dank Mono" :size 14)
      doom-big-font (font-spec :family "Source Code Pro for Powerline" :size 24))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

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
