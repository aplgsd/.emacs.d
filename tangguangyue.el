
(package-initialize)

;; 加载路径
(add-to-list 'load-path "~/.emacs.d/aplgsd/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-org)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-packages)
(require 'init-program)
(require 'custom)
(require 'init-keybindings)
