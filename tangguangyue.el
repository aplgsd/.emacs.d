
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;; 加载路径
(add-to-list 'load-path "~/.emacs.d/aplgsd/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add more personal funcall
;; new init-func.el

;; 加载包
;; (require 'init-func.el)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-program)
(require 'init-keybindings)

;; load-file and load
(setq custom-file (expand-file-name "aplgsd/custom.el" user-emacs-directory))

(load-file custom-file)

(delete-selection-mode t)
