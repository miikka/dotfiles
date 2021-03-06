; -*- mode: emacs-lisp -*-

;;; Customization in its own file
;;;
;;; This should be done early in the configuration so that the customizations
;;; get loaded. For example, load-theme stores safe themes in a custom variable.

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file) (load custom-file))

;;; General stuff

(ido-mode t)
(global-font-lock-mode 1)
(server-start)

(setq inhibit-splash-screen t)

(add-to-list 'load-path (expand-file-name "~/code/elisp"))

;;; package.el

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun package-install-if-needed (package)
  "Install a package if it's missing."
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;;; handy functions

(defun reload-conf ()
  "Reload ~/.emacs"
  (interactive)
  (load-file (expand-file-name "~/.emacs")))

(transient-mark-mode 1)

;;; GUI

(tool-bar-mode -1)
(scroll-bar-mode -1)
(if (not (eq system-type 'darwin)) (menu-bar-mode -1))

;;; smex

(package-install-if-needed 'smex)
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;; Magit

(global-set-key (kbd "<f6>") 'magit-status)

;; Emacs Lisp

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode-enable)

;;; Clojure

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode-enable)

;;; Local configuration

(let ((local-conf (expand-file-name "~/.emacs.d/local.el")))
  (if (file-exists-p local-conf)
      (load-file local-conf)))
