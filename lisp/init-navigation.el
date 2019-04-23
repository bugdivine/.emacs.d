(require 'init-elpa)
(require-package 'neotree)
(require-package 'projectile)
(require-package 'all-the-icons)

;; Enable projectile mode
(projectile-mode +1)

;; Set custom key bindings for projectile
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Enable neotree toggle key
(global-set-key [f8] 'neotree-toggle)

;; Enable custom files and folder icons for neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Enable neotree whenever context switches to a projectile project
(setq projectile-switch-project-action 'neotree-projectile-action)
(defun my/persp-neo ()
       "Make NeoTree follow the perspective"
       (interactive)
       (let ((cw (selected-window))
             (path (buffer-file-name))) ;;save current window/buffer
             (progn
               (when (and (fboundp 'projectile-project-p)
                          (projectile-project-p)
                          (fboundp 'projectile-project-root))
                 (neotree-dir (projectile-project-root)))
               (neotree-find path))
             (select-window cw)))

;; Disable fix size for neotree window
(setq neo-window-fixed-size nil)
(defun neotree-resize-window (&rest _args)
  "Resize neotree window.
https://github.com/jaypei/emacs-neotree/pull/110"
  (interactive)
  (neo-buffer--with-resizable-window
   (let ((fit-window-to-buffer-horizontally t))
     (fit-window-to-buffer))))
;; Set the neo-window-width to the current width of the
;; neotree window, to trick neotree into resetting the
;; width back to the actual window width.
;; Fixes: https://github.com/jaypei/emacs-neotree/issues/262
(eval-after-load "neotree"
  '(add-to-list 'window-size-change-functions
                (lambda (frame)
                  (let ((neo-window (neo-global--get-window)))
                    (unless (null neo-window)
                      (setq neo-window-width (window-width neo-window)))))))

(add-hook 'neo-change-root-hook #'neotree-resize-window)
(add-hook 'neo-enter-hook #'neotree-resize-window)

(provide 'init-navigation)
