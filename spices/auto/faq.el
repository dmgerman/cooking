(TeX-add-style-hook "faq"
 (function
  (lambda ()
    (LaTeX-add-bibliographies
     "spices")
    (LaTeX-add-labels
     "vanilla-extract"
     "vanilla-flavouring"
     "vanilla-powder")
    (TeX-run-style-hooks
     "art11"
     "article"
     "11pt"
     "fullpage"
     "isolatin1"))))

