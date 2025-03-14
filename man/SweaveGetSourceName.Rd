%%% RweaveExtra: Sweave drivers with extra tricks up their sleeve
%%%
%%% Copyright (C) 2021-2024 Vincent Goulet
%%% License: GPL 2 or later

\name{SweaveGetSourceName}
\alias{SweaveGetSourceName}
\title{File Processed by Sweave or Stangle}
\description{
  Extract the name of the file currently processed by
  \code{\link[utils]{Sweave}} or \code{\link[utils]{Stangle}} in a
  non-interactive session.
}
\usage{
SweaveGetSourceName()
}
\details{
  The function returns the name of the source file being processed by
  \code{Sweave} or \code{Stangle} when the tool is invoked from the
  command line through either:
  \enumerate{
    \item an expression passed to \code{R -e} or
      \code{\link[utils]{Rscript}};
    \item \code{R CMD Sweave} or \code{R CMD Stangle}.
  }

  In the first scenario, the filename must be the first, unnamed
  argument to \code{Sweave} or \code{Stangle}.

  This function cannot be used from an interactive R session.
}
\value{
  Filename as a character string.
}
\author{
  Vincent Goulet
}
\examples{
testfile <- system.file("examples", "example-source.Rnw",
                        package = "RweaveExtra")
\dontshow{oldwd <- setwd(tempdir())}
## Check the contents of the file
if (interactive()) file.show(testfile)

## Sweave the file in a separate process
expr <- paste0("Sweave('", testfile, "', ",
               "encoding = 'utf-8')")
system2("R", c("-e", paste0("\"", expr, "\"")))

## View woven file
if (interactive()) file.show("example-source.tex")

## Stangle was called from within Sweave in the file
if (interactive()) file.show("example-source.R")

## Repeat using 'R CMD Sweave'
system2("R", c("CMD", "Sweave", testfile, "--encoding=utf-8"))
if (interactive()) file.show("example-source.tex")
if (interactive()) file.show("example-source.R")

## Do not use the function interactively
\dontrun{SweaveGetSourceName()
}
\dontshow{if (!interactive()) unlink(c("example-source*", ".Rprofile"))
setwd(oldwd)}
}
\keyword{utilities}
