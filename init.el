;; Add custom package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Some better default is setted by 'better-default' package
;; see: https://github.com/technomancy/better-defaults/
;; I don't like ido-mode, since it's shortcut can not be used all
;; over the emacs (like icomplete-mode C-j).
(require 'better-defaults)
(ido-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(icomplete-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (helm better-defaults material-theme python)))
 '(tab-width 4)
 '(xterm-mouse-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Edit by hands [手写内容]
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(font . "M+ 1mn"))
(load-theme 'material t)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
