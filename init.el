;; package.el stuff
(package-initialize)			

;; Those little guys in the end of a buffer
(setq-default indicate-empty-lines t)

;; Remove some GUI shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; Load theme
(load-theme 'doom-city-lights t)

;; Package archives
(defvar gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

;; Set a backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Trying packages
(use-package try
             :ensure t)

;; Which key?
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Vim-mode for everything
(use-package evil
  :ensure t
  :config (evil-mode))

;; y or n instead of 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Setting-up global keys
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-i") 'imenu)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Apropos options
(setq apropos-sort-by-scores t)	

;; Custom-set variables and faces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(bookmark-default-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "0809c08440b51a39c77ec5529f89af83ab256a9d48107b088d40098ce322c7d8" "7c4cfa4eb784539d6e09ecc118428cd8125d6aa3053d8e8413f31a7293d43169" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" default)))
 '(display-line-numbers (quote relative))
 '(global-subword-mode t)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (org-bullets which-key try doom-themes minimap gnu-elpa-keyring-update pdf-tools zerodark-theme solarized-theme nord-theme evil helm use-package)))
 '(sentence-end-double-space nil)
 '(tab-width 4)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "PfEd" :family "Iosevka")))))

;; Cool autocompletion with helm
(require 'helm)

;; Cool autocompletion with IDO 
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))

;; Point-and-mark stuff
(delete-selection-mode)

;; TRAMP functions
(defun sudo ()
  "Use TRAMP to 'sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

;; Dired file-manager functions
(require 'dired-x)

;; Org-mode functions
;; Bullets
(use-package org-bullets
  :ensure t)

;; Set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;; Capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/Users/bjm/todo.org" "Tasks")
         "* TODO [#A] %?")))

