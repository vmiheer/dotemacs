;; Stop GUI
(require 'f)
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(global-set-key (kbd "C-<return>") 'cua-rectangle-mark-mode)
(global-set-key (kbd "C-j") 'cua-rectangle-mark-mode)

(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (if (display-graphic-p)
		(progn
		  (color-theme-tomorrow-night-eighties)
		  (set-frame-font "cascadia mono" nil t)))))

(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)
(add-to-list 'load-path "~/.emacs.d/plugins")
; (require 'column-marker)
; (column-marker-1 120)
(setq show-trailing-whitespace t)
(setq desktop-dirname "~/.emacs.d/")
(setq-default show-trailing-whitespace t)
(show-paren-mode t)
(require 'desktop)
;; (setq desktop-restore-forces-onscreen nil)

;; https://emacs.stackexchange.com/a/61705/6702
;; Also look at https://emacs.stackexchange.com/questions/32692/daemon-mode-defer-interactive-prompts-on-startup if X is not running
(if (not (daemonp))
    (desktop-save-mode 1)
  (defun restore-desktop (frame)
    "Restores desktop and cancels hook after first frame opens. 
     So the daemon can run at startup and it'll still work"
    (with-selected-frame frame
      (desktop-save-mode 1)
      (desktop-read)
      (remove-hook 'after-make-frame-functions 'restore-desktop)))
  (add-hook 'after-make-frame-functions 'restore-desktop))

(add-to-list 'load-path (f-join el-get-dir "powerline"))
(require 'powerline)
(setq powerline-arrow-shape 'slant)
(powerline-default-theme)

(windmove-default-keybindings)
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; https://emacs.stackexchange.com/questions/16840/how-to-change-green-background-in-magit-running-in-xterm
(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))

(provide 'miheer94f58f020-guiconfig)
