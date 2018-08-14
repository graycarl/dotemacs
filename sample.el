(load-theme 'zenburn t)

;; Helm setup
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Setup Frame
(add-to-list 'default-frame-alist '(font . "M+ 1mn-14"))
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(height . 35))

;; Projectile
(setq projectile-project-search-path '("~/Sources", "~/LibSources"))

;; ELPY
(elpy-enable)
