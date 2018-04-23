;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
 		;; --- Auto-completion ---
 		company
 		;; --- Better Editor ---
 	        hungry-delete
 		swiper
 		counsel
 		smartparens
 		;; --- Major Mode ---
 		js2-mode
 		;; --- Minor Mode ---
 		nodejs-repl
 		exec-path-from-shell
 		popwin
 		;; --- Themes ---
 		monokai-theme
		solarized-theme
 		silkworm-theme
 		;;reveal-in-osx-finder
 		;; --- Web Mode ---
 		web-mode
 		;; --- js2 Mode ---
 		js2-refactor
 		;; --- 语法检查 ---
 		flycheck
 		;; --- expand-region ---
 		expand-region
 		;; --- iedit ---
 		iedit
 		;; --- org pomodoro番茄工作钟 ---
 		org-pomodoro
 		;; --- 全局检索工具 ag ---
 		helm-ag
 		;; Evil
 		evil
 		;; window numbering
 		window-numbering
;; 		;; powerline
;; 		;; powerline
;; 		;; evil surround
 		evil-surround
 		evil-nerd-commenter
 		which-key
 		) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
 	   finally (return t)))

(unless (my/packages-installed-p)
      (message "%s" "Refreshing package database...")
      (package-refresh-contents)
      (dolist (pkg my/packages)
        (when (not (package-installed-p pkg))
 	 (package-install pkg))))

;; 自动加载主题
(load-theme 'monokai t)

;; popwin的设置
(require 'popwin)
(popwin-mode t)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

(which-key-mode 1)
;; 设置提示窗口在右边显示
(setq which-key-side-window-location 'right)

;; python company mode设置
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-anaconda company-dabbrev))))

(provide 'init-packages)

