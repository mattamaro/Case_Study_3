server <- function(input, output) {
  ####DS Summary Functions####

output$scatter1 <- renderPlotly({
  ggplot(data = dsJobs, aes_string(x = input$x_data, y = input$y_data)) +
    geom_point() +
    geom_smooth(method="lm", se=F)
})

  output$summary <- renderPrint({
    df <- sd_ds$data(withSelection = TRUE) %>%
      filter(selected_ | is.na(selected_)) %>%
      mutate(selected_ = NULL)
    
    cat(nrow(df), "observation(s) selected\n\n")
    summary(df)
  })
  
  ####DS Jobs Functions####
  output$table1 <- renderDT({
    datatable(sd_ds, extensions="Scroller",
              options=list(deferRender=TRUE, scrollY=800, scroller=TRUE))}, server=FALSE)
  
  ####Interactive Map Functions####
  output$mymap <- renderLeaflet({
    leaflet(sd_jobs) %>%
      addTiles() %>%
      addCircleMarkers(
        lng = ~lng,
        lat = ~lat,
        radius = ~Income/20000, opacity = 0.2, fillOpacity = 0.2,
        popup = ~paste('<strong>Income:</strong> $', Income, '<br/>',
                       '<strong>City:</strong> ', City, '<br/>',
                       '<strong>State:</strong> ', State, '<br/>'))   %>%
      setView(lng = -100, lat = 40, zoom = 3.4)
  })
}

