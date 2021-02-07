;; rhythmbox skip song
(defun rhythm-next()  (interactive)
  (start-process "Messages" "rhythm" "rhythmbox-client" "--next")
)

(require 'f)

(setq mv/cmake-path "~/source/repos/vcpkg/downloads/tools/cmake-3.19.2-linux/cmake-3.19.2-Linux-x86_64/bin/cmake")

(if (f-exists? mv/cmake-path)
    (setq cmake-ide-cmake-command mv/cmake-path))

(provide 'miheer94f58f020-environ-config)
