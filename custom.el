;; customization add by emacs custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(lsp-enable-snippet nil)
 '(neo-window-width 40)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (helm-core helm neotree projectile lsp-ui lsp-mode org-bullets spaceline-all-the-icons spaceline better-defaults)))
 '(powerline-default-separator (quote slant))
 '(projectile-completion-system (quote ivy))
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
 '(line-number ((t (:background "#262626" :foreground "#8a8a8a"))))
 '(mode-line-buffer-id-inactive ((t (:background "red"))))
 '(org-document-title ((t (:inherit default :weight bold :font "Lucida Grande" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :weight bold :font "Lucida Grande")))))

(cond ((display-graphic-p)
       ;;
       )
      (t
       (custom-set-faces
        '(powerline-active1 ((t (:inherit sml/global :background "#ffffd7" :foreground "#ffffaf"))))
        '(powerline-active2 ((t (:inherit sml/global :background "#ffaf00" :foreground "#ffffaf"))))
        '(sml/folder ((t (:inherit sml/global :background "#ffffaf" :foreground "brightblack" :weight bold))))
        '(sml/git ((t (:inherit (sml/read-only sml/prefix) :background "green" :foreground "white"))))
        '(sml/modes ((t (:inherit sml/global :background "#ffaf00" :foreground "#080808" :weight ultra-bold))))
        '(sml/position-percentage ((t (:inherit sml/prefix :background "#ffffaf" :foreground "#00af00" :weight extra-bold))))
        '(sml/prefix ((t (:inherit sml/global :background "#ffffd7" :foreground "#af0000" :weight extra-bold))))
        '(sml/vc ((t (:inherit sml/git :background "#ffaf00" :foreground "brightred" :weight extra-bold)))))
      ))
