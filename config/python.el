(require-package 'virtualenvwrapper)
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

(require-package 'company)
(require-package 'company-anaconda)
(after 'company
  (add-to-list 'company-backends 'company-anaconda))

(provide 'config-python)
