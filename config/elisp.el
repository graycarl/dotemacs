(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; Tab Completion
            (local-set-key (kbd "TAB") 'fancy-tab)))
