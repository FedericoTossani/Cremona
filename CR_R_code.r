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

### estensione ###

# x immagini p208 r29
 
#drawExtent(show=TRUE, col="red")
# class      : Extent 
# xmin       : 571391.8 
# xmax       : 585388.2 
# ymin       : 4990448 
# ymax       : 5005740 
extnew208<-extent(571391.8, 585388.2, 4990448, 5005740)

# x immagini p193 r29

# drawExtent(show=TRUE, col="red")
# class      : Extent 
# xmin       : 568731.3 
# xmax       : 590042.3 
# ymin       : 4988492 
# ymax       : 5007671 
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)

# Import immagini CR Landsat 1

list72<-list.files(pattern="_72_B")
p72t<-lapply(list72, brick)
p72c<- map(p72t, crop, extnew208)
p72<-stack(p72c)
p72<-disaggregate(p72, fact=2)
#plotRGB(p72, 3, 2, 1, stretch="lin")
writeRaster(p72, filename="CR_p208r29_1972.grd", format="raster")

# Import immagini CR Landsat 2

list75<-list.files(pattern="_75_B")
p75t<-lapply(list75, brick)
p75c<- map(p75t, crop, extnew208)
p75<-stack(p75c)
p75<-disaggregate(p75, fact=2)
#plotRGB(p75, 3, 2, 1, stretch="lin")
writeRaster(p75, filename="CR_p208r29_1975.grd", format="raster")

list79<-list.files(pattern="_79_B")
p79t<-lapply(list79, brick)
p79c<- map(p79t, crop, extnew208)
p79<-stack(p79c)
p79<-disaggregate(p79, fact=2)
#plotRGB(p79, 3, 2, 1, stretch="lin")
writeRaster(p79, filename="CR_p208r29_1979.grd", format="raster")

# Import immagini CR Landsat 4

list88<-list.files(pattern="_88_B")
p88t<-lapply(list88, brick)
p88c<- map(p88t, crop, extnew)
p88<-stack(p88c)
#plotRGB(p88, 3, 2, 1, stretch="lin")
writeRaster(p88, filename="CR_p193r29_1988.grd", format="raster")

# Import immagini CR Landsat 5

list84<-list.files(pattern="_84_B")
p84t<-lapply(list84, brick)
p84c<- map(p84t, crop, extnew)
p84<-stack(p84c)
#plotRGB(p84, 3, 2, 1, stretch="lin")
writeRaster(p84, filename="CR_p193r29_1984.grd", format="raster")

list85<-list.files(pattern="_85_B")
p85t<-lapply(list85, brick)
p85c<- map(p85t, crop, extnew)
p85<-stack(p85c)
#plotRGB(p85, 3, 2, 1, stretch="lin")
writeRaster(p85, filename="CR_p193r29_1985.grd", format="raster")

list86<-list.files(pattern="_86_B")
p86t<-lapply(list86, brick)
p86c<- map(p86t, crop, extnew)
p86<-stack(p86c)
#plotRGB(p86, 3, 2, 1, stretch="lin")
writeRaster(p86, filename="CR_p193r29_1986.grd", format="raster")

list87<-list.files(pattern="_87_B")
p87t<-lapply(list87, brick)
p87c<- map(p87t, crop, extnew)
p87<-stack(p87c)
#plotRGB(p87, 3, 2, 1, stretch="lin")
writeRaster(p87, filename="CR_p193r29_1987.grd", format="raster")

list89<-list.files(pattern="_89_B")
p89t<-lapply(list89, brick)
p89c<- map(p89t, crop, extnew)
p89<-stack(p89c)
#plotRGB(p89, 3, 2, 1, stretch="lin")
writeRaster(p89, filename="CR_p193r29_1989.grd", format="raster")

list90<-list.files(pattern="_90_B")
p90t<-lapply(list90, brick)
p90c<- map(p90t, crop, extnew)
p90<-stack(p90c)
#plotRGB(p90, 3, 2, 1, stretch="lin")
writeRaster(p90, filename="CR_p193r29_1990.grd", format="raster")

list91<-list.files(pattern="_91_B")
p91t<-lapply(list91, brick)
p91c<- map(p91t, crop, extnew)
p91<-stack(p91c)
#plotRGB(p91, 3, 2, 1, stretch="lin")
writeRaster(p91, filename="CR_p193r29_1991.grd", format="raster")

list92<-list.files(pattern="_92_B")
p92t<-lapply(list92, brick)
p92c<- map(p92t, crop, extnew)
p92<-stack(p92c)
#plotRGB(p92, 3, 2, 1, stretch="lin")
writeRaster(p92, filename="CR_p193r29_1992.grd", format="raster")

list93<-list.files(pattern="_93_B")
p93t<-lapply(list93, brick)
p93c<- map(p93t, crop, extnew)
p93<-stack(p93c)
#plotRGB(p93, 3, 2, 1, stretch="lin")
writeRaster(p93, filename="CR_p193r29_1993.grd", format="raster")

list94<-list.files(pattern="_94_B")
p94t<-lapply(list94, brick)
p94c<- map(p94t, crop, extnew)
p94<-stack(p94c)
#plotRGB(p94, 3, 2, 1, stretch="lin")
writeRaster(p94, filename="CR_p193r29_1994.grd", format="raster")

