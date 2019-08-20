source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################

################### Actual code ####################
library(plotly)


f <- list(
      family = "Arial",
      size = 14,
      color = toRGB('black')
)

ax <- list(
      title = "peakWavelengthShift (nm)",
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
)
ay <- list(
      title = 'PercentMaxIntensity',
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
      
)

az  <- list(
      title = 'DilutionMarker (%)',
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
      
)




g <- plot_ly(values, x = ~WavelengthDelta, y = ~PercentMaxIntensity, z = ~Concentration_percent2,
             color = ~VerificationResult, colors = c('#BF382A', '#0C4B8E')) %>% 
      add_markers() %>%
      layout(scene = list(xaxis = ax,
                          yaxis = ay,
                          zaxis = az))


####################################################

############# Create and save widget ###############
p = ggplotly(g)
internalSaveWidget(p, 'out.html')
####################################################
