(package-initialize)			

;; package archives
(defvar gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

;; bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; starting the server
(server-start)

;; grabbing config from the org file
(org-babel-load-file (expand-file-name "config.org"))
