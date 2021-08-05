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
require(OpenLand)
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

#######################################################

## Vegetation indices

# 1984
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_84_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat84 <- crop(landsat_s, extnew)
writeRaster(landsat84, filename="cremona_1984.grd", format="raster")
landsat84RGB <- landsat84[[c(3,2,1)]]
landsat84FCC <- landsat84[[c(4,3,2)]]

# 1987
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_87_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat87 <- crop(landsat_s, extnew)
writeRaster(landsat87, filename="cremona_1987.grd", format="raster")
landsat87RGB <- landsat87[[c(3,2,1)]]
landsat87FCC <- landsat87[[c(4,3,2)]]

# 1990
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_90_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat90 <- crop(landsat_s, extnew)
writeRaster(landsat90, filename="cremona_1990.grd", format="raster")
landsat90RGB <- landsat90[[c(3,2,1)]]
landsat90FCC <- landsat90[[c(4,3,2)]]

# 1993
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_93_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat93 <- crop(landsat_s, extnew)
writeRaster(landsat93, filename="cremona_1993.grd", format="raster")
landsat93RGB <- landsat93[[c(3,2,1)]]
landsat93FCC <- landsat93[[c(4,3,2)]]

# 1997
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_97_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat97 <- crop(landsat_s, extnew)
writeRaster(landsat97, filename="cremona_1997.grd", format="raster")
landsat97RGB <- landsat97[[c(3,2,1)]]
landsat97FCC <- landsat97[[c(4,3,2)]]

# 2001
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_01_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat01 <- crop(landsat_s, extnew)
writeRaster(landsat01, filename="cremona_2001.grd", format="raster")
landsat01RGB <- landsat01[[c(3,2,1)]]
landsat01FCC <- landsat01[[c(4,3,2)]]

# 2004
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_04_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat04 <- crop(landsat_s, extnew)
writeRaster(landsat04, filename="cremona_2004.grd", format="raster")
landsat04RGB <- landsat04[[c(3,2,1)]]
landsat04FCC <- landsat04[[c(4,3,2)]]

# 2007
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_07_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat07 <- crop(landsat_s, extnew)
writeRaster(landsat07, filename="cremona_2007.grd", format="raster")
landsat07RGB <- landsat07[[c(3,2,1)]]
landsat07FCC <- landsat07[[c(4,3,2)]]

#2011
raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_11_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat11 <- crop(landsat_s, extnew)
writeRaster(landsat11, filename="cremona_2011.grd", format="raster")
landsat11RGB <- landsat11[[c(3,2,1)]]
landsat11FCC <- landsat11[[c(4,3,2)]]

#2019
raslist <- paste0('C:/Federico_T/Dati_Landsat/L8_19_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat19 <- crop(landsat_s, extnew)
landsat19RGB <- landsat19[[c(3,2,1)]]
landsat19FCC <- landsat19[[c(4,3,2)]]

#2020
raslist <- paste0('C:/Federico_T/Dati_Landsat/L8_20_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat20 <- crop(landsat_s, extnew)
landsat20RGB <- landsat20[[c(3,2,1)]]
landsat20FCC <- landsat20[[c(4,3,2)]]

# Let's create a function to calculate NDVI

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}

# For Landsat5 data NIR = 4, red = 3.

# 1984
ndvi84 <- vi(landsat84, 4, 3)
p1<-ggplot()+
geom_raster(ndvi84, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1984 NDVI")

# 1987
ndvi87 <- vi(landsat87, 4, 3)
p2<-ggplot()+
geom_raster(ndvi87, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1987 NDVI")

# 1990
ndvi90 <- vi(landsat90, 4, 3)
p3<-ggplot()+
geom_raster(ndvi90, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1990 NDVI")

# 1993
ndvi93 <- vi(landsat93, 4, 3)
p4<-ggplot()+
geom_raster(ndvi93, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1993 NDVI")

# 1997
ndvi97 <- vi(landsat97, 4, 3)
p5<-ggplot()+
geom_raster(ndvi97, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1997 NDVI")

# 2001
ndvi01 <- vi(landsat01, 4, 3)
p6<-ggplot()+
geom_raster(ndvi01, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 2001 NDVI")

# 2004
ndvi04 <- vi(landsat04, 4, 3)
p7<-ggplot()+
geom_raster(ndvi04, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 2004 NDVI")

# 2007
ndvi07 <- vi(landsat07, 4, 3)
p8<-ggplot()+
geom_raster(ndvi07, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 2007 NDVI")

# 2011
ndvi11 <- vi(landsat11, 4, 3)
p9<-ggplot()+
geom_raster(ndvi11, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 2011 NDVI")

# 2019
ndvi19 <- vi(landsat19, 4, 3)
p3<-plot(ndvi19, col = rev(terrain.colors(10)), main = "Cremona 2019 NDVI")

# 2020
ndvi20 <- vi(landsat20, 4, 3)
p2<-plot(ndvi20, col = rev(terrain.colors(10)), main = "Cremona 2020 NDVI")

# Confronto
par(mfrow=c(1,2))
plot(ndvi84, col = rev(terrain.colors(10)), main = "Cremona 1984 NDVI")
plot(ndvi11, col = rev(terrain.colors(10)), main = "Cremona 2011 NDVI")

par(mfrow=c(1,2))
plot(landsat84FCC, col = rev(terrain.colors(10)), main = "Cremona 1984")
plot(landsat20FCC, col = rev(terrain.colors(10)), main = "Cremona 2020")

pdf("Cremona_NDVI.pdf")
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, nrow=5, ncol=2)
dev.off()

####################################################

## Land Cover Timeseries

cremona<-list.files(pattern="cremona_")

SL_1984_2011 <- contingencyTable(input_raster = cremona, pixelresolution = 30)



## Extract pixels values

# load the polygons with land use land cover information
samp <- readRDS('data/rs/samples.rds')
# generate 300 point samples from the polygons
ptsamp <- spsample(samp, 300, type='regular')
## Warning in proj4string(obj): CRS object has comment, which is lost in output
# add the land cover class to the points
ptsamp$class <- over(ptsamp, samp)$class
# extract values with points
df <- extract(landsat, ptsamp)
# To see some of the reflectance values
head(df)














names(timeseries_CR) <- c("timeseries_CR[[1]]", "timeseries_CR[[23]]")
# The class names and colors for plotting
classname <- c("Water", "Developed", "Barren", "Forest", "Shrubland", "Herbaceous", "Planted/Cultivated", "Wetlands")
classdf <- data.frame(classvalue1 = c(1,2,3,4,5,7,8,9), classnames1 = classname)
# Hex codes of colors
classcolor <- c("#5475A8", "#B50000", "#D2CDC0", "#38814E", "#AF963C", "#D1D182", "#FBF65D", "#C8E6F8")
# Now we ratify (RAT = "Raster Attribute Table") the timeseries_CR[[23]] (define RasterLayer as a categorical variable). This is helpful for plotting.
cr2020 <- timeseries_CR[[2]]
cr2020 <- ratify(cr2020)
rat <- levels(cr2020)[[1]]
#
rat$landcover <- classname
levels(cr2020) <- rat






cr_class<-unsuperClass(timeseries_CR[[23]], nClasses=5)








