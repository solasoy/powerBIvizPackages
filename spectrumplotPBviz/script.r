source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
library(ggplot2)
library(plotly)
library(jsonlite)
library(stringi)
library(dplyr)
####################################################

################### Actual code ####################
values$spectra <- stri_encode(values$spectra , "", "UTF-8")



n <- length(values$spectra)

if (n > 200) {

      n = 200
}

# Spectra plot ---------------------------------------------------

f <- list(
      family = "Calibri",
      size = 18,
      color = toRGB('black')
)

ax <- list(
      title = "Wavelength",
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
)
ay <- list(
      title = "Intensity",
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
      
)


g <- plot_ly() %>%
      layout(xaxis = ax, yaxis = ay)

for(kk in 1:n) {
      
      spectrum <- fromJSON(values$spectra[kk])
      wavelength = seq(values$wavelength_start[kk],values$wavelength_end[kk],0.5)
      
      tmp <- cbind(wavelength,spectrum)
      
      g <- g %>% add_trace(x = tmp[,1], y = tmp[,2], name = substr(values$Id[kk],1,9),
                             type = "scatter", mode = "lines")  
}


####################################################

############# Create and save widget ###############
p = ggplotly(g);
internalSaveWidget(p, 'out.html')
####################################################
