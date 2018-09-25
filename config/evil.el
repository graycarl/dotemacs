(require-package 'evil)
(require-package 'evil-collection)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
;; Use C-u to scroll up instead of `universal-argument`
(setq evil-want-C-u-scroll t)
;; Use evil-search instead of isearch
(setq evil-search-module 'evil-search)

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
  (defun evil-ex-search-symbol-backward ()
    (interactive)
    (evil-ex-search-word-backward 1 t))
  (defun evil-ex-search-symbol-forward ()
    (interactive)
    (evil-ex-search-word-forward 1 t))
  
  ;; Ex commands
  (evil-ex-define-cmd "focus" 'org-narrow-to-element)
  (evil-ex-define-cmd "unfocus" 'widen)

  ;; Search english dictionary
  (setq evil-lookup-func (quote youdao-dictionary-search-at-point+))
  
  (define-key evil-motion-state-map "#" #'evil-ex-search-symbol-backward)
  (define-key evil-motion-state-map "*" #'evil-ex-search-symbol-forward))


(evil-mode t)
(evil-collection-init)

(provide 'config-evil)
