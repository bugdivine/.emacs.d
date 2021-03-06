(require 'init-elpa)
(require 'saveplace)
(require-package 'rainbow-delimiters)
(require-package 'flycheck)
(require-package 'yaml-mode)
(require-package 'yaml-tomato)
(require-package 'auto-complete)

;; Highlights matching parentheses
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; When you visit a file, point goes to the place where it
;; was when you proviously visited the same file.
;; https://www.emacswiki.org/emacs/SavePlace

(setq-default save-place t)
;; Keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; https://www.gnu.org/software/emacs/manual/html_mode/elisp/Backup-Files.html
;; (setq backup-directory-alist '(("." . ,(concat user-emacs-directory
;;					       "backups"))))

(setq auto-save-default nil)

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interative)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Enable auto complete in prog mode and yaml mode
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'yaml-mode-hook 'auto-complete-mode)
(add-hook 'org-mode-hook 'auto-complete-mode)

;; Automatically indent on new lines
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Sync emacs clipboard with OS clipboard
(setq x-select-enable-clipboard t)

;; Auto refresh buffer
(global-auto-revert-mode t)

;; Auto indent in org-mode
(setq org-startup-indented t)

(provide 'init-editing)
