;; switch-to-previous-buffer
;;(global-set-key (kbd "C-c b") 'previous-buffer)
(global-set-key (kbd "C-c b")  'mode-line-other-buffer)

(global-set-key (kbd "C-c w") 'swiper)
(global-set-key (kbd "<f6>") 'ivy-resume)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "<f2>") 'recentf-open-files)

(global-set-key (kbd "<f1>") 'open-my-init-file)
;; Day Manage
(global-set-key (kbd "<f3>") (lambda() (interactive) (find-file "/mnt/e/TRI/DayManage")))

;; 查詢方法
(global-set-key (kbd "C-h C-f") 'find-function)
;; 查詢變量
(global-set-key (kbd "C-h C-v") 'find-variable)
;; 查詢快捷鍵
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 从git buffer中查找文件
(global-set-key (kbd "M-s f") 'counsel-git)

;; org mode keybindings
(global-set-key (kbd "C-c a") 'org-agenda)

;; 代码缩进快捷键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

;; imenu 的快捷键
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region设置
(global-set-key (kbd "C-=") 'er/expand-region)

;; occur mode 的快捷键
(global-set-key (kbd "M-s o") 'occur-dwim)

;; org mode template remember
(global-set-key (kbd "C-c r") 'org-capture)

;; web mode 的快捷键
(global-set-key (kbd "C-c C-w") 'my-toggle-web-indent)

;; js2 mode 的快捷键
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 命令补全时按C-n C-p 来上下移动选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; iedit mode 快捷键设置
(global-set-key (kbd "M-s e") 'iedit-mode)

;; helm ag的快捷键
;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 删除单个词语快捷键
(global-set-key (kbd "C-w") 'backward-kill-word)


(provide 'init-keybindings)
