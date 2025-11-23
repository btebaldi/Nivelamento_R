#' ---
#' title: "R Download de Séries Temporais do Banco Central do Brasil (BCB) via API"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---


# User defined function ---------------------------------------------------

# Function to download a file from a URL and unzip its contents
#
# Arguments:
#   url: The direct URL to the zip file (e.g., "https://example.com/data.zip").
#   dest_dir: The path to the directory where the contents should be extracted.
#
# Returns:
#   A boolean value (TRUE if successful, FALSE otherwise).
download_and_unzip <- function(url, dest_dir, zipFileName = NA, cleanUp = FALSE) {
  
  # For debugging only
  # browser()
  
  # Create a temporary file path for the downloaded zip file. Using tempfile()
  # ensures it's cleaned up when the R session ends (unless kept).
  if(is.na(zipFileName)){
    temp_zip_file <- tempfile(fileext = ".zip")
  } else {
    temp_zip_file <- zipFileName
  }
  
  # Ensure the destination directory exists. 'recursive = TRUE' creates parent
  # directories if needed.
  if (!dir.exists(dest_dir)) {
    message(paste("Creating destination directory:", dest_dir))
    dir.create(dest_dir, recursive = TRUE)
  }
  
  # Download the File
  message(paste("Downloading file from:", url))
  
  # Use 'curl' method for robustness, especially with HTTPS.
  download_status <- tryCatch({
    download.file(url,
                  destfile = temp_zip_file,
                  # method = "curl",
                  mode = "wb",
                  quiet = FALSE)
    
    # Return TRUE if no error occurred during download
    TRUE
  }, error = function(e) {
    warning(paste("Download failed:", e$message))
    
    # Return FALSE on error
    FALSE
  })
  
  # If download was NOT successful it returns FALSE and exits the function
  if (!download_status) {
    return(FALSE)
  }
  
  # Unzip the File
  message(paste("Unzipping contents to:", dest_dir))
  
  unzip_status <- tryCatch({
    # The 'exdir' argument specifies the directory for extraction
    unzip(temp_zip_file, exdir = dest_dir)
    
    # Return TRUE if no error occurred during unzip
    TRUE 
  }, error = function(e) {
    warning(paste("Unzip failed:", e$message))
    
    # Return FALSE on error
    FALSE
  })
  
  # Cleanup (Optional): Remove the temporary downloaded zip file
  if (file.exists(temp_zip_file) & cleanUp) {
    file.remove(temp_zip_file)
    message("Temporary zip file removed.")
  }
  
  if (unzip_status) {
    message("Download and extraction complete successfully.")
    return(TRUE)
  } else {
    message("Extraction failed.")
    return(FALSE)
  }
}


# Example Usage -----------------------------------------------------------

# Define the URL of the file to download
EXAMPLE_URL <- "https://www.spatial-econometrics.com/html/etoolbox.zip"

# Define the local directory where the contents will be extracted
TARGET_DIRECTORY <- file.path("~", "Downloaded_R_Data", "My Directory")

# Execute the function
success <- download_and_unzip(url = EXAMPLE_URL, dest_dir = TARGET_DIRECTORY)

if (success) {
  # List files in the newly created directory to confirm extraction
  message("\n--- Extracted Files ---")
  print(list.files(TARGET_DIRECTORY, recursive = TRUE))
} else {
  message("\n--- Operation Failed ---")
}
