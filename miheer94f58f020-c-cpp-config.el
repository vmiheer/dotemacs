;; https://github.com/Golevka/emacs-clang-complete-async
(add-to-list 'load-path "~/.emacs.d/emacs-clang-complete-async")
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/emacs-clang-complete-async/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  ;; (add-to-list 'ac-sources ac-source-words-in-buffer)
  (ac-clang-launch-completion-process))
(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)

(c-add-style "llvm.org"
             '("gnu"
	       (fill-column . 80)
	       (c++-indent-level . 2)
	       (c-basic-offset . 2)
	       (indent-tabs-mode . nil)
	       (c-offsets-alist . ((arglist-intro . ++)
				   (innamespace . 0)
				   (member-init-intro . ++)))))

;; Files with "llvm" in their names will automatically be set to the
;; llvm.org coding style.
(add-hook 'c-mode-common-hook
	  (function
	   (lambda nil 
	     (if (string-match "llvm" buffer-file-name)
		 (progn
		   (c-set-style "llvm.org"))))))

(setq clang-format-executable "~/llvm-6.0/build/bin/clang-format")
;; (setenv "LD_LIBRARY_PATH"
;; 	(concat "~/llvm-6.0/build/lib/:" (getenv "LD_LIBRARY_PATH")))

(provide 'miheer94f58f020-c-cpp-config)
