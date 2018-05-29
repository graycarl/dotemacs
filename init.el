;; Add custom package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Setup PATH or `/usr/local/bin` will missed in PATH
(when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))

;; Some better default is setted by 'better-default' package
;; see: https://github.com/technomancy/better-defaults/
;; I don't like ido-mode, since it's shortcut can not be used all
;; over the emacs (like icomplete-mode C-j).
(require 'better-defaults nil t)
(ido-mode -1)

(icomplete-mode t)
(setq inhibit-startup-screen t)
(setq package-selected-packages
      (quote (markdown-mode helm better-defaults material-theme python
              exec-path-from-shell)))
(setq tab-width 4)
(xterm-mouse-mode t)
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(height . 35))

;; Local config file
(setq custom-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
