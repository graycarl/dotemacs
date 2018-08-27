(require-package 'virtualenvwrapper)
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            ;; Tab Completion
            (setq hippie-expand-try-functions-list
              '(try-complete-file-name-partially
                try-complete-file-name
                try-expand-all-abbrevs
                try-expand-dabbrev
                try-expand-dabbrev-all-buffers
                try-expand-dabbrev-from-kill
                try-complete-lisp-symbol-partially
                try-complete-lisp-symbol))
            (local-set-key (kbd "TAB") 'fancy-tab)
            (setq flycheck-checker 'python-flake8
                  flycheck-checker-error-threshold 900)))
(require-package 'company)
(require-package 'company-anaconda)
(after 'company
  (add-to-list 'company-backends 'company-anaconda))

(provide 'config-python)
