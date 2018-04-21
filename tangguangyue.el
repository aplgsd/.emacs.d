
(package-initialize)

;; 加载路径
(add-to-list 'load-path "~/.emacs.d/aplgsd/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-keybindings)
