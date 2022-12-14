# =============================================================================
# Check input file
# =============================================================================

file_exists <- fs::file_exists(path = read_xlsx_path)

if (file_exists != TRUE) {

    stop(
        glue::glue(
            "ERROR: input file does not exist at user-provided path",
            "Path from `read_xlsx_path`: {read_xlsx_path}",
            .sep = "\n"
        )
    )

}
