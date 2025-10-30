%%% RweaveExtra: Sweave drivers with extra tricks up their sleeve
%%%
%%% Copyright (C) 2021-2024 Vincent Goulet
%%% License: GPL 2 or later

\name{RweaveExtraLatex}
\alias{RweaveExtraLatex}
\alias{RweaveExtraLatexSetup}
\alias{RweaveExtraLatexRuncode}
\title{R/LaTeX Driver for Sweave with Extra Tricks}
\description{
  A driver for \code{\link[utils]{Sweave}} extending the standard driver
  \code{\link[utils]{RweaveLatex}} with additional code chunk options.
}
\usage{
RweaveExtraLatex()

RweaveExtraLatexSetup(file, syntax, output = NULL, quiet = FALSE,
                      debug = FALSE, stylepath, ignore.on.weave = FALSE,
                      ignore = FALSE, weave = !ignore.on.weave, ...)

RweaveExtraLatexRuncode(object, chunk, options)
}
\arguments{
  \item{file}{name of Sweave source file; see the description of the
    corresponding argument of \code{\link[utils]{Sweave}}.}
  \item{syntax}{an object of class \code{SweaveSyntax}; see
    \code{\link[utils]{RweaveLatex}}.}
  \item{output}{name of output file; see
  \code{\link[utils]{RweaveLatex}}.}
  \item{quiet}{if \code{TRUE} all progress messages are suppressed; see
    \code{\link[utils]{RweaveLatex}}.}
  \item{debug}{if \code{TRUE}, input and output of all code chunks is
    copied to the console; see \code{\link[utils]{RweaveLatex}}.}
  \item{stylepath}{see \code{\link[utils]{RweaveLatex}}.}
  \item{ignore.on.weave}{if \code{TRUE}, the code chunk is ignored entirely,
    i.e., neither parsed nor evaluated.}
  \item{ignore}{an alternative way to set both \code{ignore.on.weave}
    and \code{ignore.on.tangle} of \code{\link{RtangleExtra}}.}
  \item{weave}{an \emph{alias} for \code{!ignore.on.weave}.}
  \item{\dots}{see \code{\link[utils]{RweaveLatex}}.}
  \item{object}{an object created by the \code{setup} function of the
    driver; see \code{\link[utils]{RweaveLatex}}.}
  \item{chunk}{text of a code chunk.}
  \item{options}{named list of character strings.}
}
\details{
  See \code{\link[utils]{RweaveLatex}} for details on Sweave drivers.

  \code{RweaveExtra} is the Sweave driver. \code{RweaveExtraSetup} and
  \code{RweaveExtraRuncode} are functions for the \code{setup} and
  \code{runcode} elements of the driver, respectively. The driver uses
  the functions of the standard \code{\link[utils]{RweaveLatex}} driver
  for the other elements.

  Chunks ignored on weaving are not parsed and are not evaluated, but
  they are written out on tangling as normal code chunks (unless
  \code{ignore=TRUE}).

  If \code{ignore.on.weave} or \code{ignore} is \code{FALSE}, the code
  chunk is processed using the standard driver
  \code{\link[utils]{RweaveLatex}} with its options.
}
\value{
  Named \code{list} of five functions; see \code{\link[utils]{Sweave}}
  or the \sQuote{Sweave User Manual} vignette in the \pkg{utils}
  package.
}
\author{
  Vincent Goulet, based on work by Friedrich Leisch and R-core.
}
\seealso{
  \code{\link{RtangleExtra}}, \code{\link[utils]{RweaveLatex}},
  \code{\link[utils]{Sweave}}.
}
\examples{
testfile <- system.file("examples", "example-extra.Rnw", package = "RweaveExtra")
\dontshow{oldwd <- setwd(tempdir())}
## Check the contents of the file
if(interactive()) file.show(testfile)

## Weave, then tangle the file in the current working directory
Sweave(testfile, driver = RweaveExtraLatex())
Stangle(testfile, driver = RtangleExtra())

## View weaved and tangled files
if(interactive()) file.show("example-extra.tex")
if(interactive()) file.show("example-extra.R")

\dontshow{if(!interactive()) unlink("example-extra*")
setwd(oldwd)}
}
\keyword{utilities}