list97<-list.files(pattern="_97_B")
p97t<-lapply(list97, brick)
p97c<- map(p97t, crop, extnew)
p97<-stack(p97c)
#plotRGB(p97, 3, 2, 1, stretch="lin")
writeRaster(p97, filename="CR_p193r29_1997.grd", format="raster")

list00<-list.files(pattern="_00_B")
p00t<-lapply(list00, brick)
p00c<- map(p00t, crop, extnew)
p00<-stack(p00c)
#plotRGB(p00, 3, 2, 1, stretch="lin")
writeRaster(p00, filename="CR_p193r29_2000.grd", format="raster")

list01<-list.files(pattern="_01_B")
p01t<-lapply(list01, brick)
p01c<- map(p01t, crop, extnew)
p01<-stack(p01c)
#plotRGB(p01, 3, 2, 1, stretch="lin")
writeRaster(p01, filename="CR_p193r29_2001.grd", format="raster")

list03<-list.files(pattern="_03_B")
p03t<-lapply(list03, brick)
p03c<- map(p03t, crop, extnew)
p03<-stack(p03c)
#plotRGB(p03, 3, 2, 1, stretch="lin")
writeRaster(p03, filename="CR_p193r29_2003.grd", format="raster")

list04<-list.files(pattern="_04_B")
p04t<-lapply(list04, brick)
p04c<- map(p04t, crop, extnew)
p04<-stack(p04c)
#plotRGB(p04, 3, 2, 1, stretch="lin")
writeRaster(p04, filename="CR_p193r29_2004.grd", format="raster")

list05<-list.files(pattern="_05_B")
p05t<-lapply(list05, brick)
p05c<- map(p05t, crop, extnew)
p05<-stack(p05c)
#plotRGB(p05, 3, 2, 1, stretch="lin")
writeRaster(p05, filename="CR_p193r29_2005.grd", format="raster")

list07<-list.files(pattern="_07_B")
p07t<-lapply(list07, brick)
p07c<- map(p07t, crop, extnew)
p07<-stack(p07c)
#plotRGB(p07, 3, 2, 1, stretch="lin")
writeRaster(p07, filename="CR_p193r29_2007.grd", format="raster")

list09<-list.files(pattern="_09_B")
p09t<-lapply(list09, brick)
p09c<- map(p09t, crop, extnew)
p09<-stack(p09c)
#plotRGB(p09, 3, 2, 1, stretch="lin")
writeRaster(p09, filename="CR_p193r29_2009.grd", format="raster")

list11<-list.files(pattern="_11_B")
p11t<-lapply(list11, brick)
p11c<- map(p11t, crop, extnew)
p11<-stack(p11c)
#plotRGB(p11, 3, 2, 1, stretch="lin")
writeRaster(p11, filename="CR_p193r29_2011.grd", format="raster")

# Import immagini CR Landsat 8

list13<-list.files(pattern="_13_B")
p13t<-lapply(list13, brick)
p13c<- map(p13t, crop, extnew)
p13<-stack(p13c)
#plotRGB(p13, 3, 2, 1, stretch="lin")
writeRaster(p13, filename="CR_p208r29_2013.grd", format="raster")

list17<-list.files(pattern="_17_B")
p17t<-lapply(list17, brick)
p17c<- map(p17t, crop, extnew)
p17<-stack(p17c)
#plotRGB(p17, 3, 2, 1, stretch="lin")
writeRaster(p17, filename="CR_p193r29_2017.grd", format="raster")

list19<-list.files(pattern="_19_B")
p19t<-lapply(list19, brick)
p19c<- map(p19t, crop, extnew)
p19<-stack(p19c)
#plotRGB(p19, 3, 2, 1, stretch="lin")
writeRaster(p19, filename="CR_p193r29_2019.grd", format="raster")

list20<-list.files(pattern="_20_B")
p20t<-lapply(list20, brick)
p20c<- map(p20t, crop, extnew)
p20<-stack(p20c)
#plotRGB(p20, 3, 2, 1, stretch="lin")
writeRaster(p20, filename="CR_p193r29_2020.grd", format="raster")

# Importazione delle immagini

CRlist<-list.files(pattern=".grd")
timeseries_CR<-lapply(CRlist, brick)

###############################################################

################################
#### Temperatura superficie ####
################################

list_temp<-list.files(pattern="_B6")
temp<-lapply(list_temp, raster)
temp_c<- map(temp, crop, extnew)
temp_s<-stack(temp_c)

######################
# Landsat 8

listL8<-list.files(pattern="L8_")
L8<-lapply(listL8, brick)

L8[[7]] #L8_13_B6
L8[[2]] #L8_13_b10
L8[[15]] #L8_17_B6
L8[[10]] #L8_17_b10
L8[[23]] #L8_19_B6
L8[[18]] #L8_19_b10
L8[[31]] #L8_20_B6
L8[[26]] #L8_20_b10

lst<-BT(Landsat_10 = L8[[7]], Landsat_11 = L8[[2]])


cl <- colorRampPalette(c("dark red","red","orange","yellow","white")) (100)

# timeseries_CR[[15]]$L5_03_B6, col=cl

#######################################################
## 4. Restituzione grafica

ggplot()+
geom_raster(temp_s$L5_84_B6, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1984")












