;;flycheck
(setq flycheck-display-errors-delay 0.3)
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(global-set-key (kbd "\C-x C-n")  'flycheck-next-error)
(global-set-key (kbd "\C-x C-p") 'flycheck-previous-error)
