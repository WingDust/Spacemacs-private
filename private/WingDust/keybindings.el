
(evil-define-key 'normal 'global (kbd "<tab>")  'evil-jump-item)
;;(evil-define-key 'normal 'evil-org-mode (kbd "<tab>") )


;; 取消 evil 在 org-mode 中的 normal 使用 tab 会缩进
;; (setq evil-want-C-i-jump nil)

;; Do what i mean
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 有道字典按键绑定
;;(spacemacs/set-leader-keys  "oy" 'youdao-dictionary-search-at-point+)

;; 注释当前行
(global-set-key (kbd "C-;") 'comment-line)
