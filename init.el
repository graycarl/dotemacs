;; Package Archive Setup
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages
      (quote (markdown-mode helm python
              exec-path-from-shell smex projectile
              material-theme leuven-theme solarized-theme zenburn-theme
              evil evil-collection)))
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

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

;; Setup ido and smex
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

(setq inhibit-startup-screen t)
(setq tab-width 4)
(xterm-mouse-mode t)

;; Project Management
(if (fboundp 'projectile-mode)
  (projectile-mode))

;; Start server client
(require 'server)
(unless (server-running-p) (server-start))
(setenv "EDITOR" "emacsclient")

;; Evil Mode
(setq evil-want-integration nil)
(evil-mode t)
(evil-collection-init)
;; Emulate Vim Ctrl-C
(evil-global-set-key 'insert (kbd "C-c") 'evil-normal-state)
;; Emulate Vim Ctrl-P
(evil-global-set-key 'normal (kbd "C-p") 'projectile-find-file)

;; Local config file
(setq custom-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
