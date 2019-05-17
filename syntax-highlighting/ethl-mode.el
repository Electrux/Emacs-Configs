;;; ethl-mode.el --- description -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(defvar ethl-mode-hook nil)

(defvar ethl-mode-map
  (let ((map (make-keymap)))
    map)
  "Keymap for Ethereal major mode.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.et\\'" . ethl-mode))

(defconst ethl-font-lock-keywords-1
  (list
   '("\\<\\(i\\(nclude\\|mport\\|f\\)\\|a\\(s\\|lias\\|ny\\)\\|nil\\|s\\(truct\\|can\\)\\|f\\(n\\|or\\)\\|el\\(if\\|se\\)\\|return\\|continue\\|break\\|ldmod\\|println\\)\\>" . font-lock-builtin-face)
   '("\\('\\w*'\\)" . font-lock-variable-name-face))
  "Minimal highlighting expressions for Ethereal mode.")

(defvar ethl-font-lock-keywords ethl-font-lock-keywords-1
  "Default highlighting expressions for Ethereal mode.")

(defvar ethl-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?# "< c" st)
    (modify-syntax-entry ?\n "> c" st)
    (modify-syntax-entry ?' "\"" st)
    st)
  "Syntax table for ethl-mode.")

;;;###autoload
(define-derived-mode ethl-mode js-mode "Ethl"
;;(defun ethl-mode ()
  "Major mode for editing Ethereal Language files."
  (set (make-local-variable 'font-lock-defaults) '(ethl-font-lock-keywords)))
;;  (interactive)
;;  (kill-all-local-variables)
;;  (set-syntax-table ethl-mode-syntax-table)
;;  (use-local-map ethl-mode-map)
;;  (set (make-local-variable 'font-lock-defaults) '(ethl-font-lock-keywords))
;;  (set (make-local-variable 'indent-line-function) 'ethl-indent-line)
;;  (setq major-mode 'ethl-mode)
;;  (setq mode-name "Ethl")
;;  (run-hooks 'ethl-mode-hook))

(provide 'ethl-mode)
;;; ethl-mode.el ends here
