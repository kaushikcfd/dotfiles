(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    nord-theme                      ;; Theme
    evil                            ;; vim key-bindings
    elpy                            ;; Emacs lisp python environment
    flycheck                        ;; On the fly syntax checking
    magit                           ;; Git integration
    org-journal                     ;; Org-journalling
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
(setq inhibit-startup-message t)                            ;; org-journal-new-netry as the startup screen
(require 'org-journal)
(org-journal-open-current-journal-file)
(delete-other-windows)
(load-theme 'nord t)                                        ;; Load Nord theme
(global-linum-mode t)                                       ;; enable line numbers globally


;; Hard word wrapping
(setq column-number-mode t)
(global-visual-line-mode t)
(add-hook 'prog-mode-hook '(lambda() (set-fill-column 85))) ;; word wrap column=85
(add-hook 'prog-mode-hook 'turn-on-auto-fill)

;; Spell Check
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))


;; Evil Mode options
(require 'evil)
(evil-mode 1)

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(setq elpy-rpc-python-command "/usr/bin/python3")
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq-default flycheck-disabled-checkers '(python-mypy))
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
(setq flycheck-python-flake8-executable "/usr/bin/flake8")
(setq flycheck-mode t)

;; tramp config
(setq tramp-default-method "ssh")


;;;;;;; End of user's init.el
