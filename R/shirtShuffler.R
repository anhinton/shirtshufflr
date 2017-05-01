#! /usr/bin/env Rscript

#' Choose which shirt I will wear each weekday
#'
#' Raw shirt patterns are found in the \file{rawShirts}
#' subdirectory. This function randomly selects 5 of the patterns, and
#' copies files names for each weekday into the \file{order}
#' directory. Just open the image for each day of the week to find
#' your shirt surprise.
#'
#' You can have as many shirts as you like in \file{rawShirts}, but
#' you should probably have at least five or the sample will fail.
#'
#' This function also assumes your shirt images are JPG files, so
#' probably just make sure they are JPG files.
#'
#' @return character vector of shirt order filenames
shirtShuffler <- function() {
    rawShirts <- list.files(path = "rawShirts", pattern = "[.]jpg$",
                            full.names = TRUE)
    shirtOrder <- sample(x = seq_along(rawShirts), size = 5)
    shirtOrder <- rawShirts[shirtOrder]

    ## make sure output dir exists
    if (!dir.exists("order"))
        dir.create("order")
    
    ## prepare new filenames
    newnames <- paste0(
        1:5, c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"),
        ".jpg")
    newnames <- file.path("order", newnames)

    ## make it so
    file.copy(from = shirtOrder, to = newnames, overwrite = TRUE)
    list.files(path = "order", full.names = TRUE)
}

shirtShuffler()
