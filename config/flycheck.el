(require-package 'flycheck)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc html-tidy))
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'config-flycheck)
