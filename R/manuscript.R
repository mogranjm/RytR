manuscript <- function(...) {

    scholarly_metadata = find_resource(format, 'scholarly-metadata.lua')
    author_info = find_resource(format, 'author-info-blocks.lua')

    word_document_format(
        "manuscript",
        # pandoc_args = c(
        #     paste0("--lua-filter=", scholarly_metadata),
        #     paste0("--lua-filter=", author_info)
        # ),
        ...
    )
}
