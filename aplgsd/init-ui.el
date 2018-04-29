;; turn off tool-bar
(tool-bar-mode -1)

;; turn off scroll-bar
(scroll-bar-mode -1)

;; turn off menu-bar
(menu-bar-mode -1)

;; 光标的样式
(setq-default cursor-type 'bar)

;; 启动时全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

; show linum-mode
(global-linum-mode t)

;; 显示当前行
(global-hl-line-mode t)

;; 關閉歡迎頁面
(setq inhibit-splash-screen t)

;; window resize
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; line wrap
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; ======================== 日本語入力 =========================
;; ;; 日本語入力
;; (setq default-input-method "japanese-mozc")
;; ;; 日本語をデフォルトにする。
;; (set-language-environment "Japanese")
;; ;; mozcをロードできるようにする（必要に応じて）。
;; (push "/usr/share/emacs/site-lisp/emacs-mozc/" load-path)
;; ;; anthy.elをロードする
;; (load-library "mozc")
;; (load-file "/usr/share/emacs/site-lisp/emacs-mozc/mozc.el")
;; ;; japanese-anthyをディフォルトのinput-methodにする。
;; (global-set-key (kbd "C-o") 'toggle-input-method)
;; (prefer-coding-system 'utf-8)

;; =================================================
(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(use-package pyim
  :ensure nil
  :demand t
  :config
  ;; 激活 basedict 拼音词库
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))
    ;; 我使用全拼
  (setq pyim-default-scheme 'quanpin)
  ;; 开启拼音搜索功能
  (pyim-isearch-mode 1)

  ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
  ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; 手动安装 posframe 包。
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  ;; 让 Emacs 启动时自动加载 pyim 词库
  (add-hook 'emacs-startup-hook
            #'(lambda () (pyim-restart-1 t))))

;; 日本語入力
;;(setq default-input-method "japanese-anthy")
;; 日本語をデフォルトにする。
;;(set-language-environment "Japanese")
;; mozcをロードできるようにする（必要に応じて）。
;;(push "/usr/share/emacs/site-lisp/anthy/" load-path)
;; anthy.elをロードする
;;(load-library "anthy")
;;(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")
;; japanese-anthyをディフォルトのinput-methodにする。
(global-set-key (kbd "C-o") 'toggle-input-method)
(prefer-coding-system 'utf-8)
(global-set-key (kbd "C-c i c") 'set-input-method)



(provide 'init-ui)
