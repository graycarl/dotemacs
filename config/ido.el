(setq ido-enable-prefix nil)
(setq ido-use-virtual-buffers t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)

(after 'ido
  (require-package 'flx-ido)
  (flx-ido-mode t)

  (require-package 'ido-vertical-mode)
  (ido-vertical-mode))

(provide 'config-ido)
