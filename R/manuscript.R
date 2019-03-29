manuscript <- function(toc=TRUE) {
    
    # get locations of resource files
    docx_template <- 'templates/style-reference.docx'
   
    rmarkdown::word_document(
        reference_docx = docx_template,
        toc = toc
    )
}