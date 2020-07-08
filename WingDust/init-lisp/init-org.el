;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Org-mode


;; set status  for TODO
(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "IDEA"
         "Destory"
         "INBOX(i)"
         "NEXT(n)"
         "LATER(l)"
         "WAIT/FORWARD(w)"
         "MAYBE/FUTURE(m)"
         "|"
         "CANCEL(c)"
         "DONE(d)" )))

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
;;(setq org-agenda-files '("g:\\工作\\framework"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 打开 org-indent mode
;;(setq org-startup-indented t)

;; 设置 bullet list [[https://www.lijigang.com/blog/2018/08/08/%E7%A5%9E%E5%99%A8-org-mode/][美化: Headline]]
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

;; 快速选择TODO状态
(setq org-use-fast-todo-selection t)


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



;; 为 org 设置全局 id link
(require 'org-id)
(setq org-id-link-to-org-use-id t)
(global-set-key "\C-c l" 'org-store-link)


(setq org-highest-priority ?A)
(setq org-lowest-priority ?D)
(setq org-default-priority ?A)
(setq org-priority-faces
      '(
        (?A . org-warning)
        (?B . (:background "DodgerBlue" :foreground "black"))
        (?C . (:foreground "SkyBlue" :weight bold))
        (?D . (:foreground "DodgerBlue" :weight bold))
        )
      )


;; =================== Setting for gtd Captures

;; Directory for capture files
(setq org-directory "h:/工作/framework/GTD/")

;; Default capture files
(setq org-default-notes-file (concat org-directory "GTD/inbox.org"))

;; capture template
(setq org-capture-templates
			'(
        ("t" "Task" entry (file+headline "GTD/inbox.org" "Tasks") "* INBOX %?\nTime:%T\nFrom:%F\n")
        ("p" "Projects" entry (file+headline "GTD/inbox.org" "Projects") "* %?\nTime:%U\nFrom:%F\n")
        ("i" "Item notes" item (file+headline "GTD/inbox.org" "Items" "+ %?\n  Time:%U\n  From:%F\n"))
        ("m" "Misc notes" plain (file+headline "misc.org" "Notes") "-----------------------------------------------------\nTime:%U\n %?")
        )
      )

;; set tags
;; where 		? (h/o/w)
;; what 		? (c/l/s)
;; when 		? (gtd | immeiately wait action )
;; who 			? (my gtd others)
;; why/how 	? (delete/archive/schedule)
(setq org-tag-alist '(
                      (:startup . nil)
                      ("home" . ?r) ("office" . ?o) ("way" . ?w)
                      (:endgroup . nil)
                      ("职业" . ?c)
                      ("生活" . ?l)
                      ("学习" . ?s)
                      ))


(setq org-archive-location "h:/工作/framework/GTD/_archive/Things.org::")









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
