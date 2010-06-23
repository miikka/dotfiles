; -*- mode: emacs-lisp -*-

(ido-mode t)
(global-font-lock-mode 1)

(setq inhibit-splash-screen t)

(add-to-list 'load-path (expand-file-name "~/code/elisp"))

(require 'magit)

;;; remember

(add-to-list 'load-path (expand-file-name "~/code/elisp/remember"))
(require 'remember)

;; org-mode

(add-to-list 'load-path (expand-file-name "~/code/elisp/org/lisp"))
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "~/Dropbox/notes")
(setq org-mobile-inbox-for-pull "~/Dropbox/notes/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-clock-idle-time 10)
(setq org-clock-into-drawer 3)

;; Diary

(european-calendar)
(setq calendar-week-start-day 1
      calendar-day-name-array
      ["sunnuntai" "maanantai" "tiistai" "keskiviikko"
       "torstai" "perjantai" "lauantai"]
      calendar-month-name-array
      ["tammikuu" "helmikuu" "maaliskuu" "huhtikuu" "toukokuu" 
       "kesäkuu" "heinäkuu" "elokuu" "syyskuu"
       "lokakuu" "marraskuu" "joulukuu"])

(setq org-agenda-include-diary t)

;;; handy functions

(defun reload-conf ()
  "Reload ~/.emacs"
  (interactive)
  (load-file (expand-file-name "~/.emacs")))

(transient-mark-mode 1)

(setq-default ispell-program-name "aspell")

;;; AuCTeX

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;; flyspell

(autoload 'flyspell-babel-setup "flyspell-babel")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-babel-setup)

;;; CUSTOM

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^a5\\(?:comb\\|paper\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o %(outpage)") ("^html?$" "." "netscape %o"))))
 '(add-log-time-format (quote current-time-string))
 '(ecb-options-version "2.32")
 '(org-agenda-files (quote ("~/Dropbox/notes/index.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
