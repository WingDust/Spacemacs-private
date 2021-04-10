
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


(setq inhibit-compacting-font-caches t)

;;(custom-theme-set-faces 'doom-nord
;;                        `(markdown-code-face :background,(doom-color 'base2))
;;                        )






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



;; 打开 buffer 下的资源管理器 无视操作系统
(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))




(define-key global-map (kbd "M-'") 'my-toggle-selective-display)

(defun my-toggle-selective-display()
  "set-selective-display to current column or toggle
selective-display --lgfang"
  (interactive)
  (let ((arg (progn (back-to-indentation) (current-column))))
    (set-selective-display (if (eq arg selective-display) nil arg))))




;; (setq package-check-signature nil)

;; LaTex config
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq lsp-latex-build-args '("-xelatex" "-outdir=lsp" "-interaction=nonstopmode" "-synctex=1" "%f"))
            ;; SPC m c default use Tex, so we config tex engine to support Chinese
            (setq TeX-engine 'xetex)
            ))

;; (setq TeX-source-correlate-mode t)
(setq TeX-tree-roots "c:/Users/Administrator/scoop/apps/tinytex/current/texmf-dist")
(setq Tex-view-program-list
      '(("Sumatra PDF" ("c:/Users/Administrator/scoop/shims/sumatrapdf.exe -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))
      )
(setq TeX-view-program-selection
      '(((output-dvi style-pstricks)
         "dvips and start"
         )
        (output-dvi "Yap")
        (output-pdf "Sumatra PDF")
        (output-html "start")
        )
      )

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (assq-delete-all 'output-pdf TeX-view-program-selection)
            (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))
            )
          )






















;; ==================== out of Mepla

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\org-bullets")
;;(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\snails")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\vimish-fold")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\gnugo")

;;(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\el-go")
;;(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\ag.el")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\yafolding")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\kana")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\nox")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\LilyPond")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\lyqi")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\awesome-tray")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\WingDust\\init-lisp\\")

(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\s")
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\ts") ;; 它依赖s.el
(add-to-list 'load-path "e:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\elispfl") ;; 它依赖s.el

;; [[https://zhangda.wordpress.com/2016/02/15/configurations-for-beautifying-emacs-org-mode/][Da's recipes on Emacs, IT, and more]]
(require 'org-bullets)
;;“☰” “☱” “☲” “☳” “☴” “☵” “☶” “☷”
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☷"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))



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


(require 'yafolding)
;;(require 'vimish-fold)

(require 'init-org)

(require 'folding)

(require 's)
(require 'ts)

(require 'gnugo)
(require 'gnugo-xpms)
(autoload 'gnugo "gnugo" "Play Go" t)
(autoload 'gnugo-xpms "gnugo-xpms" "GNU Go" t)
(defadvice gnugo-insertion-filter (before gnugo-coding-system-fix activate)
  (setq string (replace-regexp-in-string "\r" "" string)))

(add-to-list 'auto-mode-alist '("\\.tex$" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.dot$" . company-mode))


(require 'elispfl)
(with-eval-after-load 'elisp-mode
  (require 'elispfl)
  (elispfl-mode))

;;(require 'rsz-mini)
