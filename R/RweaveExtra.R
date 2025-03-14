### RweaveExtra: Sweave drivers with extra tricks up their sleeve
###
### Copyright (C) 2021-2024 Vincent Goulet, 1995-2016 The R Core Team
### License: GPL 2 or later
###
### Definition of the drivers.
###
### Many of the functions therein just call the standard Sweave
### functions from package utils by Friedrich Leisch and R-core,
### before or after some minor processing.
###
### One exception is 'RtangleExtraRuncode' that is a modified version
### of 'RtangleRuncode'.

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
                            debug = debug, stylepath = stylepath, ...)
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
             ignore = FALSE, extension = TRUE, chunk.sep = "\n\n", ...)
{
    res <- RtangleSetup(file, syntax, output = output, annotate = annotate,
                        split = split, quiet = quiet,
                        drop.evalFALSE = drop.evalFALSE,
                        ignore.on.tangle = ignore.on.tangle,
                        ignore = ignore, extension = extension,
                        chunk.sep = chunk.sep, ...)

    ## to be on the safe side: see if defaults pass the check
    res$options <- RweaveLatexOptions(res$options)
    res
}

## Copy of utils::.SweaveValidFilenameRegexp
.RweaveExtraValidFilenameRegexp <- "^[[:alnum:]/#+_-]+$"

## Modified version of utils::RtangleRuncode. My changes are indicated
## by 'VG' in comments. The other comments are from SweaveDrivers.R in
## the sources of the package utils.
RtangleExtraRuncode <- function(object, chunk, options)
{
    ## VG: additional conditions to skip processing and return the
    ## object.
    if (options$ignore || options$ignore.on.tangle ||
        !(options$engine %in% c("R", "S")))
        return(object)

    chunkprefix <- RweaveChunkPrefix(options)

    if (options$split)
    {
        if (!grepl(.RweaveExtraValidFilenameRegexp, chunkprefix))
            warning("file stem ", sQuote(chunkprefix), " is not portable",
                    call. = FALSE, domain = NA)
        ## VG: use the engine as default extension
        if (isTRUE(options$extension))
            options$extension <- options$engine
        ## VG: use an extension for the filename unless the option
        ## 'extension' is FALSE
        ext <- if (!isFALSE(options$extension)) paste0(".", options$extension)
        outfile <- paste0(chunkprefix, ext)
        if (!object$quiet) cat(options$chunknr, ":", outfile,"\n")
        ## [x][[1L]] avoids partial matching of x
        ## VG: use 'outfile' instead of 'chunkout' for the name of the
        ## list element to avoid clashes in the case where chunks
        ## share the same label, but with different extensions.
        chunkout <- object$chunkout[outfile][[1L]]
        if (is.null(chunkout))
        {
            chunkout <- file(outfile, "w")
            if (!is.null(options$label))
                object$chunkout[[outfile]] <- chunkout # VG: same as above
        }
    }
    else
        chunkout <- object$output

    showOut <- options$eval || !object$drop.evalFALSE
    if(showOut)
    {
        ## VG: first print the chunk separator if the current
        ## connection object is not used for the first time (it has an
        ## attribute) and option 'chunk.sep' is not FALSE
        if (!is.null(attr(chunkout, "not.first")) && !isFALSE(options$chunk.sep))
            cat(options$chunk.sep, file = chunkout)
        annotate <- object$annotate
        if (is.logical(annotate) && annotate) {
            cat("###################################################\n",
                "### code chunk number ", options$chunknr, ": ",
                if(!is.null(ol <- options$label)) ol else .RtangleCodeLabel(chunk),
                if(!options$eval) " (eval = FALSE)", "\n",
                "###################################################\n",
                file = chunkout, sep = "")
        }
        else if (is.function(annotate))
            annotate(options, chunk = chunk, output = chunkout)
    }

    ## The next returns a character vector of the logical options
    ## which are true and have hooks set.
    hooks <- SweaveHooks(options, run = FALSE)
    for (k in hooks)
        cat("getOption(\"SweaveHooks\")[[\"", k, "\"]]()\n",
            file = chunkout, sep = "")

    if(showOut)
    {
        if (!options$show.line.nos) # drop "#line ...." lines
            chunk <- grep("^#line ", chunk, value = TRUE, invert = TRUE)
        if (!options$eval)
            chunk <- paste("##", chunk)
        ## VG: do not write a newline after every chunk, as the
        ## standard driver does
        cat(chunk, file = chunkout, sep = "\n")
        ## VG: add an attribute to the connection object (the value is
        ## not important) to indicate text was written to it at least
        ## once
        if (options$split)
        {
            if (!is.null(options$label))
                attr(object$chunkout[[outfile]], "not.first") <- TRUE
        }
        else
            attr(object$output, "not.first") <- TRUE
    }
    if (is.null(options$label) && options$split)
        close(chunkout)
    object
}
