(global-set-key (kbd "<f2>") 'recentf-open-files)

(global-set-key (kbd "<f1>") 'open-my-init-file)

(global-set-key (kbd "<f3>") 'find-file)

;; 查詢方法
(global-set-key (kbd "C-h C-f") 'find-function)
;; 查詢變量
(global-set-key (kbd "C-h C-v") 'find-variable)
;; 查詢快捷鍵
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; 命令补全时按C-n C-p 来上下移动选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-keybindings)
