# =============================================================================
# Define funciton to check questionnaire exists
# =============================================================================

#' Check whether questionnaire exists
#' 
#' Specify questionnaire ID and, optionally, version(s)
#' 
#' @param qnr_id Character. Questionnaire ID as GUID
#' @param qnr_versions Numeric vector. Questionnaire versions(s)
#' @inheritParams susoflows::download_matching
#' 
#' @importFrom susoapi get_questionnaires
#' @importFrom dplyr filter
#' 
#' @return TRUE/FALSE depending on whether any matching questionnaires found
qnr_exists <- function(
    qnr_id,
    qnr_versions = NULL,
    server = Sys.getenv("SUSO_SERVER"),
    workspace = Sys.getenv("SUSO_WORKSPACE"),
    user = Sys.getenv("SUSO_USER"),
    password = Sys.getenv("SUSO_PASSWORD")
) {

    # fetch questionnaires
    qnrs <- susoapi::get_questionnaires()

    # filter to questionnaires with matching ID and, potentially, versions
    if (qnr_versions == NULL) {
        matching_qnrs <- dplyr::filter(qnrs, questionnaireId == qnr_id)
    } else if (qnr_versions != NULL) {
        matching_qnrs <- dplyr::filter(qnrs, questionnaireId == qnr_id, version %in% qnr_versions)
    }

    exists <- (nrow(matching_qnrs) >= 1)

    return(exists)

}

# =============================================================================
# Check that target questionnaire exists
# =============================================================================

target_qnr_exists <- qnr_exists(qnr_id = qnr_id, qnr_versions = qnr_versions)

if (target_qnr_exists != TRUE) {

    qnrs_found <- susoapi::get_questionnaires()

    dplyr::select(qnrs_found, title, questionnaireId, version)

    stop(
        glue::glue(
            "ERROR: no matching questionnaires found.",
            "See above the questionnaires found in the target workspace.",
            .sep = "\n"
        )
    )

}
