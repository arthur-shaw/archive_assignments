# =============================================================================
# Set connection details
# =============================================================================

susoapi::set_credentials(
    server = server,
    workspace = workspace,
    user = user,
    password = password
)

# =============================================================================
# Check credentials
# =============================================================================

# check whether correct: TRUE or FALSE
credentials_ok <- susoapi::check_credentials(verbose = TRUE)

# issue error if not OK
if (credentials_ok != TRUE) {
    stop(
        glue::glue(
            "ERROR: Server connection details invalid.",
            "Please confirm that:",
            "(1) The server URL is correct.",
            "(2) The user is an admin or API user.",
            "(3) The user login and password are correct.",
            .sep = "\n"
        )
    )
}
