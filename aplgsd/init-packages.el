  ;; ;; cl - Common Lisp Extension
 ;; (require 'cl)

;; (when (>= emacs-major-version 24)
;;      (require 'package)
;;      (package-initialize)
;;      (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/"))))

;; ;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;;  ;; Add Packages
;;  (defvar my/packages '(
;; 		;; --- Auto-completion ---
;; 		company
;; 		;; --- Better Editor ---
;; 	        hungry-delete
;; 		swiper
;; 		counsel
;; 		smartparens
;; 		;; --- Major Mode ---
;; 		js2-mode
;; 		;; --- Minor Mode ---
;; 		nodejs-repl
;; 		exec-path-from-shell
;; 		popwin
;; 		;; --- Themes ---
;; 		;; monokai-theme
;; 		;; solarized-theme
;; 		silkworm-theme
;; 		reveal-in-osx-finder
;; 		;; --- Web Mode ---
;; 		web-mode
;; 		;; --- js2 Mode ---
;; 		js2-refactor
;; 		;; --- 语法检查 ---
;; 		flycheck
;; 		;; --- expand-region ---
;; 		expand-region
;; 		;; --- iedit ---
;; 		iedit
;; 		;; --- org pomodoro番茄工作钟 ---
;; 		org-pomodoro
;; 		;; --- 全局检索工具 ag ---
;; 		helm-ag
;; 		;; Evil
;; 		evil
;; 		;; window numbering
;; 		window-numbering
;; 		;; powerline
;; 		;; powerline
;; 		;; evil surround
;; 		evil-surround
;; 		evil-nerd-commenter
;; 		which-key
;; 		) "Default packages")

;;  (setq package-selected-packages my/packages)

;;  (defun my/packages-installed-p ()
;;      (loop for pkg in my/packages
;; 	   when (not (package-installed-p pkg)) do (return nil)
;; 	   finally (return t)))

;;  (unless (my/packages-installed-p)
;;      (message "%s" "Refreshing package database...")
;;      (package-refresh-contents)
;;      (dolist (pkg my/packages)
;;        (when (not (package-installed-p pkg))
;; 	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

;; ivy mode的设置
(ivy-mode 1)
(setq ivy-use-virtnvual-buffers t)

;;(global-set-key (kbd "M-x") 'counsel-M-x)

;; Web-mode的配置 javascript的配置
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 )
       auto-mode-alist))

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

(global-company-mode t)

;; js2 mode设置
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; 自动加载主题
(load-theme 'monokai t)

;; popwin的设置
(require 'popwin)
(popwin-mode t)

;; flycheck激活
;;(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook
          (defun my-js2-mode-setup ()
            (flycheck-mode t)
            (when (executable-find "eslint")
              (flycheck-select-checker 'javascript-eslint))))

(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "bs" 'swiper
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows)


;; window numbering
(window-numbering-mode 1)
;; (require 'powerline)
;; (powerline-default-theme)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(evilnc-default-hotkeys)

(which-key-mode 1)
;; 设置提示窗口在右边显示
(setq which-key-side-window-location 'right)

;; python company mode设置
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-anaconda company-dabbrev))))

(provide 'init-packages)
