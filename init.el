(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;;(setenv "PATH" ("/" (getenv "PATH")))+

;; org-mode 的设置
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "tangguangyue.org" user-emacs-directory))

(require 'init-org)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-packages)
(require 'init-program)
(require 'custom)

