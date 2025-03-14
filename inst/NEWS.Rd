\name{NEWS}
\title{\pkg{RweaveExtra} News}
\encoding{UTF-8}

\section{CHANGES IN \pkg{RweaveExtra} VERSION 1.2-0}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item{Option \code{chunk.sep} for the driver \code{RtangleExtra}
	to control the spacing between code chunks in the tangled
	script.}
      \item{Function \code{SweaveGetSourceName} to extract the name of
	the file processed by \code{Sweave} or \code{Stangle} in a
	non-interactive session.}
    }
  }
  \subsection{USER VISIBLE CHANGES}{
    \itemize{
      \item{The default value of option \code{extension} is now
	\code{TRUE}. This is now the value that will use the name of the
	engine as extension. The value \code{NULL} is now equivalent to
	\code{FALSE}.}
    }
  }
}

\section{CHANGES IN \pkg{RweaveExtra} VERSION 1.1-0}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item{Option \code{extension} for the driver \code{RtangleExtra}
	to specify the extension of the file name (or remove it
	entirely) when splitting is selected on tangling.}
    }
  }
}

\section{CHANGES IN \pkg{actuar} VERSION 1.0-0}{
  \itemize{
    \item{Initial release. The additional options for the weaving and
      tangling drivers of Sweave are \code{ignore.on.weave},
      \code{ignore.on.tangle} and \code{ignore}.}
  }
}
