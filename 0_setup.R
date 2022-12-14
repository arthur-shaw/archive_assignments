# =============================================================================
# Provide parameters
# =============================================================================

# -----------------------------------------------------------------------------
# How to reach your Survey Solutions server
# -----------------------------------------------------------------------------

server 		    <- "" 	# Server URL.
workspace       <- ""   # Workspace name. Note: use the name that is an ID rather than the display name.
user 		    <- "" 	# User name. Note: user must be either admin or API user.
password 	    <- "" 	# Password of the user indicated above.

# -----------------------------------------------------------------------------
# Which questionnaire's assignments
# -----------------------------------------------------------------------------

qnr_id          <- ""   #
qnr_versions    <- NULL   #

# -----------------------------------------------------------------------------
# Where to write all assignments
# -----------------------------------------------------------------------------

write_xlsx_path <- ""

# -----------------------------------------------------------------------------
# Where to read assignments to archive
# -----------------------------------------------------------------------------

read_xlsx_path  <- ""
sheet_name      <- ""

# =============================================================================
# Set and check connection details
# =============================================================================

script_dir <- here::here("R/")
source(fs::path(script_dir, "setup_connection.R"))
