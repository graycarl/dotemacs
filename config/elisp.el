(add-hook 'emacs-lisp-mode-hook
          (lambda ()
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
            (local-set-key (kbd "TAB") 'fancy-tab)))
