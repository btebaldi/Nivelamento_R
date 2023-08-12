
library(openxlsx)
# Create a blank workbook
# OUT <- createWorkbook()
OUT <- openxlsx::loadWorkbook(file = "C:\\Users\\bruno.tebaldi\\Downloads\\Historico\\2022-08-23\\tot.xlsx")

# Add some sheets to the workbook
addWorksheet(OUT, "Sheet 1 Name")
addWorksheet(OUT, "Sheet 2 Name")

# Write the data to the sheets
writeData(OUT, sheet = "Sheet 1 Name", x = CO2)
writeData(OUT, sheet = "Sheet 2 Name", x = Titanic)

# Reorder worksheets
worksheetOrder(OUT) <- c(2,1,3)

# Export the file
saveWorkbook(OUT, "C:\\Users\\bruno.tebaldi\\Downloads\\Historico\\2022-08-23\\My output file.xlsx")


