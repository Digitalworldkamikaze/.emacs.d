;; package.el stuff
(package-initialize)			

;; Remove some GUI shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Setting-up global keys
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-i") 'imenu)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Apropos options
(setq apropos-sort-by-scores t)	

;; Custom-set variables and faces
(custom-set-variables
 '(bookmark-default-file "~/.emacs.d/bookmarks")
 '(display-line-numbers (quote relative))
 '(global-subword-mode t)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(package-selected-packages (quote (helm use-package)))
 '(sentence-end-double-space nil)
 '(tab-width 4)
 '(winner-mode t))
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "PfEd" :family "Iosevka")))))

;; Cool autocompletion with helm
(require 'helm)

;; Cool autocompletion with IDO 
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

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
