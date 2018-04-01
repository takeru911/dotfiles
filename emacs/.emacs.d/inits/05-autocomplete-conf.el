;;yasnippet
(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)
;;auto-complete
(global-auto-complete-mode t)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))
;; ファイルパスの補完
(global-set-key [(alt tab)] 'ac-complete-filename)
(setq ac-dwim t)  ; 空気読んでほしい
;; 情報源として
;; * ac-source-filename
;; * ac-source-words-in-same-mode-buffers
;; を利用
(setq-default ac-sources '(ac-source-filename
                           ac-source-words-in-same-mode-buffers
                           ac-source-yasnippet))

(setq ac-auto-start 3);; 補完を開始する文字数

;; 色
(set-face-background 'ac-completion-face "#333333")
(set-face-foreground 'ac-candidate-face "black")
(set-face-background 'ac-selection-face "#666666")
(set-face-foreground 'popup-summary-face "black")  ;; 候補のサマリー部分
(set-face-background 'popup-tip-face "#ffffd8")  ;; ドキュメント部分
(set-face-foreground 'popup-tip-face "black")
