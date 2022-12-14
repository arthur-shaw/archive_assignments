# =============================================================================
# Check that input file exists
# =============================================================================

script_dir <- here::here("R/")
source(fs::path(script_dir, "check_input_file_exists.R"))

# =============================================================================
# Archive assignments
# =============================================================================

# read assignments
assignments_to_archive <- readxl::read_excel(
    path = read_xlsx_path,
    sheet = sheet_name
)

# extract ID of assignments to archive
assignment_ids_to_archive <- assignments_to_archive$Id

# archive assignments
purrr::walk(
    .x = assignment_ids_to_archive,
    .f = ~ susoapi::archive_assignment(id = .x)
)
