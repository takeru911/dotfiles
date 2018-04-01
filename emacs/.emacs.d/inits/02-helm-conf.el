(require 'helm-config)
(require 'quickrun)
(global-set-key (kbd "C-x C-r") 'quickrun)

(helm-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(helm-ff-auto-update-initial-value nil)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-x C-h") 'helm-recentf)
(define-key global-map (kbd "C-x C-m") 'helm-imenu-anywhere)
(define-key global-map(kbd "C-x k") 'helm-show-kill-ring)
(define-key global-map (kbd "M-h") 'helm-complex-command-history)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
