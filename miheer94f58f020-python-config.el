;; Jedi emacs conf
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)
(provide 'miheer94f58f020-python-config)
