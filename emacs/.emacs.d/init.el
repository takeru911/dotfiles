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
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(helm-ff-auto-update-initial-value nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (magit yasnippet web-mode wanderlust volatile-highlights undo-tree typescript twittering-mode twilight-theme twig-mode tss tide tern-auto-complete swoop swap-buffers smooth-scrolling smooth-scroll smartrep smartparens session rainbow-delimiters rainbow-blocks quickrun popwin php-mode php-completion paredit org-gcal multiple-cursors multi-term minibuf-isearch markdown-mode js2-mode jedi-direx init-loader indent-guide imenus imenu-anywhere hlinum helm-projectile helm-migemo helm-flymake google-translate foreign-regexp flymake-coffee flycheck-pos-tip farmhouse-theme expand-region eproject dirtree company color-theme coffee-mode calfw auto-highlight-symbol anzu ace-isearch)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
(put 'upcase-region 'disabled nil)
