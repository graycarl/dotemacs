;; Optimize some shotcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Smex
(after "smex-autoloads"
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Projectile
(after "projectile-autoloads"
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Evil
(after 'evil
  ;; Emulate Vim Ctrl-C
  (evil-global-set-key 'insert (kbd "C-c") 'evil-normal-state))
(after [evil projectile]
  ;; Emulate Vim Ctrl-P
  (evil-global-set-key 'normal (kbd "C-p") 'projectile-find-file))

(provide 'config-bindings)
