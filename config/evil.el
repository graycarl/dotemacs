(setq evil-want-integration nil)
(require-package 'evil)
(require-package 'evil-collection)

(after 'evil

  ;; scrolling like vim
  (setq scroll-conservatively 9999
        scroll-preserve-screen-position t
        scroll-margin 3)
  ;; treat a whole symbol as a word (such as `some_thing`)
  ;; (superword-mode 1)
  (defalias #'forward-evil-word #'forward-evil-symbol)

  ;; Do not use clipboard when normal cut
  (setq select-enable-clipboard nil)
  )

(evil-mode t)
(evil-collection-init)

(provide 'config-evil)
