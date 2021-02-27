;; Mode for handling all modes related to serialization/deserialization

(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(dolist (mode '(company-mode highlight-indentation-current-column-mode))
	(add-hook 'yaml-mode-hook mode))

(add-hook 'yaml-mode-hook
	  (lambda ()
	    (outline-minor-mode)
	    (define-key yaml-mode-map (kbd "TAB") 'outline-toggle-children)
	        (setq outline-regexp "^ *\\([A-Za-z0-9_-]*: *[>|]?$\\|-\\b\\)")))
(provide 'miheer94f58f020-serde)
