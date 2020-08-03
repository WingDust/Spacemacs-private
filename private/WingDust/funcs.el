
;; dwin = do what i mean.
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))



;; 设置在Markdown 文件中打开光标下的 Url
(defun open-url-on-point()
  "open url on point use default browser"
  (interactive)
  ;;(message "a:%s" (browse-url-url-at-point))
  (let ((url (browse-url-url-at-point)))
    (if url
        (browse-url url)
      (error "No URL found")))
  )

;;(add-hook 'markdown-mode-hook
;;          (lambda ()
;;            (orgtbl-mode nil)
;;            (define-key markdown-mode-map (kbd "RET") 'open-url-on-point)
;;            )
;;          )

;;(with-eval-after-load 'markdown-mode
;;  (define-key markdown-mode-map (kbd "RET") 'open-url-on-point)
;;  )

;;

;;(defun WingDust/open-file-with-projectile-or-counsel-git()
;;	(interactive)
;;  (if (WingDust/vs))

;;  )
