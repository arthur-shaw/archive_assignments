# =============================================================================
# Check that target questionnaire exists
# =============================================================================

script_dir <- here::here("R/")
source(fs::path(script_dir, "check_qnr_params.R"))

# =============================================================================
# Collect assignments
# =============================================================================

# collect assignments from the Survey Solutions server
assignments <- get_matching_assignments(
    qnr_id = qnr_id,
    qnr_versions = qnr_versions
)

# write assignments to disk
writexl::write_xlsx(
    x = assignments,
    path = write_xlsx_path
)
