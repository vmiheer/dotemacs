;; Auto complete conf
;; This may not be appeared if you have already added.
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/el-get/auto-complete/ac-dict")
(ido-mode)
(server-start)
(provide 'miheer94f58f020-common-config)
