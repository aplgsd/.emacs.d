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
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

; show linum-mode
(global-linum-mode t)

;; 显示当前行
(global-hl-line-mode t)

;; 關閉歡迎頁面
(setq inhibit-splash-screen t)

;; show window num
(window-numbering-mode 1)

;; window resize
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; line wrap
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; =================================================
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
;; 日本語入力
(setq default-input-method "japanese-anthy")
;; 日本語をデフォルトにする。
(set-language-environment "Japanese")
;; mozcをロードできるようにする（必要に応じて）。
(push "/usr/share/emacs/site-lisp/anthy/" load-path)
;; anthy.elをロードする
(load-library "anthy")
(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")
;; japanese-anthyをディフォルトのinput-methodにする。
(global-set-key (kbd "C-o") 'toggle-input-method)
(prefer-coding-system 'utf-8)


(provide 'init-ui)


