navbarPage("Case Study 3", id="mainJobs",
   tabPanel("DS Summary",
      fluidPage(
        bscols(selectInput('x_data','X-axis Variable',ds_cols, selected = ~company_location),
               selectInput('y_data','Y-axis Variable',ds_cols, selected = ~salary_in_usd)),
        h3("Scatter Plot"),
        plotlyOutput("scatter1"),
      ),
      h4("Summary of selected data"),
      verbatimTextOutput("summary")
            
   ),
   tabPanel("DS Jobs",
      fluidPage(
        sidebarLayout(
          sidebarPanel(
            h1("Filters:"),
            filter_slider("salary", "Salary in USD", sd_ds, column = ~salary_in_usd, step = 1000, width = "100%"),
            filter_select("country", "Country", sd_ds, group = sort(~company_location), multiple = T),
            filter_select("xp_lvl", "Experience Level", sd_ds, group = sort(~experience_level), multiple = T),
            filter_select("job", "Job Title", sd_ds, group = sort(~job_title), multiple = T),
            filter_select("type", "Employment Type", sd_ds, group = sort(~employment_type), multiple = T),
          ),
          mainPanel(
            DTOutput("table1")
          ),
        )
      )
   ),
   tabPanel("Interactive map",         
      fluidPage(
        sidebarLayout(
          sidebarPanel(
            h1("Filters:"),
            filter_slider("income", "Income", sd_jobs, column=~Income, step = 1000),
            filter_select("state", "State", sd_jobs, group = ~State, multiple = T),
            filter_select("city", "City", sd_jobs, group = ~City, multiple = T),
            filter_select("zip", "Zip", sd_jobs, group = ~Zip, multiple = T),
          ),
          
          mainPanel(
            leafletOutput('mymap', height = 1000)
          )
        )
      )
   )
)