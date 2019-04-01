manuscript <- function(...) {

    scholarly_metadata = find_resource(format, 'scholarly-metadata.lua')
    author_info = find_resource(format, 'author-info-blocks.lua')

    word_document_format(
        "manuscript",
        pandoc_args = c(
            "--lua-filter", scholarly_metadata,
            "--lua-filter", author_info
        ),
        ...
    )
}
