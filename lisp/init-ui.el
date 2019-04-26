(require 'init-elpa)
(require-package 'atom-one-dark-theme)
(require-package 'golden-ratio)

(require 'golden-ratio)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :family "Monaco" :height 120)
(setq-default line-spacing 0.4)

(setq
  x-select-enable-clipboard t
  x-select-enable-primary t
  save-interprogram-paste-before-kill t
  apropos-do-all t
  mouse-yank-at-point t)

(load-theme 'atom-one-dark t)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

(golden-ratio-mode 1)

;; Display clock
(display-time)
(defface egoge-display-time
  '((((type x w32 mac))
     ;; #060525 is the background colour of my default face.
     (:foreground "#060525" :inherit bold))
    (((type tty))
     (:foreground "blue")))
  "Face used to display the time in the mode line.")
(setq display-time-format "%I:%M %p")

;; Display battery
(display-battery-mode 1)

;; Align these to right
(setq global-mode-string (remove 'display-time-string global-mode-string))
(setq global-mode-string (remove 'battery-mode-line-string global-mode-string))
(setq mode-line-end-spaces
      (list (propertize " " 'display '(space :align-to (- right 20)))
	    'battery-mode-line-string
	    " "
	    'display-time-string))

(provide 'init-ui)
