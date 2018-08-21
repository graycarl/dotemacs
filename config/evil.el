(setq evil-want-integration nil)
(require-package 'evil)
(evil-mode t)
(require-package 'evil-collection)
(evil-collection-init)

;; scrolling like vim
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t
      scroll-margin 3)


(provide 'config-evil)
