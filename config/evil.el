(require-package 'evil)
(require-package 'evil-collection)
(setq evil-want-integration nil)
;; Use C-u to scroll up instead of `universal-argument`
(setq evil-want-C-u-scroll t)
;; Use evil-search instead of isearch
;; TODO: press `n` to forward do not work as expected.
;; Need to be fixed before using evil-search
;; (setq evil-search-module 'evil-search)

(after 'evil

  ;; scrolling like vim
  (setq scroll-conservatively 9999
        scroll-preserve-screen-position t
        scroll-margin 3)
  ;; treat a whole symbol as a word (such as `some_thing`)
  ;; (superword-mode 1)
  (defalias #'forward-evil-word #'forward-evil-symbol)

  ;; Do not use clipboard when normal cut
  ;; (setq select-enable-clipboard nil)

  ;; Fix search word
  ;; See: https://emacs-china.org/t/evil-search-word-forward--/3340
  (defun evil-search-symbol-backward ()
    (interactive)
    (evil-search-word-backward 1 t))
  (defun evil-search-symbol-forward ()
    (interactive)
    (evil-search-word-forward 1 t))
  (define-key evil-motion-state-map "#" #'evil-search-symbol-backward)
  (define-key evil-motion-state-map "*" #'evil-search-symbol-forward)
  )

(evil-mode t)
(evil-collection-init)

(provide 'config-evil)
