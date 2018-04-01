;; setting for flymake
(require 'flymake)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
(global-set-key (kbd "C-x C-n") 'flymake-goto-next-error) 
(global-set-key (kbd "C-x C-p") 'flymake-goto-prev-error) ;;
;;
;; 
;;;; Show error message under current line
;;(require 'popup)
;;(defun flymake-display-err-menu-for-current-line ()
;;  (interactive)
;;  (let* ((line-no (flymake-current-line-no))
;;         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no))))
;;    (when line-err-info-list
;;      (let* ((count (length line-err-info-list))
;;             (menu-item-text nil))
;;        (while (> count 0)
;;          (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
;;          (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;;                 (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;;            (if file
;;                (setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
;;          (setq count (1- count))
;;          (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
;;          )
;;        (popup-tip menu-item-text)))))
;; 
;;;; If you don't set :height, :bold face parameter of 'pop-tip-face,
;;;; then seting those default values
;;(if (eq 'unspecified (face-attribute 'popup-tip-face :height))
;;    (set-face-attribute 'popup-tip-face nil :height 1.0))
;;(if (eq 'unspecified (face-attribute 'popup-tip-face :weight))
;;    (set-face-attribute 'popup-tip-face nil :weight 'normal))
;; 
;;(defun my/display-error-message ()
;;  (let ((orig-face (face-attr-construct 'popup-tip-face)))
;;    (set-face-attribute 'popup-tip-face nil
;;                        :height 1.5 :foreground "firebrick"
;;                        :background "LightGoldenrod1" :bold t)
;;    (unwind-protect
;;        (flymake-display-err-menu-for-current-line)
;;      (while orig-face
;;        (set-face-attribute 'popup-tip-face nil (car orig-face) (cadr orig-face))
;;        (setq orig-face (cddr orig-face))))))
;; 
;;(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
;;  (my/display-error-message))
;;(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
;;  (my/display-error-message))
;; 
;;(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
;;(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)
;;google-translate