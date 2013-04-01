;; rhythmbox skip song
(defun rhythm-next()  (interactive)
  (start-process "Messages" "rhythm" "rhythmbox-client" "--next")
)

(provide 'miheer94f58f020-environ-config)
