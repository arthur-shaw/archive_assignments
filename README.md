
<!-- README.md is generated from README.Rmd. Please edit that file -->

# archive_assignments

<!-- badges: start -->
<!-- badges: end -->

## Installation

Before running this program for the first time, (re)install the
following software:

-   [R](#r)
-   [RTools](#rtools)
-   [RStudio](#rstudio)

Even if these software packages are already installed, it is necessary
to reinstall them in order to have the latest version of these tools for
this program to work successfully.

Please read below about how to install these programs.

### R

-   Follow this [link](https://cran.r-project.org/)
-   Click on the appropriate link for your operating system
-   Click on `base`
-   Download and install (e.g.,
    [this](https://cran.r-project.org/bin/windows/base/R-4.1.1-win.exe)
    for Windows)

### RTools

Required for the Windows operating system.

-   Follow this [link](https://cran.r-project.org/)
-   Click on `Windows`
-   Click on `RTools`
-   Download and install (e.g.,
    [this](https://cran.r-project.org/bin/windows/Rtools/rtools40v2-x86_64.exe)
    for a 64bit system)

This program allows R to compile C++ scripts used by certain packages
(e.g., `{dplyr}`).

### RStudio

-   Follow this [link](https://www.rstudio.com/products/rstudio/)
-   Select RStudio Desktop then Open Source Edition
-   Click on the appropriate link for your operating system
-   Download and install (e.g.,
    [this](https://www.rstudio.com/products/rstudio/download/#download)
    for Windows)

### This program

-   Get a copy of this repository
    -   Navigate to [this
        repository](https://github.com/arthur-shaw/uhis_auto_sort)
    -   Click on the `Code` button
    -   Click on `Download ZIP`
    -   Download to the desired folder on your machine
-   Unpack the zip file

## Usage

### Provide program parameters

This involves:

1.  Providing details for connecting to the Survey Solutions
2.  Specifying how the program should behave

#### How to reach Survey Solutions server

``` r
# -----------------------------------------------------------------------------
# How to reach your Survey Solutions server
# -----------------------------------------------------------------------------

server      <- ""   # Server URL.
workspace   <- ""   # Workspace name. Note: use the name that is an ID rather than the display name.
user        <- ""   # User name. Note: user must be either admin or API user.
password    <- ""   # Password of the user indicated above.
```

#### Which questionnaire’s assignments

Each questionnaire has an ID and a version number. To find these
details, there are two methods:

1.  For R users, fetch the questionnaire list with
    `susoapi::get_questionnaires()` and extract these IDs from the
    questionnaire data frame.
2.  For non-R users, navigate to `Survey Setup` \> `Questinnaires`,
    click on a questionnaire, and note its ID as the last part of the
    URL

Here is how to target desired version(s) of the questionnaire:

-   **All versions.** Leave `qnr_versions <- NULL`
-   **Specific versions.** Replace `NULL` with a vector of one or more
    numeric values (e.g., `c(1)` for version 1, `c(1, 2)` for versions 1
    and 2, etc.)

``` r
# -----------------------------------------------------------------------------
# Which questionnaire's assignments
# -----------------------------------------------------------------------------

qnr_id          <- ""   #
qnr_versions    <- NULL   #
```

#### Where to write all assignments

``` r
# -----------------------------------------------------------------------------
# Where to write all assignments
# -----------------------------------------------------------------------------

write_xlsx_path <- ""
```

Provide in `write_xlsx_path` the full file path–directory and file
name–where assignments should be written.

Note:

-   The path must use slashes instead of backslashes (e.g.,
    `C:/my/path/my_file.xlsx` instead of `C:\my\path\my_file.xlsx`)
-   The file name must include an `xlsx` extension, since outputs will
    be saved in an Excel file.

#### Where to read assignments to archive

``` r
# -----------------------------------------------------------------------------
# Where to read assignments to archive
# -----------------------------------------------------------------------------

read_xlsx_path  <- ""
sheet_name      <- ""
```

Provide in `read_xlsx_path` the full path–directory and file name–where
the assignments to be archived are found. See the notes above about the
file path and file extension.

Provide in `sheet_name` the name of the sheet that contains the
assignments to archive. This might be Excel’s default sheet name
`Sheet1` or a user-provided name.

### Using the programs

This project consists of three scripts that correspond to steps in the
workflow:

1.  `0_setup.R`. Initial setup.
2.  `1_collect_assignments.R`. Collect assignments from the server and
    write them to disk.
3.  `2_archive_assignments.R`. Read assignments to archive from disk and
    archive them on the server.

#### `0_setup.R`

Before running any program, provide the parameters for:

-   Connecting to the Survey Solutions server
-   Describing the questionnaire whose assignments are of interest
-   Specifying where to write the assignments to disk
-   Specifying where the assignments to reject can be found

Before running either `1_collect_assignments.R` or
`2_archive_assignments.R`, run `0_setup.R` first. Doing so will ensure
that your R session has loaded all of the parameters described above.

#### `1_collect_assignments.R`

Run this to collect all assignments of target questionnaires and write
them to disk for further manipulation.

#### `2_archive_assignments.R`

Before running this script, create an Excel file that contains all
assignments to be archived and that contains a column `Id` with the
assignment ID.

Once this script is run, the server will archive the desired
assignments.
