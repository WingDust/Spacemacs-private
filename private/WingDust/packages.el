;;; packages.el --- WingDust layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <Administrator@DESKTOP-VMCES9U>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `WingDust-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `WingDust/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `WingDust/pre-init-PACKAGE' and/or
;;   `WingDust/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst WingDust-packages
  '(company
    ;; === auto-save ===
    ;;super-save

    ;;highlight-indent-guides
    youdao-dictionary
    org-latex-impatient
    origami
    cdlatex
    valign
    )

  "The list of Lisp packages required by the WingDust layer.
Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format"
  )
;; Notes：init 的安装会检索 init-「」后面的单词，它要与包名的对应相等，才会安装对的包

(defun WingDust/post-init-company()
  (setq company-minimum-prefix-length 1)
  )

;;(defun WingDust/init-super-save()
;;  (super-save-mode +1)
;;  (setq super-save-auto-save-when-idle t)
;;  )

(defun WingDust/post-init-origami()
    (add-hook 'markdown-mode-hook 'origami-mode)
  )

(defun WingDust/init-org-latex-impatient()
  (use-package org-latex-impatient
    :commands org-latex-impatient-mode
    :init
    (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "To" 'org-latex-impatient-mode)
    (setq org-latex-impatient-tex2svg-bin
          "e:/nodist/v-x64/12.13.1/tex2svg.cmd")
    (setq org-latex-impatient-posframe-position-handler
          'posframe-poshandler-point-bottom-left-corner)
    (setq org-latex-impatient-scale 2.5)
    ))

(defun WingDust/init-cdlatex()
  (use-package cdlatex
    					 :defer t
               :hook ((LaTeX-mode latex-mode) . turn-on-cdlatex)
               ;;[[https://github.com/tshu-w/spacemacs-configuration/blob/6811f2cc227f2659c6a61f9ecb828f82f9d57160/layers/lang/packages.el][spacemacs-configuration]]
               ;; :commands turn-on-cdlatex
               :init
               (add-hook 'latex-mode-hook (global-unset-key (kbd "<tab>")))
               ;;(add-hook 'laTeX-mode-hook 'cdlatex-mode)
;;               (mapc (lambda (mode)
;;                      (add-hook 'laTeX-mode-hook))
;;                    (list ;;'cdlatex-mode
;;               (list 'turn-on-cdlatex
;;               'outline-minor-mode
;;               'flyspell-mode
;;               'hide-body t
;;               )
;;               )
;;
               )

  )

(defun WingDust/init-valign()
  (use-package valign
    :init
    (add-hook 'org-mode-hook #'valign-mode)
    )
  )
;; 吃cpu
;;(defun WingDust/init-highlight-indent-guides()
;;  ;; highlight-indent
;;  (setq highlight-indent-guides-method 'character)
;;  (add-hook 'org-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'markdown-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'js2-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'js-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'vue-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'go-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'rust-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'emacs-lisp-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'lisp-mode-hook 'highlight-indent-guides-mode)
;;  (add-hook 'lisp-interaction-mode-hook 'highlight-indent-guides-mode)
;;  )

(defun WingDust/post-init-youdao-dictionary()
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
  )

;;; packages.el ends here
