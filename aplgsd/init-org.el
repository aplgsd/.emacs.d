;; 文档org注释里面语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; org mode keybindings
(global-set-key (kbd "C-c a") 'org-agenda)

;; org mode template remember
(global-set-key (kbd "C-c r") 'org-capture)

;; org模式的设置
(setq org-agenda-files '("/mnt/g/個人情報管理/作業フォルダ/org_folder/day_task"))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline " /mnt/g/個人情報管理/作業フォルダ/org_folder/day_task/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("c" "Chrome" entry (file+headline " /mnt/g/個人情報管理/作業フォルダ/org_folder/notes.org" "Quick notes")
	 "* TODO [#C] %?\n  %(tangguangyue/retrieve-chrome-current-tab-url)\n %i\n %U"
	 :empty-lines 1)
	))

;; ================== keywords faces ======================
(setq org-todo-keywords
  '((type "工作(w!)" "学习(s!)" "休闲(l!)" "|")
    (sequence "PENDING(p!)" "TODO(t!)"  "|" "DONE(d!)" "ABORT(a@/!)")
    ))

;; ================== keywords styles =======================
;; (setq org-todo-keyword-faces
;;   '(("工作" .      (:background "red" :foreground "white" :weight bold))
;;     ("学习" .      (:background "white" :foreground "red" :weight bold))
;;     ("休闲" .      (:foreground "MediumBlue" :weight bold)) 
;;     ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
;;     ("TODO" .      (:background "DarkOrange" :foreground "black" :weight bold))
;;     ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold)) 
;;     ("ABORT" .     (:background "gray" :foreground "black"))
;; ))

;; =================== task priority order ============================
;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?E)
(setq org-default-priority ?E)
;; 优先级醒目外观
(setq org-priority-faces
  '((?A . (:background "red" :foreground "white" :weight bold))
    (?B . (:background "LightOrange" :foreground "white" :weight bold))
    (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
    (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
    (?E . (:background "SkyBlue" :foreground "black" :weight bold))
    ))

;; ================== emacs tag =======================
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

(provide 'init-org)
