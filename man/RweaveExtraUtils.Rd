%%% RweaveExtra: Sweave drivers with extra tricks up their sleeve
%%%
%%% Copyright (C) 2021-2024 Vincent Goulet
%%% License: GPL 2 or later

\name{RweaveExtraLatexUtils}
\alias{RweaveExtraLatexRuncode}
\alias{RtangleExtraRuncode}
\title{RweaveExtra Driver Utilities}
\description{
  These functions are considered internal and hence not documented. The
  first mostly calls \code{makeRweaveLatexCodeRunner}, whereas the
  second is a modified version of \code{RtangleRuncode}, both from
  package \pkg{utils}.
}
\usage{
RweaveExtraLatexRuncode(object, chunk, options)
RtangleExtraRuncode(object, chunk, options)
}
\value{
  No return value; called for their side effects.
}
\author{
  Vincent Goulet, based on work by Friedrich Leisch, R-core and
  Seth Falcon.
}
\seealso{
  \code{\link[utils]{Sweave}}, \code{\link[utils]{RweaveLatex}},
  \code{\link[utils]{Rtangle}}.
}
\keyword{utilities}
\keyword{internal}
