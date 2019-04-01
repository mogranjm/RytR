# Helper function to locate a template file in the RytR package
# Searches in RytR/inst/rmarkdown/templates/*Template Name*/resources/ for the specified template file
find_resource <- function(template, file = 'template.tex'){
    res <- system.file(
        "rmarkdown", "templates", template, "resources", file, package = "RytR"
    )
    if(res == "") stop(
        "Couldn't locate ", template, "/resources/", file, call. = FALSE
    )
    res
}


# Helper function to create a custom word format, based on word_document
# Including custom latex and docx style template
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
        reference_docx = docx_template
    )
    fmt$inherits <- "word_document"
    fmt
}
