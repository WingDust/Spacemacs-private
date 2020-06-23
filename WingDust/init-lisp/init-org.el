;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Org-mode


;; set status  for TODO
(setq org-todo-keywords
      '((sequence "TODO" "IDEA" "Destory" "INBOX" "NEXT" "LATER" "WAIT/FORWARD" "MAYBE/FUTURE" "|" "CANCEL" "DONE")))

;; set color for keywords
(setq org-todo-keyword-faces
      '(
        ("IDEA" . (:foreground "azure" :weight bold))
        ("Destory" . (:foreground "LightPink"))
        ("INBOX" . (:foreground "blue" :weight bold))
        ("NEXT"  .  org-warning)
        ("LATER" . "yellow")
        ("WAIT/FORWARD" . "blue")
        ("MAYBE/FUTURE" . "purple")
        ("DONE" . "green")
        ("CANCEL" ."grey")
        )
      )

;; 配置状态快捷键
;;(setq org-todo-keywords ((sequence
;;                          "INBOX"
;;                          "NEXT(n)"
;;                          "LATER(l)"
;;                          "WAIT/FORWARD(w)"
;;                          "MAYBE/FUTURE(m)"
;;                          "|" "CANCEL(c)" "DONE(d)"
;;                          )
;;                         ))



;; 当转成 Done 时添加时间戳 转变为非 Done 移除
(setq org-log-done 'time)

;;在Org-mode 下中的代码块能有语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;
(setq org-agenda-files '("g:\\工作\\framework"))
(global-set-key (kbd "C-c a") 'org-agenda)





(setq python-shell-interpreter "e:\\python\\python3.8.1\\python.exe"
      org-babel-python-command "e:\\python\\python3.8.1\\python.exe"
      )

;; 'org-babel-execute:python
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     ;;(sh . t)
     ))
  )


;;    -----------------------org collapse

(add-hook 'org-mode-hook 'org-hide-block-all)

(defvar org-blocks-hidden nil)

(defun org-toggle-blocks ()
  (interactive)
  (if org-blocks-hidden
      (org-show-block-all)
    (org-hide-block-all))
  (setq-local org-blocks-hidden (not org-blocks-hidden)))

(add-hook 'org-mode-hook 'org-toggle-blocks)

(define-key org-mode-map (kbd "C-c t") 'org-toggle-blocks)


;; --------------------------------smartparent-mode
(add-hook 'org-mode-hook 'smartparens-global-mode)

;;-----------------------------------org code-line number
;; http://kitchingroup.cheme.cmu.edu/blog/2015/10/13/Line-numbers-in-org-mode-code-blocks/
;; (defvar number-line-overlays '()
;;   "List of overlays for line numbers.")
;; 
;; (make-variable-buffer-local 'number-line-overlays)
;; 
;; (defun number-line-src-block ()
;;   (interactive)
;;   (save-excursion
;;     (let* ((src-block (org-element-context))
;;            (nlines (- (length
;;                        (s-split
;;                         "\n"
;;                         (org-element-property :value src-block)))
;;                       1)))
;;       (goto-char (org-element-property :begin src-block))
;;       (re-search-forward (regexp-quote (org-element-property :value src-block)))
;;       (goto-char (match-beginning 0))
;; 
;;       (loop for i from 1 to nlines
;;             do
;;             (beginning-of-line)
;;             (let (ov)
;;               (setq ov (make-overlay (point) (point)))
;;               (overlay-put ov 'before-string (format "%3s" (number-to-string i)))
;;               (add-to-list 'number-line-overlays ov))
;;             (next-line))))
;; 
;;   ;; now read a char to clear them
;;   (read-key "Press a key to clear numbers.")
;;   (mapc 'delete-overlay number-line-overlays)
;;   (setq number-line-overlays '()))
;; 
;; (number-line-src-block)



(provide 'init-org)
