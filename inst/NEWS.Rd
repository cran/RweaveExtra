\name{NEWS}
\title{\pkg{RweaveExtra} News}
\encoding{UTF-8}

\section{CHANGES IN \pkg{RweaveExtra} VERSION 1.3-1}{
  \subsection{USER VISIBLE CHANGES}{
    \itemize{
      \item{Mark the package as deprecated since \R 4.6.0 incorporates
	all its functionalities. On \R >= 4.6.0, the package uses the
	standard drivers and does not export the utility function
	\code{SweaveGetSourceName}. Behaviour for earlier versions
	remains unchanged.}
    }
  }
}

\section{CHANGES IN \pkg{RweaveExtra} VERSION 1.3-0}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item{Aliases \code{weave} and \code{tangle} for
	\code{!ignore.on.weave} and \code{!ignore.on.tangle},
	respectively.}
    }
  }
  \subsection{USER VISIBLE CHANGES}{
    \itemize{
      \item{Functions \code{RweaveExtraLatexRuncode} and
	\code{RtangleExtraRuncode} are now documented with their driver,
	like the corresponding functions in the package \pkg{utils}.
	Therefore, \code{?RweaveExtraUtils} no longer exists.}
    }
  }
}

\section{CHANGES IN \pkg{RweaveExtra} VERSION 1.2-1}{
  \subsection{BUG FIX}{
    \itemize{
      \item{\code{SweaveGetSourceName} could fail to identify the name
	of the source file on Windows for jobs started with \code{R CMD
	  Sweave}.}
    }
  }
}

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
	\code{TRUE}. This is the value that will use the name of the
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
