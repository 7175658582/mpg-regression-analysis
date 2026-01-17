# mpg-regression-analysis

## Project Overview
This project analyzes the Auto MPG dataset to predict vehicle fuel efficiency (miles per gallon) using simple and multiple linear regression models.

## Objective
- Predict MPG using car features such as horsepower, weight, acceleration, and cylinders
- Compare simple vs multiple linear regression models
- Identify the most important predictors of fuel efficiency

## Dataset
- Source: Auto MPG dataset
- Total records: 398 vehicles
- Target variable: mpg
- Key predictors:
  - horsepower
  - weight
  - acceleration
  - cylinders
  - origin

## Data Preprocessing
- Loaded data using `readr::read_csv()`
- Converted horsepower values containing "?" to NA
- Removed missing values using `na.omit()`
- Converted relevant columns to numeric
- Split data into training and testing sets
- Exported cleaned dataset for visualization

## Models Used

### Simple Linear Regression
- mpg ~ horsepower (Best single predictor, R² = 0.8577)
- mpg ~ weight
- mpg ~ cylinders

### Multiple Linear Regression
Best performing model: mpg ~ horsepower + weight + acceleration

- R² = 0.8975
- Adjusted R² = 0.8547

## Residual Analysis
- Residual plots show random distribution
- Histogram of residuals is approximately normal
- Model assumptions are reasonably satisfied

## Conclusion
- Multiple linear regression outperforms simple regression
- Horsepower and weight are the most influential predictors
- The final model provides a good balance between accuracy and simplicity

## Tools & Technologies
- R
- Tableau
- Linear Regression
- Data Visualization

## Author
Gurpreet Kaur  
Saint Peter’s University  

