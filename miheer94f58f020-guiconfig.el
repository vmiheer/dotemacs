;; Stop GUI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
;; Pop up required by AC
(add-to-list 'load-path "~/.emacs.d/el-get/popup")
(set-default-font "Monaco 11")
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'column-marker)
(setq-default show-trailing-whitespace t)
(show-paren-mode t)
(desktop-save-mode 1)
(provide 'miheer94f58f020-guiconfig)
