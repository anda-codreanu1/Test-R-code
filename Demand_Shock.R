

# Code for demand shock #

library(readxl)
library(writexl)

# Step 1 get the Leontief matrix directly from previous code
# Correct function call without the sep argument
# A_matrix <- read_xlsx("C:/Users/MarcSkovJacobsenADC/ADC/ADC Denmark MNO - Client Folders N/Novonesis/2024/Global socio-economic value of biosolutions/3. Project Execution/IO/Results/Amatrix.xlsx")
Leontief_matrix <- read_xlsx("C:/Users/MarcSkovJacobsenADC/ADC/ADC Denmark MNO - Client Folders N/Novonesis/2024/Global socio-economic value of biosolutions/3. Project Execution/IO/Results/Leontief_matrix.xlsx")
dim(Leontief_matrix)

# Ensure Leontief_matrix is a numeric matrix
Leontief_matrix <- as.matrix(Leontief_matrix)
Leontief_matrix <- apply(Leontief_matrix, 2, as.numeric)

# Step 2 get the FD shock vector
FD_Shock <- read_xlsx("C:/Users/MarcSkovJacobsenADC/ADC/ADC Denmark MNO - Client Folders N/Novonesis/2024/Global socio-economic value of biosolutions/3. Project Execution/IO/Data/Final demand shock/Final demand change.xlsx")

# Extract the names column before dropping it
names_column <- FD_Shock[[1]]  # Assuming the first column is names

# Drop the first column
FD_Shock <- FD_Shock[, -1]

# Ensure FD_Shock is a numeric vector
FD_Shock <- as.numeric(unlist(FD_Shock))

# Step 3 calculate the output change 
# Calculate the change in output (ΔX = L %*% ΔF)
output_change <- Leontief_matrix %*% FD_Shock
output_change <- as.data.frame(output_change)

# Add the names column to the output_change data frame
output_change$Names <- names_column

# Step 4 Export results
write_xlsx(output_change, "C:/Users/MarcSkovJacobsenADC/ADC/ADC Denmark MNO - Client Folders N/Novonesis/2024/Global socio-economic value of biosolutions/3. Project Execution/IO/Results/output_change.xlsx")

