(add-to-list 'load-path "/home/miheer/.emacs.d/plugins/org-mode-crate/")
(setq org-directory "/home/miheer/org/")
(require 'org-mode-crate-init)
(require 'org-install)

; Some initial langauges we want org-babel to support
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   ))

(provide 'miheer94f58f020-org-config)
