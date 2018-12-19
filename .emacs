(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Set by some plugin
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (light-blue)))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Courses/F18/CS556/homeworks/project/numerics_review.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Setting line numbers
(global-linum-mode t)

;; Word wrap options
(global-visual-line-mode t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
  '(lambda() (set-fill-column 80)))

;; Spell Check
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; Org mode options
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'org-mode-hook 'flyspell-mode)

;; Org mode latex preferences
(require 'ox-latex)
(require 'ox-beamer)
(require 'org-ref)
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted")))
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f && latexmk -c"))
(setq org-latex-caption-above nil)

(add-to-list 'org-latex-classes
            `("beamer"
              ,(concat "\\documentclass[presentation]{beamer}\n"
                       "[DEFAULT-PACKAGES]"
                       "[PACKAGES]"
                       "[EXTRA]\n")
              ("\\section{%s}" . "\\section*{%s}")
              ("\\subsection{%s}" . "\\subsection*{%s}")
              ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
   '("cs556"
      "\\documentclass[review]{siamart171218}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{amsfonts}
\\usepackage{graphicx}
\\usepackage{algorithmic}
\\usepackage{amsopn}
\\usepackage{listings}
\\usepackage{booktabs}
\\usepackage{hyperref}
\\usepackage{amssymb}
\\usepackage{amsmath}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; org-ref options
(setq org-ref-bibliography-notes "~/Dropbox/orgfiles/bibliography/notes.org"
      org-ref-pdf-directory "~/Dropbox/orgfiles/bibliography/bibtex-pdfs/")


;; Evil Mode options
(require 'evil)
(evil-mode 1)
