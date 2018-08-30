;; Setup GUI
(unless (display-graphic-p)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

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

;; Auto revert mode
(global-auto-revert-mode t)

(provide 'config-core)
