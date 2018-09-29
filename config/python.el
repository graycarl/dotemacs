(require-package 'virtualenvwrapper)
(setq-default mode-line-format (cons mode-line-format '(:exec venv-current-name)))

(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            ;; Tab Completion
            (local-set-key (kbd "TAB") 'fancy-tab)
            ;; Next Error
            (local-set-key (kbd "<f8>") 'next-error)
            (setq flycheck-checker 'python-flake8
                  flycheck-checker-error-threshold 900)))
(require-package 'company)
(require-package 'company-anaconda)
(after 'company
  (add-to-list 'company-backends 'company-anaconda))

(provide 'config-python)
