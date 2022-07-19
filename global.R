library(shiny)
library(leaflet)
library(crosstalk)
library(DT)
library(dplyr)
library(plotly)

allData <- "https://raw.githubusercontent.com/mattamaro/Case_Study_3/main/us_income.csv"
allJobs <- read.csv(allData)

dsData <- "https://raw.githubusercontent.com/mattamaro/Case_Study_3/main/ds_income.csv"
dsJobs <- read.csv(dsData)

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


