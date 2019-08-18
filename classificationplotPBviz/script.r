source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################

################### Actual code ####################
library(plotly)
library(ggplot2)
library(htmlwidgets)

#library(stringi)

# values$Scores1 <- stri_encode(values$Scores1 , "", "UTF-8")
# values$Scores2 <- stri_encode(values$Scores1 , "", "UTF-8")

f <- list(
      family = "Calibri",
      size = 18,
      color = toRGB('black')
)

ax <- list(
      title = "Scores1",
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
)
ay <- list(
      title = "Scores2",
      showline = TRUE,
      zeroline = FALSE,
      titlefont = f,
      gridwidth = 2,
      linewidth = 2
      
)

xx <- c(8.912903225806452e+04,1.199774266365689e+04) #c(values$x1, values$x2) #
yy <- c(6.774193548387102e+02, 3.393905191873589e+04) #c(values$y1, values$y2) #

m<- length(as.numeric(values$Scores1))

if (m > 200) {
      
      m = 200
}

legend <- unlist(lapply(values$Id, function(x){
      return(substr(x,1,9))
}))

tmp <- cbind(as.numeric(values$Scores1),as.numeric(values$Scores2))
tmp <-tmp[1:m,]

if (!is.null(dim(tmp))){

g <- plot_ly(x=tmp[,1],y=tmp[,2], 
               name = legend[1:m],type = 'scatter', mode = 'markers',
               marker = list(size=12), inherit = F) %>%
      layout(xaxis = ax, yaxis = ay)

} else {
      
      g <- plot_ly(x=tmp[1],y=tmp[2], 
                   name = legend[1:m],type = 'scatter', mode = 'markers',
                   marker = list(size=12), inherit = F) %>%
            layout(xaxis = ax, yaxis = ay)
      
      
}


boundary <- approx(xx,yy,n=m)

g <- add_trace(g, x=boundary$x, y=boundary$y,
             type="scatter", mode="lines", name='Boundary',
             line = list(color = 'black', width = 2,dash = 'dash'),
             inherit = F)






####################################################

############# Create and save widget ###############
p = ggplotly(g)
internalSaveWidget(p, 'out.html')
####################################################
