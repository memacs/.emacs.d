;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    magit                           ;; Git integration
    company-jedi                    ;; Company-mode completion back-end for Python JEDI
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(load-theme 'material t)            ;; Load material theme

;; User-Defined init.el ends here

;; ====================================
;; Development Setup
;; ====================================

(defun my-python-mode-config ()
  ;; Enable elpy
  ;; https://elpy.readthedocs.io/en/latest/introduction.html
  (elpy-enable)
  (setq tab-width     4
	python-indent 4
	elpy-rpc-python-command "python3"
	python-shell-interpreter "python3"
	python-shell-interpreter-args "-i")

  ;;(add-to-list 'company-backends 'company-jedi)
  ;; Enable Flycheck
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  ;; Enable autopep8
  (require 'py-autopep8)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(add-hook 'python-mode-hook 'my-python-mode-config)

(provide 'own-init)
