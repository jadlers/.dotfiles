;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jacob Adlers"
      user-mail-address "jacob.adlers@gmail.com")

;; Update the main key like in spacemacs
(setq doom-localleader-key ",")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "mononoki Nerd Font" :size 15))
(setq doom-font (font-spec :family (if IS-MAC "mononoki Nerd Font Mono" "SauceCodePro Nerd Font Mono")
                           :size (if IS-MAC 13 15)))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
; (setq org-directory "~/org/")
(setq org-directory "~/Nextcloud/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Don't use the lsp formatter by default.
(setq +format-with-lsp nil)

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
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; GENERAL
(setq standard-indent 2)

;; javascript & typescript
(setq js-indent-level 2
      typescript-indent-level 2)

(defun hsplit-and-focus (count)
  ;; Split window horizontally and focus the new window
  (interactive "P<f>")
  (select-window (split-window (selected-window) count 'down ))
  (when evil-auto-balance-windows
    (balance-windows (window-parent))))

(defun vsplit-and-focus (count)
  ;; Split window vertically and focus the new window
  (interactive "P<f>")
  (select-window (split-window (selected-window) count 'right ))
  (when evil-auto-balance-windows
    (balance-windows (window-parent))))

(map! :leader :n "w S" 'hsplit-and-focus
      :leader :n "w V" 'vsplit-and-focus)

;; Completion keybindings
(map! (:when (featurep! :completion company)
       (:after company
        (:map company-active-map
         "TAB"     #'company-complete-selection
         [tab]     #'company-complete-selection))))

;; Start maximized on macOS
(when IS-MAC
  (toggle-frame-maximized))
