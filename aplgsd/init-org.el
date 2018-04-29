; 文档org注释里面语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;; org mode keybindings
(global-set-key (kbd "C-c a") 'org-agenda)
;; org mode template remember
(global-set-key (kbd "C-c r") 'org-capture)

;; org模式的设置
(setq org-agenda-files '("/mnt/e/TRI/DayManage/day_task"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/mnt/e/TRI/DayManage/day_task/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("c" "Chrome" entry (file+headline "/mnt/e/TRI/DayManage/org-notes/notes.org" "Quick notes")
	 "* TODO [#C] %?\n  %(tangguangyue/retrieve-chrome-current-tab-url)\n %i\n %U"
	 :empty-lines 1)
	))


;; ================== keywords faces ======================
(setq org-todo-keywords
  '((type "工作(w)" "学习(s)" "生活(l)" "|")
    (sequence "PENDING(p)" "TODO(t)"  "|" "DONE(d!)" "ABORT(a@/!)")
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

;; ================== 简单任务关系 =======================
(setq org-enforce-todo-dependencies t)

;; ================== 複雑任务关系 =======================
(require 'org-depend)
;; (defun mm/org-insert-trigger ()
;;   "Automatically insert chain-find-next trigger when entry becomes NEXT"
;;   (cond ((equal org-state "NEXT")
;;          (unless org-depend-doing-chain-find-next
;;            (org-set-property "TRIGGER" "chain-find-next(NEXT,from-current,priority-up,effort-down)")))
;;         ((not (member org-state org-done-keywords))
;;          (org-delete-property "TRIGGER"))))

;; (add-hook 'org-after-todo-state-change-hook 'mm/org-insert-trigger)


(provide 'init-org)
