(global-company-mode t)
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; 
(require 'tss)
 ;; �L�[�o�C���h
(setq tss-popup-help-key "C-q")
(setq tss-jump-to-definition-key "C-.")
(setq tss-implement-definition-key "C-x i")
 
(tss-config-default)

;;(require 'tide)
;;(add-hook 'typescript-mode-hook
;;            (lambda ()
;;            (tide-setup)
;;            (flycheck-mode t)
;;            (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;            (eldoc-mode t)
;;            (company-mode-on)))

;;(require 'company)
;;;;; C-n, C-p�ŕ⊮����I�ׂ�悤��
;;(define-key company-active-map (kbd "M-n") nil)
;;(define-key company-active-map (kbd "M-p") nil)
;;(define-key company-active-map (kbd "C-n") 'company-select-next)
;;(define-key company-active-map (kbd "C-p") 'company-select-previous)
;;;;; C-h���f�t�H���g�Ńh�L�������g�\����map����Ă���̂ŁA������������悤��map���O��
;;(define-key company-active-map (kbd "C-h") nil)
;;;;; 1������₪�Ȃ�������tab�ŕ⊮�A������₪�����tab�Ŏ��̌��֍s���悤��
;;(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;;;;; �h�L�������g�\��
;;(define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
;; 
;;(setq company-minimum-prefix-length 1) ;; 1�������͂ŕ⊮�����悤��
;; ;;; ���̈�ԏ��select-previous�������ԉ��ɁA��ԉ���select-next�������ԏ�ɍs���悤��
;;(setq company-selection-wrap-around t)
;; 
;;;;; �F�̐ݒ�B�o���邾����ɂȂ�Ȃ��悤��
;;(set-face-attribute 'company-tooltip nil
;;                    :foreground "black"
;;                    :background "lightgray")
;;(set-face-attribute 'company-preview-common nil
;;                    :foreground "dark gray"
;;                    :background "black"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-selection nil
;;                    :background "steelblue"
;;                    :foreground "white")
;;(set-face-attribute 'company-tooltip-common nil
;;                    :foreground "black"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-common-selection nil
;;                    :foreground "white"
;;                    :background "steelblue"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-annotation nil
;;                                        :foreground "red")