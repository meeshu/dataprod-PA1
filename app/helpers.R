# Note: percent map works with the state data set only for now

percent_map <- function(DT,var,statelist, pal, legend.title) {

  # generate vector of fill colors for map
  shades <- RColorBrewer::brewer.pal(5, pal)
  
  # constrain gradient to percents that occur between min and max
  
  DT$percents<-as.integer(cut(DT[,var], 5, include.lowest = TRUE))
  
  #Reorder the states and thus the dataframe in the given dataset according to the states input required
  #for the map function. Then extract the percents which corresponds to color code in the right
  #order and generate the individual fill colors
  names <- DT[match(map("state", plot=FALSE)$names,as.character(tolower(DT[,statelist]))),statelist]
  colorsmatched<-DT[match(names,as.character(DT[,statelist])),]$percents
  fills <- shades[colorsmatched]

  # plot choropleth map
  map("state", fill = TRUE, col = fills, 
    resolution = 0, lty = 0, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "ivory3", fill = FALSE, add = TRUE,
    lty = 1, lwd = 1, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
     inc <- (max(DT[,var]) - min(DT[,var])) / 5
 legend.text <- c(paste0(">",min(DT[,var])," & < ",min(DT[,var]) + inc),
   paste0(">",min(DT[,var]) + inc," & < ",min(DT[,var]) + 2 * inc),
    paste0("<",min(DT[,var]) + 2 * inc," & < ",min(DT[,var]) + 3 * inc),
    paste0("<",min(DT[,var]) + 3 * inc," & < ",min(DT[,var])+4*inc),
    paste0("<",max(DT[,var])))
  
  legend("bottomleft", 
  legend = legend.text, 
  fill = shades[1:5], 
  title = legend.title)
}