(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq make-backup-files nil)
(setq auto-save-default nil)
(electric-pair-mode 1)
(global-display-line-numbers-mode)
(setenv "PATH"
       (concat "/Library/TeX/texbin/" ":" (getenv "PATH")))

(use-package gruvbox-theme
  :ensure t)
;; (use-package spacemacs-theme
;;   :ensure t
;;   :no-require t
;;   :config (load-theme 'spacemacs-dark t))

(defun setup-sml-and-theme ()
  (setq sml/no-confirm-load-theme t)
  (setq powerline-default-separator 'utf-8)
  (sml/setup)
  (sml/apply-theme 'powerline))

(use-package smart-mode-line
  :ensure t)

(use-package powerline
  :ensure t)

(use-package smart-mode-line-powerline-theme
  :ensure t
  :requires (smart-mode-line powerline)
  :hook (after-init . setup-sml-and-theme))

;; (cond ((display-graphic-p)
;;        ;; SPACELINE
;;        (use-package spaceline
;; 	 :ensure t
;; 	 :init
;; 	 (require 'spaceline-config)
;; 	 ;; (setq spaceline-all-the-icons--height 0.9)
;; 	 (spaceline-define-segment env
;; 	   "current virtualenv"
;; 	   (propertize (venv-current-name) 'face '((t (:foreground "IndianRed"))))
;; 	   :enable t)
;; 	 ;; (spaceline-emacs-theme)
;; 	 )
;;        ;; (load "~/.emacs.d/my_mode_line")

;;        ;; ALL THE ICONS
;;        ;; (use-package all-the-icons
;;        ;; 	 :ensure t)

;;        ;; SPACELINE ALL THE ICONS
;;        ;; (use-package spaceline-all-the-icons
;;        ;; 	 :ensure t
;;        ;; 	 :after spaceline
;;        ;; 	 :config
;;        ;; 	 (spaceline-all-the-icons-theme))
;;        )
;;       (t
;; 	(use-package doom-modeline
;; 	  :ensure t
;; 	  :hook (after-init . doom-modeline-mode))
;;        ))

(use-package better-defaults
  :ensure t)

(use-package helm
  :ensure t
  :bind
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-buffers-list)
  ("M-x" . helm-M-x)
  :bind
  (:map helm-map
        ("<tab>" . helm-execute-persistent-action)
        ("C-z" . helm-select-action))
  :config
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20))
(helm-mode 1)
(helm-autoresize-mode 1)

;; (use-package awesome-tab
;;   :load-path "~/.emacs.d/awesome-tab/"
;;   :config (awesome-tab-mode 1))

(use-package magit
  :ensure t)

(use-package company
  :ensure t)

(use-package company-tabnine
  :ensure t
  :config
  (push 'company-tabnine company-backends)
  (setq company-idle-delay 0)
  (setq company-show-numbers t))

(use-package flycheck
  :ensure t)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (add-hook 'python-mode-hook (lambda()
                                (lsp)
                                (setq flycheck-checker 'python-pylint)
                                (push 'company-tabnine company-backends)))
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-peek-enable nil)
  (setq lsp-ui-imenu-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :ensure t)
  ;; :config (push 'company-lsp company-backends))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

(setq flycheck-checker 'python-pylint)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/Workspace/"))
  (projectile-mode +1)
  )

(use-package neotree
  :ensure t
  :bind (("<f2>" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-to-list 'neo-hidden-regexp-list "__pycache__")
  )

(setq org-hide-emphasis-markers t)
(setq org-startup-indented t)
(setq org-ellipsis " ..")
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(if (display-graphic-p)
    (let* ((variable-tuple
            (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                  ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                  ((x-list-fonts "Verdana")         '(:font "Verdana"))
                  ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                  (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
           (headline           `(:inherit default :weight bold)))

      (custom-theme-set-faces
       'user
       `(org-level-8 ((t (,@headline ,@variable-tuple))))
       `(org-level-7 ((t (,@headline ,@variable-tuple))))
       `(org-level-6 ((t (,@headline ,@variable-tuple))))
       `(org-level-5 ((t (,@headline ,@variable-tuple))))
       `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.25))))
       `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
       `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))

(setq org-bullets-bullet-list
      '("◉"
        "○"
        "✸"))
(setq org-emphasis-alist
      '(("*" (bold :foreground "IndianRed1" :weight bold))
        ("/" italic)
        ("_" (underline :foreground "OliveDrab1"))
        ("=" (:background "maroon" :foreground "white"))
        ("~" (:background "deep sky blue" :foreground "MidnightBlue"))
        ("+" (:strike-through t))))

(use-package virtualenvwrapper
  :ensure t
  :init
  (setq venv-workon-cd t)
  (add-hook 'venv-postactivate-hook #'lsp))

(use-package ox-hugo
  :ensure t
  :after ox)
