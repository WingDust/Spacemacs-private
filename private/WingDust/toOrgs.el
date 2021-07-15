;;;'org-babel-execute:python
(setq python-shell-interpreter "e:\\python\\python3.8.1\\python.exe"
      org-babel-python-command "e:\\python\\python3.8.1\\python.exe"
      )

(require 'ob-js)

(with-eval-after-load 'org
  (org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (js . t)
    ))
  )

(setq org-superstar-leading-bullet "  ")

(add-hook (quote org-mode-hook)
          (lambda ()
            (org-shifttab 2)))

(setq org-cycle-separator-lines -1)

;; (use-package org
      ;; :config
        (setq org-ellipsis " ▾")
      ;; )

(setq org-src-fontify-natively t)

(setq org-log-done 'time)
