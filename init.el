;; init.el --- Emacs configuration
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(org-babel-load-file
 (expand-file-name "configuration.org" "~/.emacs.d/"))
