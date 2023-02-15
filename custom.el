;; customization add by emacs custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(helm-completion-style 'emacs)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(lsp-enable-snippet nil)
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position
     (vc-mode vc-mode)
     sml/pre-modes-separator mode-line-misc-info mode-line-end-spaces))
 '(mode-line-in-non-selected-windows nil)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(helm-rg which-key ox-hugo virtualenvwrapper neotree company lsp-ui flycheck magit use-package exec-path-from-shell go-mode ace-window helm-ag helm-projectile ag gruvbox-theme doom-modeline ivy all-the-icons lsp-mode spaceline-all-the-icons better-defaults))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828"))
 '(powerline-buffer-size-suffix nil)
 '(powerline-default-separator 'bar)
 '(powerline-display-buffer-size nil)
 '(powerline-display-hud nil)
 '(powerline-display-mule-info nil)
 '(powerline-text-scale-factor nil)
 '(projectile-completion-system 'ivy)
 '(safe-local-variable-values '((eval venv-workon "feedback")))
 '(sml/show-client nil)
 '(spaceline-all-the-icons-file-name-highlight nil)
 '(spaceline-all-the-icons-highlight-file-name t)
 '(spaceline-all-the-icons-icon-set-eyebrowse-slot 'circle)
 '(spaceline-all-the-icons-icon-set-sun-time 'sun/moon)
 '(spaceline-all-the-icons-icon-set-vc-icon-git 'github-logo)
 '(spaceline-all-the-icons-separator-type 'none))

(load-theme 'gruvbox-dark-medium)

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
 '(sml/global ((t (:background "#282828" :foreground "gray60" :inverse-video nil))))
 '(sml/position-percentage ((t (:inherit sml/prefix :background "#504945" :foreground "ivory" :weight normal))))
 '(sml/projectile ((t (:inherit sml/git :foreground "green yellow"))))
 '(sml/read-only ((t (:inherit sml/not-modified))))
 '(sml/vc ((t (:inherit sml/git :background "#504945" :foreground "green yellow"))))
 '(sml/vc-edited ((t (:inherit sml/prefix :background "#504945" :foreground "firebrick1")))))
