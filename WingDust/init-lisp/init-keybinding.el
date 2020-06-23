
;; 设置C-w 删除前一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; 取消 Company 实现补全时也能删除前一个单词
(define-key company-active-map (kbd "\C-w") 'nil)

;; 默认 C-h backspace
;; (global-set-key (kbd "C-h") 'delete-backward-char)
(define-key input-decode-map (kbd "C-h") (kbd "DEL"))



;;(define-key company-active-map (kbd "C-h") 'delete-backward-char)

(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

(global-set-key (kbd "<tab>") '(lambda () (interactive) (insert-char 9 1)))

(global-set-key (kbd "<f9>") 'whitespace-mode)

(provide 'init-keybinding)
