#################
#### Cremona ####
#################

#######################################################
### Intro ###

# Lo scopo di questo progetto è quello di fare un'analisi del
# territorio cremonese usabdo le immagini Landsat.
# Il dataset è composto dalle immagini con path 193 e row 29
#relative all'arco temporale che va dal 1972 al 2020.

#######################################################
### Summary ###

# 1. Library & Working directory
# 2. Immagini
#    2.1 Estensione del crop
#    2.2 Importazione delle immagini e creazione rasterBrick
# 3. Where the magic begins
#    3.1 Rao's Q index
#    3.2 NDVI
#    3.3 PCA
#    3.4 Land Cover from NDVI
# 4. Analisi statistiche
# 5. Rappresentazione grafica e pdf

#######################################################
## 1. Library & Working directory

require(raster)
require(rgdal)
require(RStoolbox)
require(rasterdiv)
require(rasterVis)
require(ggplot2)
require(gridExtra)
require(viridis)
require(purrr)
setwd("?????")
# source("/Users/federicotossani/Asinara/spectralrao.r")

#######################################################
## 2. Images

### 2.1 Estensione del crop ###

# Per ottenre il giusto crop dell'immagine ho usato la funzione draw.extent per disegnare l'area da tagliare sul plot dell'immagine a colori naturali.
# Gli aggiustamenti finali li ho fatti modificando direttamente i singoli valori

#p84 <- plotRGB(p84t, 3, 2, 1, stretch="lin")
#drawExtent(show=TRUE, col="red")
#class      : Extent 
#xmin       : 431858.1 
#xmax       : 445713 
#ymin       : 4532960 
#ymax       : 4552802 

### estensione ###
extnew<-extent(431858.1, 445713, 4532960, 4552802)
