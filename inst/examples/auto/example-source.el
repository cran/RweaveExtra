(TeX-add-style-hook
 "example-source"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "Sweave")
   (TeX-add-symbols
    '("code" 1))
   (LaTeX-add-environments
    '("exercice" LaTeX-env-args ["argument"] 0)
    '("vplace" LaTeX-env-args ["argument"] 0)
    '("margintable" LaTeX-env-args ["argument"] 0)
    '("marginfigure" LaTeX-env-args ["argument"] 0)
    '("mem@margin@float" LaTeX-env-args ["argument"] 1)
    '("verse" LaTeX-env-args ["argument"] 0)
    '("bibexample" LaTeX-env-args ["argument"] 0)
    '("texample" LaTeX-env-args ["argument"] 0)
    '("tabular" LaTeX-env-args ["argument"] 1)))
 :latex)

