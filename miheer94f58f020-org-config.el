(add-to-list 'load-path "~/.emacs.d/plugins/org-mode-crate/")
;; (add-to-list 'load-path "~/.emacs.d/plugins/org-mode-crate/lib/org-mode/lisp/")
(add-to-list 'load-path "~/git/org-reveal")
(setq org-directory "~/org/")
(global-set-key (kbd "<f12>") 'org-agenda)
(require 'org-mode-crate)
(require 'org-mime)
;; (require 'ox-reveal)

; Some initial langauges we want org-babel to support
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
;   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   ))
(setq org-src-fontify-natively t)

(setq org-mime-library 'mml)

(add-hook 'org-mode-hook
          (lambda ()
	    (progn
	      (local-set-key "\C-c\M-o" 'org-mime-org-buffer-htmlize)
	      (flyspell-mode t)
	      (writegood-mode t)
	      (set-fill-column 80)
	      (auto-fill-mode t)
	      )))

(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "pre" (format "font-family: 'Consolas'; font-weight: 400; color: %s; background-color: %s; padding: 0.5em;"
                           "#E6E1DC" "#232323"))))

(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "code" (format "font-family: 'Consolas'; font-weight: 400; color: %s; background-color: %s; padding: 0.5em;"
                           "#E6E1DC" "#232323"))))


(provide 'miheer94f58f020-org-config)
