#################
#### Cremona ####
#################

#######################################################
### Intro ###

# Lo scopo di questo progetto è quello di fare un'analisi del
# territorio cremonese usando le immagini Landsat.
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
setwd("C:/Federico_T/Dati_Landsat")
# source("C:/Federico_T/Dati_Landsat/spectralrao.r")

#######################################################
## 2. Images

### 2.1 Estensione del crop ###

# Per ottenre il giusto crop dell'immagine ho usato la funzione draw.extent per disegnare l'area da tagliare sul plot dell'immagine a colori naturali.
# Gli aggiustamenti finali li ho fatti modificando direttamente i singoli valori

#p84 <- plotRGB(p84t, 3, 2, 1, stretch="lin")
#drawExtent(show=TRUE, col="red")
# class      : Extent 
# xmin       : 571391.8 
# xmax       : 585388.2 
# ymin       : 4990448 
# ymax       : 5005740 

### estensione ###
extnew<-extent(571391.8, 585388.2, 4990448, 5005740)

# Import immagini CR Landsat 1

list72<-list.files(pattern="_72")
p72t<-lapply(list72, brick)
#p72c<- map(p72t, crop, extnew)
p72<-stack(p72c)
p72 <- plotRGB(p72s, 3, 2, 1, stretch="lin")

writeRaster(p72, filename="CR_p208r29_1972.grd", format="raster")

# Import immagini CR Landsat 2

list75<-list.files(pattern="_75")
p75t<-lapply(list75, brick)
p75s<-stack(p75t)
p75<- map(p75s, crop, extnew)
writeRaster(p75, filename="CR_p208r29_1975.grd", format="raster")

list79<-list.files(pattern="_79")
p79t<-lapply(list79, brick)
p79<- map(p79t, crop, extnew)
writeRaster(p79, filename="CR_p208r29_1979.grd", format="raster")

# Import immagini CR Landsat 4

list88<-list.files(pattern="_88")
p88t<-lapply(list88, brick)
#p72 <- plotRGB(p72t, 3, 2, 1, stretch="lin")
#p88<- map(p88t, crop, extnew)
writeRaster(p88, filename="CR_p193r29_1988.grd", format="raster")

# Import immagini CR Landsat 5

list84<-list.files(pattern="_84")
p84t<-lapply(list84, brick)
#p84 <- plotRGB(p84t, 3, 2, 1, stretch="lin")
#p84<- map(p84t, crop, extnew)
writeRaster(p84, filename="CR_p193r29_1984.grd", format="raster")

list85<-list.files(pattern="_85")
p85t<-lapply(list85, brick)
p85<- map(p85t, crop, extnew)
writeRaster(p85, filename="CR_p193r29_1985.grd", format="raster")

list86<-list.files(pattern="_86")
p86t<-lapply(list86, brick)
#p86<- map(p86t, crop, extnew)
writeRaster(p86, filename="CR_p193r29_1986.grd", format="raster")

list87<-list.files(pattern="_87")
p87t<-lapply(list87, brick)
#p87<- map(p87t, crop, extnew)
writeRaster(p87, filename="CR_p193r29_1987.grd", format="raster")

list89<-list.files(pattern="_89")
p89t<-lapply(list89, brick)
#p89<- map(p89t, crop, extnew)
writeRaster(p89, filename="CR_p193r29_1989.grd", format="raster")

list90<-list.files(pattern="_90")
p90t<-lapply(list90, brick)
p90<- map(p90t, crop, extnew)
writeRaster(p90, filename="CR_p193r29_1990.grd", format="raster")

list91<-list.files(pattern="_91")
p91t<-lapply(list91, brick)
#p91<- map(p91t, crop, extnew)
writeRaster(p91, filename="CR_p193r29_1991.grd", format="raster")

list92<-list.files(pattern="_92")
p92t<-lapply(list92, brick)
#p92<- map(p92t, crop, extnew)
writeRaster(p92, filename="CR_p193r29_1992.grd", format="raster")

list93<-list.files(pattern="_93")
p93t<-lapply(list93, brick)
p93<- map(p93t, crop, extnew)
writeRaster(p93, filename="CR_p193r29_1993.grd", format="raster")

list94<-list.files(pattern="_94")
p94t<-lapply(list94, brick)
#p94<- map(p94t, crop, extnew)
writeRaster(p94, filename="CR_p193r29_1994.grd", format="raster")

list97<-list.files(pattern="_97")
p97t<-lapply(list97, brick)
#p97<- map(p97t, crop, extnew)
writeRaster(p97, filename="CR_p193r29_1997.grd", format="raster")

list00<-list.files(pattern="_00")
p00t<-lapply(list00, brick)
#p00<- map(p00t, crop, extnew)
writeRaster(p00, filename="CR_p193r29_2000.grd", format="raster")

list01<-list.files(pattern="_01")
p01t<-lapply(list01, brick)
#p01<- map(p01t, crop, extnew)
writeRaster(p01, filename="CR_p193r29_2001.grd", format="raster")

list03<-list.files(pattern="_03")
p03t<-lapply(list03, brick)
#p03<- map(p03t, crop, extnew)
writeRaster(p03, filename="CR_p193r29_2003.grd", format="raster")

list04<-list.files(pattern="_04")
p04t<-lapply(list04, brick)
#p04<- map(p04t, crop, extnew)
writeRaster(p04, filename="CR_p193r29_2004.grd", format="raster")

list05<-list.files(pattern="_05")
p05t<-lapply(list05, brick)
#p05<- map(p05t, crop, extnew)
writeRaster(p05, filename="CR_p193r29_2005.grd", format="raster")

list07<-list.files(pattern="_07")
p07t<-lapply(list07, brick)
#p07<- map(p07t, crop, extnew)
writeRaster(p07, filename="CR_p193r29_2007.grd", format="raster")

list09<-list.files(pattern="_09")
p09t<-lapply(list09, brick)
#p09<- map(p09t, crop, extnew)
writeRaster(p09, filename="CR_p193r29_2009.grd", format="raster")

list11<-list.files(pattern="_11")
p11t<-lapply(list11, brick)
#p11<- map(p11t, crop, extnew)
writeRaster(p11, filename="CR_p193r29_2011.grd", format="raster")

# Import immagini CR Landsat 8

list13<-list.files(pattern="_13")
p13t<-lapply(list13, brick)
p13 <- plotRGB(p13t, 3, 2, 1, stretch="lin")
#p13<- map(p13t, crop, extnew)
writeRaster(p13, filename="CR_p208r29_2013.grd", format="raster")

list17<-list.files(pattern="_17")
p17t<-lapply(list17, brick)
#p17<- map(p17t, crop, extnew)
writeRaster(p17, filename="CR_p193r29_2017.grd", format="raster")

list19<-list.files(pattern="_19")
p19t<-lapply(list19, brick)
#p19<- map(p19t, crop, extnew)
writeRaster(p19, filename="CR_p193r29_2019.grd", format="raster")

list20<-list.files(pattern="_20")
p20t<-lapply(list20, brick)
#p20<- map(p20t, crop, extnew)
writeRaster(p20, filename="CR_p193r29_2020.grd", format="raster")

# Importazione delle immagini

CRlist<-list.files(pattern="CR_")
timeseries_CR<-lapply(CRlist, brick)

























