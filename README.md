# TSNEVizTool
Benchmark tool used to visualize the results of different runs of the Rtsne function on a generated FCS file. This tool is meant to help the user choose parameters for the t-SNE depending on his goal.
 
	
## Requirements
  * software: R(Version 3.4.3 to 3.5), Rstudio(optional)
  * R packages: shiny, shinydashboard, ggcyto, flowCore, gtools, Biobase
  
## Quick installation guide

  1. Run the following command in R/RStudio:
```
install.packages(c("shiny", "shinydashboard", "gtools", "devtools"))
source("https://bioconductor.org/biocLite.R")
biocLite("Biobase", "flowCore", "ggcyto")
```
  >You may be asked to reload your environment, if so, accept.
  
  2. Run the next commands:
```
library("devtools")
install_github("isambens/tsneviztool")
```

  
## Launching the shiny application

  1. Run the following commands in R/RStudio:
```
library("TSNEVizTool")
TSNE.Viz.run()
```