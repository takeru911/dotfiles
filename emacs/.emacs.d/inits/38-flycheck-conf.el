;;flycheck
(setq flycheck-display-errors-delay 0.3)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(global-set-key (kbd "\C-x C-n")  'flycheck-next-error)
(global-set-key (kbd "\C-x C-p") 'flycheck-previous-error)
