#' Choose my shirts
#'
#' Choose which shirt I will wear each weekday
#'
#' Raw shirt patterns are found in the directory given by
#' \code{rawShirts}. This function randomly selects 5 of the patterns,
#' and copies files names for each weekday into the directory given by
#' \code{output}. Just open the image for each day of the week to
#' find your shirt surprise.
#'
#' You can have as many shirts as you like in \file{rawShirts}, but
#' you should probably have at least five or the sample will fail.
#'
#' This function also assumes your shirt images are JPG files, so
#' probably just make sure they are JPG files.
#'
#' @param rawShirts file path to raw shirt files
#' @param output file path for output files
#'
#' @return character vector of shirt order filenames
#'
#' @export
shuffleShirts <- function(rawShirts =
                              system.file("rawShirts",
                                          package = "shirtshufflr"),
                          output = file.path(tempdir(),
                                             "shuffledShirts")) {
    
    rawShirts <- list.files(
        path = rawShirts,
        pattern = "[.]jpg$",
        full.names = TRUE)

    shirtOrder <- sample(x = seq_along(rawShirts), size = 5)
    shirtOrder <- rawShirts[shirtOrder]

    ## make sure output dir exists
    if (!dir.exists(output))
        dir.create(path = output, recursive = TRUE)
    
    ## prepare new filenames
    newnames <- paste0(
        1:5, c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"),
        ".jpg")
    newnames <- file.path(output, newnames)

    ## make it so
    file.copy(from = shirtOrder, to = newnames, overwrite = TRUE)
    list.files(path = output, full.names = TRUE)

}
