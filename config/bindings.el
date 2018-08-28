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

;; Bind F10 to global search
(after [projectile evil]
  (evil-global-set-key 'normal (kbd "<f10>") 'projectile-grep))

;; Evil
;; Most evil bindings are configured by evil-collection
(after 'evil
  ;; Toggle fullscreen mode
  (evil-global-set-key 'normal (kbd "\\f") 'toggle-frame-fullscreen)
  ;; Do not work here
  ;; (evil-global-set-key 'normal (kbd "\\p")
  ;;                      (lambda ()
  ;;                        (interactive)
  ;;                        (evil-paste-from-register "+")))
  ;; Emulate Vim Ctrl-C
  (evil-global-set-key 'insert (kbd "C-c") 'evil-normal-state))

(after [evil projectile]
  ;; Emulate Vim Ctrl-P
  (evil-global-set-key 'normal (kbd "C-p") 'projectile-find-file))

;; Key bindings for folding
(after [evil hideshow]
  ;; Use space to toggle folding
  (evil-global-set-key 'normal (kbd "SPC") 'hs-toggle-hiding-one-level)
  (evil-global-set-key 'normal (kbd "zA") 'evil-toggle-fold)
  (evil-global-set-key 'normal (kbd "za") 'hs-toggle-hiding-one-level))
  

;; ido key bindings like vim ctrl-p
(after [evil ido]
  (define-key ido-common-completion-map "\C-j" 'ido-next-match)
  (define-key ido-common-completion-map "\C-k" 'ido-prev-match))

;; Org mode
;; Most evil key bindings for org mode is done by evil-org-mode
(after 'evil
  ;; Quick open org file
  (evil-global-set-key 'normal (kbd "\\oo")
                       (lambda ()
                         (interactive)
                         (ido-find-file-in-dir org-directory)))
  (evil-global-set-key 'normal (kbd "\\oa") 'org-agenda-list)
  (evil-global-set-key 'normal (kbd "\\ob") 'org-switchb)
  
  (evil-global-set-key 'normal (kbd "C-SPC") 'org-toggle-checkbox))

;; Quick open *scratch*
(after 'evil
  (evil-global-set-key 'normal (kbd "\\s")
                       (lambda ()
                         (interactive)
                         (switch-to-buffer "*scratch*"))))

(provide 'config-bindings)
