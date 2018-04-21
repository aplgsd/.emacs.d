;; 关闭emacs的提示声音，移到第一行或者最后一行的时候
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode t)

;;
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;
					    ("8ap" "aplgsd")
					    ))

;; 禁止备份文件
(setq make-backup-files nil)
;; 禁止自動恢復
(setq auto-save-default nil)

;; 默认打开最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 寻找匹配括号
(defadvice show-paren-function (around fix-show-paren-function activate)
   (cond ((looking-at-p "\\s(") ad-do-it)
 	(t (save-excursion
 	     (ignore-errors (backward-up-list))
 	     ad-do-it)))
   )

(add-hook 'emacs-list-mode-hook 'show-paren-mode)

;; 删掉选中的模块
(delete-selection-mode t)

;; hungry-delete-mode 启用
;; (require 'hungry-delete)
;; (global-hungry-delete-mode)

;; swiper 的快捷键设定
;; (setq enable-recursive-minibuffers t)

;; 右括号自动补全
;; (require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;; (smartparens-global-mode t)

;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; 强化补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


;; 设置操作文件是否需要询问
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置删除和拷贝文件夹时是否时递归的
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 设置buffer文件不重复新建
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; occur mode 设置
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


;; dwin = do what i mean

;; imenu 的设置 函数列表
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))

;; 抓去chrome上浏览的网页连接
(defun tangguangyue/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
      (let ((result (do-applescript
		     (concat
		      "set frontmostApplication to path to frontmost application\n"
		      "tell application \"Google Chrome\"\n"
		      " set theUrl to get URL of active tab of first window\n"
		      " set theResult to (get theUrl) \n"
		      "end tell\n"
		      "activate application (frontmostApplication as text)\n"
		      "set links to {}\n"
		      "copy theResult to the end of links\n"
		      "return links as string\n"))))
	(format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

;; 将抓取到的连接插入到当前的文件中
(defun tangguangyue/inert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (tangguangyue/retrieve-chrome-current-tab-url)))

(provide 'init-better-defaults)
