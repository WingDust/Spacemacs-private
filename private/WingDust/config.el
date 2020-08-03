
;;打开行号
;;(global-linum-mode t)
;;(add-hook 'org-mode-hook #'linum-mode)

;;


;; 默认不显示高亮空格
(setq-default spacemacs-show-trailing-whitespace nil)

;; 在保存时自动删除行尾空格  fs 保存时对Cpu有要求，容易造成卡
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;(evilified-state-evilify-map occur-mode-map
;;  :mode occur-mode
;; )

;;; Markdown-fold
(add-hook 'markdown-mode-hook
          (lambda ()
            (goto-line 1)
            (while (re-search-forward "##+" nil t)

              (outline-hide-entry)
              (forward-line 1)
              )
            )
          )

;; 设置单行高亮
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3B4252")

;;(set-background-color "#E5E9F0")

;; [emacs设置平滑滚动(滚动行数)](http://www.fidding.me/article/74)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)


;; 设置文本颜色识别
;;(add-hook 'js-mode-hook 'color-identifiers-mode)


;;
(defun setup-tide-mode()
    "Setup funciton fot tide"
  	(interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (tide-hl-identifier-mode +1)
    (company-mode +1)
    )

(add-hook 'js-mode-hook #'setup-tide-mode)
(add-hook 'before-save-hook 'tide-format-before-save)
;;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)


(setq inhibit-compacting-font-caches t)

;;(custom-theme-set-faces 'doom-nord
;;                        `(markdown-code-face :background,(doom-color 'base2))
;;                        )



;;(add-hook 'racer-mode-hook #'company-mode)
;;(require 'rust-mode)
;;(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;(setq company-tooltip-align-annotations t)



;;(dolist (hook (list
;;               'js-mode-hook
;;               'rust-mode-hook
;;               'python-mode-hook
;;               'ruby-mode-hook
;;               'java-mode-hook
;;               'sh-mode-hook
;;               'php-mode-hook
;;               'c-mode-common-hook
;;               'c-mode-hook
;;               'csharp-mode-hook
;;               'c++-mode-hook
;;               'haskell-mode-hook
;;               ))
;;  (add-hook hook '(lambda () (company-lsp))))

;;(add-hook 'rust-mode-hook 'commpany-lsp)
;;(add-hook 'js-mode-hook 'commpany-lsp)






;; ==================== out of Mepla

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\js-doc")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\org-bullets")
;;(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\snails")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\kana")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\nox")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\LilyPond")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\lyqi")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\awesome-tray")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\WingDust\\init-lisp\\")


;; [[https://zhangda.wordpress.com/2016/02/15/configurations-for-beautifying-emacs-org-mode/][Da's recipes on Emacs, IT, and more]]
(require 'org-bullets)
;;“☰” “☱” “☲” “☳” “☴” “☵” “☶” “☷”
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☷"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; js-doc
(require 'js-doc)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)
              )
          )

(require 'init-keybinding)

;;(require 'snails)

;;
(require 'awesome-tray)
(awesome-tray-mode 1)

;;(require 'nox)
;;(dolist (hook (list
;;               'js-mode-hook
;;               'rust-mode-hook
;;               'python-mode-hook
;;               'ruby-mode-hook
;;               'java-mode-hook
;;               'sh-mode-hook
;;               'php-mode-hook
;;               'c-mode-common-hook
;;               'c-mode-hook
;;               'csharp-mode-hook
;;               'c++-mode-hook
;;               'haskell-mode-hook
;;               ))
;;  (add-hook hook '(lambda () (nox-ensure))))

(if (display-graphic-p)
    (setq-default mode-line-format '(" "))
  (setq-default mode-line-format nil))


(require 'lilypond-mode)
(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
			(cons '("\\.ly$" . LilyPond-mode) auto-mode-alist)
      )
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
(eval-after-load "LilyPond-mode" (load-library "ac-lilypond"))

;; ./emacs 不需要 require
(require 'lyqi)
(add-to-list 'auto-mode-alist '("\\.ly$" . lyqi-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . lyqi-mode))

(require 'auto-save)
(auto-save-enable)
;;(setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我


(require 'kana)

(require 'w32-browser)

(require 'init-org)
