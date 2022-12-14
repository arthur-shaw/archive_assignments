#' Get matching assignments
#' 
#' Specify questionnaire ID and, optionally, one or more version
#' 
#' @param qnr_id Character. Questionnaire ID as GUID
#' @param qnr_versions Numeric vector. Questionnaire versions(s)
#' @inheritParams susoflows::download_matching
#' 
#' @importFrom dplyr case_when
#' @importFrom purrr map_dfr
#' @importFrom susoapi get_assignments
get_matching_assignments <- function(
    qnr_id,
    qnr_versions,
    server = Sys.getenv("SUSO_SERVER"),
    workspace = Sys.getenv("SUSO_WORKSPACE"),
    user = Sys.getenv("SUSO_USER"),
    password = Sys.getenv("SUSO_PASSWORD")    
) {

    # convert `qnr_versions` into format expected by `susoapi::get_assignments()`
    # NULL -> ""
    # numeric vector -> character vector
    qnr_versions <- dplyr::case_when(
        is.null(qnr_versions) ~ "",
        is.numeric(qnr_versions) ~ as.character(qnr_versions)
    )

    # collect assignments for given questionnaire ID and, optionally, version(s)
    assignments <- purrr::map_dfr(
        .x = qnr_versions,
        .f = ~ susoapi::get_assignments(
            qnr_id = qnr_id,
            qnr_version = .x
        )
    )
    
    return(assignments)

}
