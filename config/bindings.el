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
  ;; Buffer switch
  (evil-define-key 'normal 'global (kbd "_") 'previous-buffer)
  (evil-define-key 'normal 'global (kbd "+") 'previous-buffer)
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
;; FIXME: set global key when package loaded is not reasonable.
(after [evil hideshow]
  ;; Use space to toggle folding
  (evil-global-set-key 'normal (kbd "TAB") 'hs-toggle-hiding-one-level)
  (evil-global-set-key 'normal (kbd "zA") 'evil-toggle-fold)
  (evil-global-set-key 'normal (kbd "za") 'hs-toggle-hiding-one-level))
  

;; ido key bindings like vim ctrl-p
(after [evil ido]
  (define-key ido-common-completion-map "\C-j" 'ido-next-match)
  (define-key ido-common-completion-map "\C-k" 'ido-prev-match))

;; Org mode
;; Most evil key bindings for org mode is done by evil-org-mode
(after 'evil
  (evil-global-set-key 'normal (kbd "C-SPC") 'org-toggle-checkbox))

;; FIXME: fix the hardcode.
;; Why only Info-mode overwrite my bindings?
(after 'evil
  (add-hook 'Info-mode-hook
            (lambda () (evil-local-set-key 'normal (kbd "h") 'evil-backward-char)
                       (evil-local-set-key 'normal (kbd "l") 'evil-forward-char)
                       (evil-local-set-key 'normal (kbd "SPC") leader-map))))

;; The leader key
(after 'evil
  (defvar leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts.")
  (evil-define-key 'normal 'global (kbd "SPC") leader-map)
  ;; Org mode
  ;; FIXME: Bindings should valid only when in org mode
  (define-key leader-map "oa" 'org-agenda-list)
  (define-key leader-map "ob" 'org-switchb)
  (define-key leader-map "oc" 'org-capture)
  (define-key leader-map "oo"
    (lambda () (interactive) (ido-find-file-in-dir org-directory)))
  (define-key leader-map "oe" 'org-export-dispatch)
  ;; Projectile
  (define-key leader-map "p" 'projectile-command-map)
  ;; VC
  (define-key leader-map "v" 'vc-prefix-map)
  ;; Misc
  (define-key leader-map "ss"
    (lambda () (interactive) (switch-to-buffer "*scratch*")))
  (define-key leader-map "f" 'toggle-frame-fullscreen))

(provide 'config-bindings)
