;; package.el stuff
(package-initialize)			

;; Remove some GUI shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; Load theme
(load-theme 'zerodark t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Package archives
(defvar gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))


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
 '(bookmark-default-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" default)))
 '(display-line-numbers (quote relative))
 '(global-subword-mode t)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update pdf-tools zerodark-theme solarized-theme nord-theme evil helm use-package)))
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

;; Enable some "confusing" functions
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

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
