;; init.el --- Emacs configuration
(org-babel-load-file
 (expand-file-name "configuration.org" "~/.emacs.d/"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

