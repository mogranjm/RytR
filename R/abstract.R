#' Knit R Markdown to MS Word Manuscript
#'
#' Render Conference Abstract as a .docx using the custom .tex file and .lua filters
#' @param ... Arguments passed to \code{rmarkdown::\link{word_document_format}()}.
#' @export
#' @example
#' ---
#' # In a YAML Block
#' output: papeRs::manuscript
#' ---
abstract <- function(...) {
    word_document_format(template_name = 'abstract', ...)
}
