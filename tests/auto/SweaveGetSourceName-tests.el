;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "SweaveGetSourceName-tests"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper")))
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10")
   (LaTeX-add-environments
    '("exercice" LaTeX-env-args ["argument"] 0)))
 :latex)

