;; initializing package.el
(package-initialize)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil
      site-run-file nil)

;; grabbing config from the org file
(org-babel-load-file "~/.emacs.d/README.org")
(put 'upcase-region 'disabled nil)
