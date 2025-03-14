%%% RweaveExtra: Sweave drivers with extra tricks up their sleeve
%%%
%%% Copyright (C) 2021-2024 Vincent Goulet
%%% License: GPL 2 or later

\name{RweaveExtra-package}
\alias{RweaveExtra-package}
\alias{RweaveExtra}
\docType{package}
\title{
  \packageTitle{RweaveExtra}
}
\description{
  \packageDescription{RweaveExtra}
}
\details{
  The \code{\link{RweaveExtraLatex}} and \code{\link{RtangleExtra}}
  drivers extend the standard \code{\link[utils]{Sweave}} drivers
  \code{\link[utils]{RweaveLatex}} and
  \code{\link[utils]{Rtangle}}, respectively. They are selected
  through the \code{driver} argument of \code{\link[utils]{Sweave}}.

  The drivers provide additional options to completely ignore code
  chunks on weaving, tangling, or both. Chunks ignored on weaving are
  not parsed and are written out verbatim on tangling. Chunks ignored on
  tangling are processed as usual on weaving, but completely left out of
  the tangled scripts. The driver \code{\link{RtangleExtra}} furthermore
  provides two additional options: \code{chunk.sep} to control the
  separation (or remove it entirely) between code chunks in the tangled
  script; \code{extension} to specify the extension of the file name (or
  remove it entirely) when splitting is selected.

  In a literate programming workflow, the additional options allow
  to include code chunks in a file such as:
  \itemize{
    \item{code that is not parsable by R (say, because of errors
      inserted for educational purposes);}
    \item{code in another programming language entirely (say, a shell
      script to start an analysis);}
    \item{code for a Shiny app.}
  }

  With the standard drivers, using option \code{eval = FALSE} results in
  code being commented out in tangled scripts files. Chunks may be
  omitted on tangling with \code{drop.evalFALSE = TRUE}, but only
  provided the chunk is not evaluated on weaving. Therefore, the
  standard drivers have no provision to either omit a chunk on weaving
  and tangle it as is, or to process a chunk on weaving but omit it
  on tangling.  
}
\author{
  \packageAuthor{RweaveExtra}

  Maintainer: \packageMaintainer{RweaveExtra}
}
\keyword{package}
