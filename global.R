library(shiny)
library(leaflet)
library(crosstalk)
library(DT)
library(dplyr)
library(plotly)

allJobs <- read.csv("C:/Users/matta/OneDrive/DS501/Case Study 3/CS3_Matheus_Amaro/us_income.csv")
dsJobs <- read.csv("C:/Users/matta/OneDrive/DS501/Case Study 3/CS3_Matheus_Amaro/ds_income.csv")

cleanJobs <- allJobs %>% 
  select(State = State_ab,
         City = City,
         Zip = Zip_Code,
         Area_Code = Area_Code,
         lng = Lon,
         lat = Lat,
         Income = Mean,
         Weight = sum_w)

# sd_jobs <- SharedData$new(cleanJobs[sample(nrow(cleanJobs),100),])
sd_jobs <- SharedData$new(cleanJobs)

sd_ds <- SharedData$new(dsJobs)
ds_cols <- names(dsJobs)


