(require 'init-elpa)
(require-package 'magit)
(require-package 'diff-hl)

(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'yaml-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)
(add-hook 'yaml-mode-hook 'diff-hl-flydiff-mode)
(add-hook 'vc-dir-mode-hook 'diff-hl-flydiff-mode)

(provide 'init-vc)
