;;php-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 2)
             ))
;;php-complete
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))