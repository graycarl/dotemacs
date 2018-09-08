(eval-when-compile (require 'cl))
;; Package Archive Setup
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Package archives in China
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; Load time
(lexical-let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

;; Load core library and config module
(load (concat user-emacs-directory "lib"))
(cl-loop for file in (reverse
                      (directory-files-recursively
                       (concat user-emacs-directory "config/") "\\.el$"))
       do (condition-case ex
	      (load (file-name-sans-extension file))
	    ('error (with-current-buffer "*scratch*"
		      (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex))))))

;; Local config file
(setq custom-file (concat user-emacs-directory "local.el"))
(when (file-exists-p custom-file) (load custom-file))
