(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 0.5)

;;(require 'rainbow-blocks)
;;(global-rainbow-blocks-mode t)
(menu-bar-mode 1)
(tool-bar-mode 0)

;;(require 'color-theme)
;;(color-theme-initialize)
;;(load-theme 'farmhouse-dark t)

(require 'whitespace)
(setq whitespace-style '(face           ; face�ŉ���
                         tabs           ; �^�u
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;;indent-guide
(setq indent-guide-delay 0.1)
(setq indent-guide-recursive t)
(add-hook 'prog-mode-hook 'indent-guide-mode)

;;linum
(global-linum-mode t)
(hlinum-activate)
(require 'hlinum)
(set-face-attribute 'linum nil
                    :foreground "#bf616a"
                    :height 0.9)
;; �s�ԍ��t�H�[�}�b�g
(setq linum-format "%4d")
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; �J�[�\���s�̃n�C���C�g
(global-hl-line-mode t)

(setq scroll-conservatively 1)
