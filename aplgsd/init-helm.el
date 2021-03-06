(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibnuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 40)
(helm-autoresize-mode 1)

;; ------------------- コマンド: helm-M-x ------------------------
;; (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; --------------------- コマンド: helm-show-kill-ring ---------------------------
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; --------------------- コマンド: helm-mini ------------------------------
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

;; --------------------- コマンド: helm-find-files ---------------------
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; --------------------- コマンド: helm-semantic-or-imenu -------------------------------
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; --------------------- コマンド: helm-locate -------------------------------
(setq helm-locate-fuzzy-match t)

;; --------------------- コマンド: helm-occur --------------------------------
(global-set-key (kbd "C-c h o") 'helm-occur)

;; --------------------- コマンド: helm-apropos -----------------------------
(setq helm-apropos-fuzzy-match t)

;; -------------------- コマンド: helm-lisp-completion-at-point ---------------------
(setq helm-lisp-fuzzy-completion t)

;; --------------------- コマンド: helm-ls-gits -----------------------------
(global-set-key (kbd "C-c h g") 'helm-browse-project)
(global-set-key (kbd "C-c h g") 'helm-browse-project)


(helm-mode t)

(provide 'init-helm)
