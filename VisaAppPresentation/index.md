---
title       : Immigrant Visa Heatmap
subtitle    : US H1B Visa statistics between October 1, 2014 through March 30, 2015
author      : Meeshu Agnihotri
job         : 
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

      

---
## Meet Jill


```
## [1] "Hi! I am Jill. I am feeling a little shy to see you guys face to face!"
```

### Jill's problem

Jill helps drafts the migration policies. For this, she goes through tons of excel **(HORROR!)** spreadsheets- cutting, slicing, dicing, deep diving, creating pivot tables, powerBI-  to create detailed annual reports. She then makes informed decision on top of them which affect the lives of millions of people worldwide!

Phew! Sounds heavy huh? (maybe not- as you are doing the Data Science course)

--- 
## Jill wishes

that analysing tons of data was

### EASY
### INTUITIVE
### and not PLAIN and UGLY

And most of all she wishes that creating reports was 

## FUN
(no it's not a myth!)

--- 
## Meet the PROTOTYPE

The US Immigrant visa heatmap is a small PROTOTYPE that shows how intuitive data manipulation and visualization could be to observe VISA application trends.

The app waits for you to choose what information would you like to view on the US map and then generates a heatmap. The table provides the much needed quantitative figures.

The heatmap is generated by the 'helpers.R' file which contains the 'percent_map' function. 


```r
percent_map(DT=visabystate,var = data,statelist='employer_state', pal = palname,legend.title=legtitle)
```
  The functions needs a dataframe which has variables that are to be plotted on the map. The names of the state are passed as well along with the palette code from RBrewer and the legend title.

---
## Lastly

The small prototype can be extended to include all the necessary charts and visualization and a print to pdf feature. But for now that is all!

Thank You.

---






