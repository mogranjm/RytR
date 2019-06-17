#' A Helper function used for locating template files.
#'
#' Locates the custom .tex template file in the rmarkdown/templates directory
#' @param template Name of target document template
#' @param file Name of the target tex template for this document
find_resource <- function(template, file = 'template.tex'){
    res <- system.file(
        "rmarkdown", "templates", template, "resources", file, package = "papeRs"
    )
    if(res == "") stop(
        "Couldn't locate ", template, "/resources/", file, call. = FALSE
    )
    res
}


# Including custom latex and docx style template
#' A Helper function to create a custom word format, based on word_document.
#'
#' Locates the custom .tex template file in the rmarkdown/templates directory
#' @param template_name Name of target document template
#' @param docx_template Name of the target docx template for this document
#' @param pandoc_args Arguments passed to Pandoc
word_document_format <- function(
    template_name,
    docx_template = find_resource(template_name, 'style-reference.docx'),
    pandoc_args = c(
        "--lua-filter", find_resource(template_name, 'scholarly-metadata.lua'),
        "--lua-filter", find_resource(template_name, 'author-info-blocks.lua')
    ),
    ...
){
    fmt <- rmarkdown::word_document(
        ...,
        reference_docx = docx_template,
        pandoc_args = pandoc_args
    )
    fmt$inherits <- "word_document"
    fmt
}
