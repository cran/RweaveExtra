### RweaveExtra: Sweave drivers with extra tricks up their sleeve
###
### Copyright (C) 2021 Vincent Goulet
### License: GPL 2 or later
###
### Definition of the drivers.
###
### This is all heavily based on the Sweave sources in package utils
### by Friedrich Leisch and R-core.

RweaveExtraLatex <- function()
{
    list(setup = RweaveExtraLatexSetup,
         runcode = RweaveExtraLatexRuncode,
         writedoc = RweaveLatexWritedoc,
         finish = RweaveLatexFinish,
         checkopts = RweaveLatexOptions)
}

RweaveExtraLatexSetup <-
    function(file, syntax, output = NULL, quiet = FALSE, debug = FALSE,
             stylepath, ignore.on.weave = FALSE, ignore = FALSE, ...)
{
    res <- RweaveLatexSetup(file, syntax, output = output, quiet = quiet,
                            debug = debug, stylepath = stylepath)
    res$options[["ignore.on.weave"]] <- ignore.on.weave
    res$options[["ignore"]] <- ignore

    ## to be on the safe side: see if defaults pass the check
    res$options <- RweaveLatexOptions(res$options)
    res
}

RweaveExtraLatexRuncode <- function(object, chunk, options)
{
    if (options$ignore || options$ignore.on.weave)
        return(object)

    makeRweaveLatexCodeRunner()(object, chunk, options)
}

RtangleExtra <- function()
{
    list(setup = RtangleExtraSetup,
         runcode = RtangleExtraRuncode,
         writedoc = RtangleWritedoc,
         finish = RtangleFinish,
         checkopts = RweaveLatexOptions)
}

RtangleExtraSetup <-
    function(file, syntax, output = NULL, annotate = TRUE, split = FALSE,
             quiet = FALSE, drop.evalFALSE = FALSE, ignore.on.tangle = FALSE,
             ignore = FALSE, ...)
{
    res <- RtangleSetup(file, syntax, output = output, annotate = annotate,
                        split = split, quiet = quiet,
                        drop.evalFALSE = drop.evalFALSE)
    res$options[["ignore.on.tangle"]] <- ignore.on.tangle
    res$options[["ignore"]] <- ignore

    ## to be on the safe side: see if defaults pass the check
    res$options <- RweaveLatexOptions(res$options)
    res
}

RtangleExtraRuncode <- function(object, chunk, options)
{
    if (options$ignore || options$ignore.on.tangle)
        return(object)

    RtangleRuncode(object, chunk, options)
}
