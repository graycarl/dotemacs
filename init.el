;; Package Archive Setup
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; Install use-package
(unless (fboundp 'use-package) 
  (package-refresh-contents)
  (package-install 'use-package))

;; Setup GUI
(unless (display-graphic-p)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; Optimize some shotcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Start server client
(require 'server)
(unless (server-running-p) (server-start))
(setenv "EDITOR" "emacsclient")

;; Some basic editing settings
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq inhibit-startup-screen t)
(setq tab-width 4)
(xterm-mouse-mode t)
;; Setup ido
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Packages
(use-package markdown-mode :ensure t)
(use-package python :ensure t)
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize)))
(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))
(use-package projectile
  :ensure t
  :config
  (projectile-mode))
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode t)
  ;; Emulate Vim Ctrl-C
  (evil-global-set-key 'insert (kbd "C-c") 'evil-normal-state)
  ;; Emulate Vim Ctrl-P
  (evil-global-set-key 'normal (kbd "C-p") 'projectile-find-file))
(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))

;; Local config file
(setq custom-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
