;; .emacs.d/init.el

;; ref: https://realpython.com/emacs-the-best-python-editor/

;;keep message buffer complete.
(setq message-log-max t)
(tool-bar-mode 0)                   ;; Hide the tool bar
(setq inhibit-startup-message t)    ;; Hide the startup message
(global-linum-mode t)               ;; Enable line numbers globally

(message "Reading configuration file...")

;;Initialize files----------------------------
;; Where to find external lisp-files, for modes, etc. I put my *el
;; files in "~/.emacs.d/elisp/" where ~/.emacs.d/ is the
;; user-emacs-directory
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
;;--------------------------------------------

;; For the built in customization UI in emacs that no one uses. If
;; some package tries to use it, at least have the decency to keep
;; this config file clean.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'own-init)
;; User-Defined init.el ends here
