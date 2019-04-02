(require-package 'projectile)
(setq projectile-indexing-method 'native)
(setq projectile-use-git-grep t)
(projectile-mode +1)
(provide 'config-projectile)

;; https://github.com/bbatsov/projectile/issues/1382
(require 'subr-x)
