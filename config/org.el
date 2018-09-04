;; Setup org mode, copy from Bling DotEmacs
(require-package 'evil-org)
(after 'org

  (setq org-log-done t)
  (setq org-log-into-drawer t)
  (setq org-startup-indented t)
  (setq org-indent-indentation-per-level 2)
  ;; (setq org-src-fontify-natively t)

  (setq org-agenda-files `(,org-directory))

  ;; Need to be fixed
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "" "TASKS")
           "* TODO %?\n%U\n%a\n")
          ("n" "Note" entry (file+headline "" "NOTES")
           "* %? :NOTE:\n%U\n%a\n")
          ("j" "Journal" entry (file+datetree "" "Journals")
           "* %U\n** %?")))

  ;; Evil org
  (require 'evil-org)
  (add-hook 'org-mode-hook 'evil-org-mode)
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)

  ;; Visual line mode
  ;; 结果发现中文的确不太适合自动去 Breakline，最好使用手动用 M-q 来自动换行。
  ;; (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook (lambda () (setq fill-column 80)))

  ;; Ignore planned tasks in global task list
  (setq org-agenda-todo-ignore-scheduled t)

  ;; Optimize Sparsetrees when navigated from agenda view
  (setq org-show-context-detail '((agenda . tree)
                                  (bookmark-jump . lineage)
                                  (isearch . lineage)
                                  (default . ancestors)))

  (setq org-completion-use-ido t)
)
