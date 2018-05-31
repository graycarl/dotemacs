;; Add custom package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Selected Package List
(setq package-selected-packages
      (quote (markdown-mode helm material-theme python
              exec-path-from-shell smex projectile)))

;; Setup PATH or `/usr/local/bin` will missed in PATH
(when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))

;; Setup GUI
(unless (display-graphic-p)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; Setup Completion
(ido-mode t)
(setq ido-enable-flex-matching t)
(if (fboundp 'smex)
  (progn
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is your old M-x.
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

;; Optimize some shotcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq visible-bell t)

(setq inhibit-startup-screen t)
(setq tab-width 4)
(xterm-mouse-mode t)
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(height . 35))

;; Project Management
(if (fboundp 'projectile-mode)
  (projectile-mode))

;; Start server client
(require 'server)
(unless (server-running-p) (server-start))
(setenv "EDITOR" "emacsclient")

;; Local config file
(setq custom-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
