# Install if not already installed
install.packages("tidyverse")
install.packages("readr")

# Load packages
library(tidyverse)
auto <- read_csv("auto-mpg.csv")
# View structure
str(auto)

# Summary statistics
summary(auto)

# Check for missing values
colSums(is.na(auto))

# Convert horsepower to numeric (may have "?" or characters)
auto$horsepower <- as.numeric(auto$horsepower)

# Remove rows with missing values (optional depending on strategy)
auto <- na.omit(auto)
# File used in Tableau for Visualisation 
write_csv(auto, "cleaned_auto_mpg.csv")

#Linear regression models
library(readr)

auto <- read_csv("auto-mpg.csv")     # replace with file.choose() if needed
auto_300 <- auto[1:300, ]            # use only first 300 rows

summary(auto_300)
auto_300 <- na.omit(auto_300)        # remove rows with NA

model_simple <- lm(mpg ~ horsepower, data = auto_300)
summary(model_simple)
model_simple1 <- lm(mpg ~ weight, data = auto_300)
summary(model_simple1)
model_simple2 <- lm(mpg ~ cylinder, data = auto_300)
summary(model_simple2)

model_multiple <- lm(mpg ~ horsepower + weight + acceleration, data = auto_300)
summary(model_multiple)
model_multiple2 <- lm(mpg ~ horsepower + origin + acceleration, data = auto_300)
summary(model_multiple2)
model_multiple3 <- lm(mpg ~ horsepower + cylinder + acceleration, data = auto_300)
summary(model_multiple3)



 #model1

    summary_simple <- summary(model_simple)
   # Extract simple regression metrics
   r2_simple <- summary_simple$r.squared
 adj_r2_simple <- summary_simple$adj.r.squared
 coeffs_simple <- coef(model_simple)

   # Build regression equation string
   eq_simple <- paste0("mpg = ", round(coeffs_simple[1], 3),
                        +                     " + ", round(coeffs_simple[2], 3), " * horsepower")

   
   summary_multiple <- summary(model_multiple)

   # Extract multiple regression metrics
   r2_multiple <- summary_multiple$r.squared
 adj_r2_multiple <- summary_multiple$adj.r.squared
 coeffs_multiple <- coef(model_multiple)

   # Build regression equation string
   eq_multiple <- paste0("mpg = ", round(coeffs_multiple[1], 3),
                                                 " + ", round(coeffs_multiple[2], 3), " * horsepower",
                                                 " + ", round(coeffs_multiple[3], 3), " * weight",
                                                " + ", round(coeffs_multiple[4], 3), " * acceleration")

   #  Log results in a dataframe
   regression_log <- data.frame(
     Model = c("Simple Linear Regression", "Multiple Linear Regression"),
       R_squared = c(r2_simple, r2_multiple),
        Adjusted_R_squared = c(adj_r2_simple, adj_r2_multiple),
          Equation = c(eq_simple, eq_multiple)
    

   # Print the log
      print(regression_log)
      
   #model2
      summary_simple1 <- summary(model_simple1)
      # Extract simple regression metrics
       r2_simple1 <- summary_simple1$r.squared
       adj_r2_simple1 <- summary_simple1$adj.r.squared
       coeffs_simple1 <- coef(model_simple1)
      
         # Build regression equation string
         eq_simple1 <- paste0("mpg = ", round(coeffs_simple1[1], 3),
                                                    " + ", round(coeffs_simple1[2], 3), " * weight")
      
         
         summary_multiple2 <- summary(model_multiple2)
      
         # Extract multiple regression metrics
         r2_multiple2 <- summary_multiple2$r.squared
       adj_r2_multiple2 <- summary_multiple2$adj.r.squared
       coeffs_multiple2 <- coef(model_multiple2)
      
         # Build regression equation string
         eq_multiple2 <- paste0("mpg = ", round(coeffs_multiple2[1], 3),
                                                        " + ", round(coeffs_multiple2[2], 3), " * horsepower",
                                                        " + ", round(coeffs_multiple2[3], 3), " * origin",
                                                          " + ", round(coeffs_multiple2[4], 3), " * acceleration")
       
       #  Log results in a dataframe
        regression_log2 <- data.frame(
               Model = c("Simple Linear Regression", "Multiple Linear Regression"),
               R_squared = c(r2_simple1, r2_multiple2),
               Adjusted_R_squared = c(adj_r2_simple1, adj_r2_multiple2),
               Equation = c(eq_simple1, eq_multiple2)
          
      
         # Print the log
         print(regression_log2)
         
        
          
            #model3
            
         summary_simple2 <- summary(model_simple2)
         
            # Extract simple regression metrics
            r2_simple2 <- summary_simple2$r.squared
          adj_r2_simple2 <- summary_simple2$adj.r.squared
          coeffs_simple2 <- coef(model_simple2)
          
            # Build regression equation string
            eq_simple2 <- paste0("mpg = ", round(coeffs_simple2[1], 3),
                                                       " + ", round(coeffs_simple2[2], 3), " * cylinder")
          
            
            summary_multiple3 <- summary(model_multiple3)
          
            # Extract multiple regression metrics
            r2_multiple3 <- summary_multiple3$r.squared
          adj_r2_multiple3 <- summary_multiple3$adj.r.squared
          coeffs_multiple3 <- coef(model_multiple3)
          
            # Build regression equation string
            eq_multiple3 <- paste0("mpg = ", round(coeffs_multiple3[1], 3),
                                                           " + ", round(coeffs_multiple3[2], 3), " * horsepower",
                                                           " + ", round(coeffs_multiple3[3], 3), " * cylinder",
                                                           " + ", round(coeffs_multiple3[4], 3), " * acceleration")
         
            # Step 5: Log results in a dataframe
            regression_log3 <- data.frame(
                  Model = c("Simple Linear Regression", "Multiple Linear Regression"),
                  R_squared = c(r2_simple2, r2_multiple3),
                  Adjusted_R_squared = c(adj_r2_simple2, adj_r2_multiple3),
                 Equation = c(eq_simple2, eq_multiple3)
             
         
            # Print the log
           print(regression_log3)
           
           #residual plot for 98 remaining
           
           auto$weight <- as.numeric(auto$weight)
           auto$acceleration <- as.numeric(auto$acceleration)
           
           # Replace '?' with NA before converting
           
             auto$horsepower[auto$horsepower == "?"] <- NA
             auto$horsepower <- as.numeric(auto$horsepower)
             
             # Drop rows with NA
              auto <- na.omit(auto)
              
                train_data <- auto[1:300, ]
              test_data <- auto[301:nrow(auto), ]
              
                model_best <- lm(mpg ~ horsepower + weight + acceleration, data = train_data)
              predicted_mpg <- predict(model_best, newdata = test_data)
              
                actual_mpg <- test_data$mpg
              
                # Residuals (errors)
                residuals <- actual_mpg - predicted_mpg
              # Residual plot: predicted mpg vs residuals
                plot(predicted_mpg, residuals,
                      +      main = "Residual Plot",
                      +      xlab = "Predicted MPG",
                      +      ylab = "Residuals",
                      +      pch = 19, col = "blue")
              abline(h = 0, col = "red", lty = 2)
              
                # Histogram to check normality of residuals
                hist(residuals,
                      +      main = "Histogram of Residuals",
                      +      xlab = "Residuals",
                      +      col = "lightblue",
                      +      border = "black")
             

