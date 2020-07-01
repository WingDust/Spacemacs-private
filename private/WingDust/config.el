
;;打开行号
(global-linum-mode t)
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
;;(add-hook 'after-init-hook 'global-color-identifiers-mode)


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



;; ====================

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\js-doc")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\WingDust\\init-lisp\\")

;; js-doc
(require 'js-doc)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)
              )
          )

(require 'init-keybinding)

(require 'auto-save)
(auto-save-enable)
;;(setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我

(require 'init-org)
