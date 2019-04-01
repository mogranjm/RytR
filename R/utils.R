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
    format,
    docx_template = find_resource(format, 'style-reference.docx'),
    ...
){
    fmt <- rmarkdown::word_document(
        ...,
        reference_docx = docx_template
    )
    fmt$inherits <- "word_document"
    fmt
}
