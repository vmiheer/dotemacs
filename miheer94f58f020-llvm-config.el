;; llvm-stuff
(add-to-list 'load-path "~/llvm/src/llvm/utils/emacs/")
(require 'llvm-mode)
; And tablgen too
(require 'tablegen-mode)
;; Cpp coding style llvm
(c-add-style "llvm.org"
             '((fill-column . 80)
	       (c++-indent-level . 2)
	       (c-basic-offset . 2)
	       (indent-tabs-mode . nil)
               (c-offsets-alist . ((innamespace 0)))))

(add-hook 'c-mode-hook
	  (function
	   (lambda nil 
	     (if (string-match "llvm" buffer-file-name)
		 (progn
		   (c-set-style "llvm.org")
		   )
	       ))))

(add-hook 'c++-mode-hook
	  (function
	   (lambda nil 
	     (if (string-match "llvm" buffer-file-name)
		 (progn
		   (c-set-style "llvm.org")
		   )
	       ))))

(provide 'miheer94f58f020-llvm-config)
