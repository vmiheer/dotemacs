(require 'ccls)
(provide 'miheer94f58f020-c-cpp-config)

(require 'use-package)
(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)

(use-package ccls
	     :hook ((c-mode c++-mode objc-mode cuda-mode) .
		             (lambda () (require 'ccls) (lsp))))

