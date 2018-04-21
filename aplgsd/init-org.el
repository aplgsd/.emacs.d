
;; 文档org注释里面语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; org模式的设置
(setq org-agenda-files '("/org_folder/day_task"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/org_folder/day_task/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("c" "Chrome" entry (file+headline "/org_folder/org-notes/notes.org" "Quick notes")
	 "* TODO [#C] %?\n  %(tangguangyue/retrieve-chrome-current-tab-url)\n %i\n %U"
	 :empty-lines 1)
	))

(provide 'init-org)
