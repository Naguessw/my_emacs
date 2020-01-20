;; customization add by emacs custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(line-number-mode nil)
 '(lsp-enable-snippet nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position
     (vc-mode vc-mode)
     sml/pre-modes-separator mode-line-misc-info mode-line-end-spaces)))
 '(mode-line-in-non-selected-windows nil)
 '(neo-window-width 40)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (neotree projectile lsp-ui lsp-mode org-bullets spaceline-all-the-icons spaceline better-defaults)))
 '(powerline-buffer-size-suffix nil)
 '(powerline-default-separator (quote bar))
 '(powerline-display-buffer-size nil)
 '(powerline-display-hud nil)
 '(powerline-display-mule-info nil)
 '(powerline-text-scale-factor nil)
 '(projectile-completion-system (quote ivy))
 '(sml/show-client nil)
 '(spaceline-all-the-icons-file-name-highlight nil)
 '(spaceline-all-the-icons-highlight-file-name t)
 '(spaceline-all-the-icons-icon-set-eyebrowse-slot (quote circle))
 '(spaceline-all-the-icons-icon-set-sun-time (quote sun/moon))
 '(spaceline-all-the-icons-icon-set-vc-icon-git (quote github-logo))
 '(spaceline-all-the-icons-separator-type (quote none)))

(if (display-graphic-p)
    (custom-set-variables
     '(initial-frame-alist (quote ((fullscreen . maximized))))
     '(spaceline-all-the-icons-file-name-highlight nil)
     '(spaceline-all-the-icons-highlight-file-name t)
     '(spaceline-all-the-icons-icon-set-eyebrowse-slot (quote circle))
     '(spaceline-all-the-icons-icon-set-sun-time (quote sun/moon))
     '(spaceline-all-the-icons-icon-set-vc-icon-git (quote github-logo))
     '(spaceline-all-the-icons-separator-type (quote none))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "Meslo LG L DZ for Powerline"))))
 '(flycheck-error ((t (:inherit error :background "#dc322f" :foreground "#262626"))))
 '(flycheck-warning ((t (:inherit warning :background "#ffff00" :foreground "#262626"))))
 '(line-number ((t (:background "#282828" :foreground "#8a8a8a"))))
 '(mode-line ((t (:background "#282828" :foreground "gray60" :box nil))))
 '(mode-line-buffer-id-inactive ((t (:background "red"))))
 '(org-document-title ((t (:inherit default :weight bold :font "Lucida Grande" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande" :height 1.5))))
 '(org-level-2 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande" :height 1.5))))
 '(org-level-3 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande" :height 1.25))))
 '(org-level-4 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande" :height 1.25))))
 '(org-level-5 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :foreground "white" :weight bold :font "Lucida Grande"))))
 '(sml/global ((t (:background "#282828" :foreground "gray60" :inverse-video nil))))
 '(sml/position-percentage ((t (:inherit sml/prefix :background "#504945" :foreground "ivory" :weight normal))))
 '(sml/projectile ((t (:inherit sml/git :foreground "green yellow"))))
 '(sml/read-only ((t (:inherit sml/not-modified))))
 '(sml/vc ((t (:inherit sml/git :background "#504945" :foreground "green yellow"))))
 '(sml/vc-edited ((t (:inherit sml/prefix :background "#504945" :foreground "firebrick1")))))
