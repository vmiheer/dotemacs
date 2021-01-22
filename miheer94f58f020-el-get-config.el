;; El get for jedi emacs and others
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

(setq mv/my-packages
      '(alert auto-complete ccls cl-lib color-theme color-theme-tomorrow dash el-get f fuzzy ht hydra lsp-mode magit markdown-mode org-mime org-mode org-pomodoro package popup s spinner transient virtualenvwrapper with-editor writegood))

(el-get 'sync mv/my-packages)

(require 'f)
;; if it's been more than week since updating melpa databse,
;; update the database and update the recipies
(when
    (or
     (not (f-exists? (f-join user-emacs-directory "elpa/archives/melpa/archive-contents")))
     (<
	   (* 60 60 24 7)
	   (-
	    (float-time)
	    (float-time
	     (file-attribute-modification-time
	      (file-attributes
	       (f-join user-emacs-directory "elpa/archives/melpa/archive-contents")))))))
  (package-refresh-contents)
  (el-get-elpa-build-local-recipes))

(provide 'miheer94f58f020-el-get-config)

