;; Auto complete conf
;; This may not be appeared if you have already added.
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/el-get/auto-complete/ac-dict")

;; auto save minibuffer history
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(ido-mode t)
(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))
(setq ido-enable-flex-matching t)

;; https://www.masteringemacs.org/article/re-builder-interactive-regexp-builder
(setq reb-re-syntax 'string)

(defun mv/youtube-open (url &rest args)
  (interactive)
  (when (string-prefix-p "https://youtu.be/"  url)
    (async-shell-command
     (mapconcat 'identity
		(list "/mnt/c/Program\\ Files/VideoLAN/VLC/vlc.exe" url) " ") nil nil)
    t)
  nil)

(setq browse-url-browser-function
      '(("^https://youtu.be/.*" . mv/youtube-open)
	("." . browse-url-default-browser)))
(require 'server)
(if (not (server-running-p))
    (server-start))
(provide 'miheer94f58f020-common-config)
