;; markdownmode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)))