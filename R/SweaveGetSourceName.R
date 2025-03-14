### RweaveExtra: Sweave drivers with extra tricks up their sleeve
###
### Copyright (C) 2021-2024 Vincent Goulet
### License: GPL 2 or later
###
### Utility function to to extract the name of the file from which
### Sweave (or Stangle) is called.

SweaveGetSourceName <- function()
{
    if (interactive())
        stop("this function cannot be used from an interactive session")

    args <- commandArgs(FALSE)

    ## If Sweave [resp. Stangle] is launched with
    ##
    ##   R -e "Sweave('foo.Rnw', ...)"
    ##
    ## The expression is one of the arguments and we can extract the
    ## filename.
    cmd <- grep(r"((Sweave|Stangle)\()", args, value = TRUE)
    if (length(cmd))
    {
        m <- gregexec(r"((?:Sweave|Stangle)\([[:space:]]*(['"])([^'"]*)\1)",
                      cmd, perl = TRUE)
        return(regmatches(cmd, m)[[1L]][3L])
    }

    ## If Sweave [resp. Stangle] is launched with
    ##
    ##   R CMD Sweave --encoding="utf-8" foo.Rnw
    ##
    ## the argument containing the relevant information is a character
    ## string of the form
    ##
    ##   nextArg--encoding=utf-8nextArgfoo.Rnw
    ##
    ## The arguments are in the order they were entered at the command
    ## line.
    cmd <- grep("^nextArg", args, value = TRUE)
    if (length(cmd))
    {
        s <- strsplit(cmd, 'nextArg', fixed = TRUE)[[1L]]
        return(grep("^--|^$", s, invert = TRUE, value = TRUE))
    }
}
