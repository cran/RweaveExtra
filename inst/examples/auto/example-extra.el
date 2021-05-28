(TeX-add-style-hook
 "example-extra"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "Sweave")
   (TeX-add-symbols
    '("pkg" 1)
    '("code" 1)))
 :latex)

