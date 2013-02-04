; -*- mode: emacs-lisp -*-

(ido-mode t)
(global-font-lock-mode 1)
(server-start)

(setq inhibit-splash-screen t)

(add-to-list 'load-path (expand-file-name "~/code/elisp"))

;;; package.el

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
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

;;; Magit

(global-set-key (kbd "<f6>") 'magit-status)

;;; Local configuration

(let ((local-conf (expand-file-name "~/.emacs.d/local.el")))
  (if (file-exists-p local-conf)
      (load-file local-conf)))
