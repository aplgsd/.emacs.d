(package-initialize)
;; org-mode 的设置
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "tangguangyue.org" user-emacs-directory))
