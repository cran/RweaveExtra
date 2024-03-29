%%% RweaveExtra: Sweave drivers with extra tricks up their sleeve
%%%
%%% Copyright (C) 2021-2024 Vincent Goulet
%%% License: GPL 2 or later

\name{RtangleExtra}
\alias{RtangleExtra}
\alias{RtangleExtraSetup}
\title{R Driver for Stangle with Additional Options}
\description{
  A driver for \code{\link[utils]{Sweave}} extending the standard driver
  \code{\link[utils]{Rtangle}} with additional code chunk options.
}
\usage{
RtangleExtra()

RtangleExtraSetup(file, syntax, output = NULL, annotate = TRUE,
                  split = FALSE, quiet = FALSE, drop.evalFALSE = FALSE,
                  ignore.on.tangle = FALSE, ignore = FALSE,
                  extension = NULL, ...)
}
\arguments{
  \item{file}{Name of Sweave source file. See the description of the
    corresponding argument of \code{\link[utils]{Sweave}}.}
  \item{syntax}{An object of class \code{SweaveSyntax}. See
    \code{\link[utils]{Rtangle}}.}
  \item{output}{Name of output file used unless \code{split = TRUE}.
    See \code{\link[utils]{Rtangle}}.}
  \item{annotate}{A logical or \code{\link{function}}. See
    \code{\link[utils]{Rtangle}}.}
  \item{split}{Split output into a file for each code chunk?}
  \item{quiet}{Logical to suppress all progress messages.}
  \item{drop.evalFALSE}{See \code{\link[utils]{Rtangle}}.}
  \item{ignore.on.tangle}{If \code{TRUE}, the code chunk is ignored
    entirely.}
  \item{ignore}{An alternative way to set both \code{ignore.on.weave}
    of \code{\link{RweaveExtraLatex}} and \code{ignore.on.tangle}.}
  \item{extension}{Extension to use for the file name, without the
    leading dot, when splitting is selected. If \code{NULL}, the default
    extension of \code{\link[utils]{Rtangle}} is used (the
    \sQuote{engine}, usually \file{R}). If \code{FALSE}, no extension
    is added to the file name.}
  \item{\dots}{See \code{\link[utils]{RweaveLatex}}.}
}
\details{
  Chunks ignored on tangling are not written out to script files, but
  they are processed normally on weaving (unless \code{ignore = TRUE}).
  Therefore, chunks may still use \code{eval = TRUE} for weaving
  purposes, yet not be tangled.
  
  The argument \code{extension} is specially useful with
  \code{ignore.on.weave = TRUE} of \code{\link{RweaveExtraLatex}} to
  include code or text that the engine would not be able to parse.
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
  \code{\link{RweaveExtraLatex}}, \code{\link[utils]{Rtangle}},
  \code{\link[utils]{Sweave}}.
}
\examples{
testfile <- system.file("examples", "example-extra.Rnw",
                        package = "RweaveExtra")
\dontshow{
oldwd <- setwd(tempdir()) # so we will write only to a temp directory
}

## Check the contents of the file
if (interactive()) file.show(testfile)

## Tangle the file in the current working directory
Stangle(testfile, driver = RtangleExtra())

## View tangled file
if (interactive()) file.show("example-extra.R")

## Use 'extension=sh' with 'ignore.on.weave=TRUE', and
## the options 'split=TRUE' and 'prefix=FALSE' of Stangle
## to extract the shell script to a file 'hello.sh'
Stangle(testfile, driver = RtangleExtra(),
        split = TRUE, annotate = FALSE)
if(interactive()) file.show("hello.sh")

\dontshow{
if(!interactive()) unlink(c("example-extra*", "hello.sh"))
setwd(oldwd)
}
}
\keyword{utilities}
