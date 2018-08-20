;; Setup Frame
(add-to-list 'default-frame-alist '(font . "M+ 1mn-14"))
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(height . 35))

;; Setup theme
(require-package 'zenburn-theme)
(load-theme 'zenburn t)

;; Org mode
(setq org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/Docs/OrgRepo")

;; ELPY
(elpy-enable)
