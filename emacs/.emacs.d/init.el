;;gc
(setq gc-cons-threshold (* 128 1024 1024))
;;helm-agpp
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)


(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq-default c-basic-offset 2)
;;init loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
(setq init-loader-show-log-after-init t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(helm-ff-auto-update-initial-value nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (monokai-theme atom-one-dark-theme esup magit yasnippet web-mode wanderlust volatile-highlights undo-tree typescript twittering-mode twilight-theme twig-mode tss tide tern-auto-complete swoop swap-buffers smooth-scrolling smooth-scroll smartrep smartparens session rainbow-delimiters rainbow-blocks quickrun popwin php-mode php-completion paredit org-gcal multiple-cursors multi-term minibuf-isearch markdown-mode js2-mode jedi-direx init-loader indent-guide imenus imenu-anywhere hlinum helm-projectile helm-migemo helm-flymake google-translate foreign-regexp flymake-coffee flycheck-pos-tip farmhouse-theme expand-region eproject dirtree company color-theme coffee-mode calfw auto-highlight-symbol anzu ace-isearch)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(flymake-error ((((class color)) (:underline "red"))))
 '(flymake-warning ((((class color)) (:underline "yellow")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "win32yank.exe -i")
  (deactivate-mark)
)

(defun copy-wsl()
  (interactive)
  (insert (shell-command-to-string "win32yank.exe -o --lf"))
)

(load-theme 'idea-darkula t)
