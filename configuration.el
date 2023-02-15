(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
(defun fresh ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq make-backup-files nil
      auto-save-default nil
      shell-file-name "/bin/zsh"
      debug-on-error nil
      ispell-program-name "aspell"

      display-line-numbers t
      line-number-mode nil
      electric-pair-preserve-balance nil
      electric-pair-inhibit-predicate
      (lambda (c)
        (if (or (char-equal c ?\") (char-equal c ?\')) (electric-pair-default-inhibit c))))

(electric-pair-mode 1)
(global-display-line-numbers-mode)
(setenv "PATH"
        (concat "/usr/local/bin:" "/Library/TeX/texbin/:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin/")

(use-package all-the-icons
  :ensure t)
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(use-package exec-path-from-shell
  :ensure t)
(exec-path-from-shell-initialize)

(use-package which-key
  :ensure t
  :custom (which-key-idle-delay 1.5)
  :config ;; (which-key-mode)
          (which-key-setup-side-window-right))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(90 . 80) '(100 . 100)))))
(global-set-key (kbd "<f5>") 'toggle-transparency)

(use-package gruvbox-theme
  :ensure t)
;; (use-package spacemacs-theme
;;   :ensure t
;;   :no-require t
;;   :config (load-theme 'spacemacs-dark t))

;; (defun setup-sml-and-theme ()
;;   (setq sml/no-confirm-load-theme t)
;;   (setq powerline-default-separator 'utf-8)
;;   (sml/setup)
;;   (sml/apply-theme 'powerline))

;; (use-package smart-mode-line
;;   :ensure t)

;; (use-package powerline
;;   :ensure t)

;; (use-package smart-mode-line-powerline-theme
;;   :ensure t
;;   :requires (smart-mode-line powerline)
;;   :hook (after-init . setup-sml-and-theme))

(use-package doom-modeline
  :hook ((emacs-startup . doom-modeline-mode))
  :init (setq
         doom-modeline-height                      20
         doom-modeline-bar-width                   3
         doom-modeline-window-width-limit          fill-column
         doom-modeline-project-detection           'project  ;; changed
         doom-modeline-buffer-file-name-style      'relative-to-project  ;; changed
         doom-modeline-icon                        (display-graphic-p)
         ;; doom-modeline-icon                        t  ;; changed
         doom-modeline-major-mode-icon             t
         doom-modeline-major-mode-color-icon       nil
         doom-modeline-buffer-state-icon           t
         doom-modeline-buffer-modification-icon    nil
         doom-modeline-unicode-fallback            nil  ;; changed
         doom-modeline-minor-modes                 nil
         doom-modeline-enable-word-count           nil
         doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode text-mode)
         doom-modeline-buffer-encoding             nil
         doom-modeline-indent-info                 nil
         doom-modeline-checker-simple-format       nil
         doom-modeline-number-limit                99
         doom-modeline-vcs-max-length              12
         doom-modeline-persp-name                  t
         doom-modeline-display-default-persp-name  nil
         doom-modeline-lsp                         t
         doom-modeline-github                      nil
         doom-modeline-github-interval             (* 30 60)
         doom-modeline-modal-icon                  nil

         doom-modeline-env-version       t
         doom-modeline-env-enable-python t
         ;; doom-modeline-env-enable-ruby   t
         ;; doom-modeline-env-enable-perl   t
         ;; doom-modeline-env-enable-go     t
         ;; doom-modeline-env-enable-elixir t
         ;; doom-modeline-env-enable-rust   t

         doom-modeline-env-python-executable "python"
         ;; doom-modeline-env-ruby-executable   "ruby"
         ;; doom-modeline-env-perl-executable   "perl"
         ;; doom-modeline-env-go-executable     "go"
         ;; doom-modeline-env-elixir-executable "iex"
         ;; doom-modeline-env-rust-executable   "rustc"

         doom-modeline-env-load-string "..."

         doom-modeline-mu4e        t
         doom-modeline-irc         t
         doom-modeline-irc-stylize 'identity)
  :config
  (doom-modeline-def-segment nathan/time
    "Time"
    (when (doom-modeline--active)
      (propertize
      (format-time-string " %b %d, %Y - %H:%M ")
      'face (when (doom-modeline--active) `(:foreground "#000000" :background "#F7DC6F")))))

  (doom-modeline-def-modeline 'main
    '(bar workspace-name matches buffer-info buffer-position parrot selection-info process)
    '(objed-state grip lsp major-mode vcs checker nathan/time))

  (doom-modeline-def-modeline 'minimal
    '(bar matches buffer-info-simple)
    '(media-info major-mode "  " nathan/time))

  ;; Change behaviors
  (defun nathan/doom-modeline-update-buffer-file-name (&rest _)
    "Update buffer file name in mode-line."
    (setq doom-modeline--buffer-file-name
          (if buffer-file-name
              (doom-modeline-buffer-file-name)
            (if (string-prefix-p "*Org Src" (format-mode-line "%b"))
                ""
              (propertize "%b"
                          'face (if (doom-modeline--active)
                                    'doom-modeline-buffer-file
                                  'mode-line-inactive)
                          'help-echo "Buffer name
    mouse-1: Previous buffer\nmouse-3: Next buffer"
                          'local-map mode-line-buffer-identification-keymap)))))
  (advice-add #'doom-modeline-update-buffer-file-name :override #'nathan/doom-modeline-update-buffer-file-name))

(use-package better-defaults
  :ensure t)

(use-package ag
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
        helm-autoresize-max-height 40
        helm-autoresize-min-height 20))
(use-package helm-ag
  :ensure t)

(helm-mode 1)
(helm-autoresize-mode 1)
(helm-projectile-on)

(use-package magit
  :ensure t)
(global-set-key (kbd "C-x g") 'magit-status)

;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (push 'company-tabnine company-backends)
;;   (setq company-idle-delay 0)
;;   (setq company-show-numbers t))

(use-package go-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'python-mode-hook (lambda ()
    (setq flycheck-checker 'python-pylint))))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode go-mode) . lsp-deferred)
  :commands lsp)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-peek-enable nil)
  (setq lsp-ui-imenu-enable nil)
  ;; (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-ui-sideline-diagnostic-max-lines 2))
  ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
  ;; (push 'company-capf company-backends))

;; (use-package company-lsp
;;   :ensure t
;;   :config (push 'company-lsp company-backends))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/workspace/"))
  ;; (setq projectile-switch-project-action 'venv-projectile-auto-workon)
  (projectile-mode +1)
  )

(use-package neotree
  :ensure t
  :bind (("<f2>" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  ;; (setq neo-autorefresh t)
  (setq neo-mode-line-type 'none)
  (setq neo-window-width 40)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-to-list 'neo-hidden-regexp-list "__pycache__")
  )

(require 'org-tempo)
(setq org-hide-emphasis-markers t)
(setq org-startup-indented t)
(add-hook 'org-mode-hook 'turn-on-flyspell)
;; (setq org-ellipsis " ..")
;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
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
       ;; `(org-level-8 ((t (,@headline ,@variable-tuple))))
       ;; `(org-level-7 ((t (,@headline ,@variable-tuple))))
       ;; `(org-level-6 ((t (,@headline ,@variable-tuple))))
       ;; `(org-level-5 ((t (,@headline ,@variable-tuple))))
       ;; `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.25))))
       ;; `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
       ;; `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
       ;; `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))

;; (setq org-bullets-bullet-list
;;       '("◉"
;;         "○"
;;         "✸"))
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
  (add-hook 'venv-postactivate-hook (lambda ()
    (setq flycheck-python-pylint-executable (concat "~/.virtualenvs/" venv-current-name "/bin/pylint")))))

(use-package ox-hugo
  :ensure t
  :after ox)

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))
