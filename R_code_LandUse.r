#################
#### CREMONA ####
#################

## Libraries & Working Directory

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

# NDVI
# funzione per calcolare l'NDVI
vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}

# 1984

raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_84_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat84 <- crop(landsat_s, extnew)
landsat84RGB <- landsat84[[c(3,2,1)]]

# NDVI 1984
ndvi84 <- vi(landsat84, 4, 3)

p1<-ggplot()+
geom_raster(ndvi84, mapping=aes(x = x, y = y, fill = layer))+
scale_fill_viridis()+
ggtitle("Cremona 1984 NDVI")

#Istogramma con i valori di NDVI

hist(ndvi84,
     main = "Distribution of 1984 NDVI values",
     xlab = "NDVI",
     ylab= "Frequency",
     col = "wheat",
     xlim = c(-0.5, 1),
     breaks = 30,
     xaxt = 'n')
axis(side=1, at = seq(-0.5,1, 0.05), labels = seq(-0.5,1, 0.05))

# soglia della vegetazione
# tutti i pixel con valori di NDVI maggiore o uguale a 0.4 indicano vegetazione

veg84 <- reclassify(ndvi84, cbind(-Inf, 0.4, NA))
plot(veg, main='Vegetation of August 1984')

# plot delle aree con NDVI compresa tra 0.25 e 0.3
land84 <- reclassify(ndvi84, c(-Inf, 0.25, NA,  0.25, 0.3, 1,  0.3, Inf, NA))
plot(land84, main = 'What is it?')

plotRGB(landsat84RGB, r=1, g=2, b=3, axes=TRUE, stretch="lin", main="Landsat 1984")
plot(land84, add=TRUE, legend=FALSE)

# Classificazoine per differente presenza di vegetazione
vegc84 <- reclassify(ndvi84, c(-Inf,0.25,1, 0.25,0.3,2, 0.3,0.4,3, 0.4,0.5,4, 0.5,Inf, 5))
plot(vegc84,col = rev(terrain.colors(4)), main = '1984 soglia di NDVI')

#prova confronto
par(mfrow=c(1,2))
plotRGB(landsat84RGB, r=1, g=2, b=3, axes=TRUE, stretch="lin", main="Landsat 1984")
plot(vegc84,col = rev(terrain.colors(4)), main = '1984 soglia di NDVI')

### Unsupervised Classification

names(landsat84) <- c('blue', 'green', 'red', 'NIR', 'therm', 'SWIR1', 'SWIR2')
plotRGB(landsat84, 4, 3, 2, stretch="lin", main="prova")

# kmeans classification
# convert the raster to vecor/matrix
nr84 <- getValues(ndvi84)
str(nr84)

# It is important to set the seed generator because `kmeans` initiates the centers in random locations
set.seed(99)
# We want to create 10 clusters, allow 500 iterations, start with 5 random sets using "Lloyd" method
kmncluster84 <- kmeans(na.omit(nr84), centers = 10, iter.max = 500, nstart = 5, algorithm="Lloyd")
# kmeans returns an object of class "kmeans"
str(kmncluster84)

# Use the ndvi object to set the cluster values to a new raster
knr84 <- setValues(ndvi84, kmncluster84$cluster)
# You can also do it like this
knr84 <- raster(ndvi84)
values(knr84) <- kmncluster84$cluster
knr84

# Define a color vector for 10 clusters (learn more about setting the color later)
mycolor <- c("#fef65b","#ff0000", "#daa520","#0000ff","#0000ff","#00ff00","#cbbeb5",
             "#c3ff5b", "#ff7373", "#00ff00", "#808080")

par(mfrow = c(1,2))
plot(ndvi84, col = rev(terrain.colors(10)), main = 'Landsat 1984 NDVI')
plot(knr84, main = '1984 Unsupervised classification', col = mycolor )

# 2011

raslist <- paste0('C:/Federico_T/Dati_Landsat/L5_11_B', 1:7, ".TIF")
landsat_s <- stack(raslist)
extnew<-extent(568731.3, 590042.3, 4988492, 5007671)
landsat11 <- crop(landsat_s, extnew)

#################################
### Supervised Classification ###
#################################

### CORREGGERE


landsat84<-raster(landsat84)
landsat11<-raster(landsat11)
cr8411<-stack(landsat84, landsat11)
names(cr8411) <- c("landsat84", "landsat11")
# The class names and colors for plotting
crclass <- c("Water", "Developed", "Barren", "Forest", "Shrubland", "Herbaceous", "Planted/Cultivated", "Wetlands")
classdf <- data.frame(classvalue1 = c(1,2,3,4,5,7,8,9), classnames1 = crclass)
# Hex codes of colors
classcolor <- c("#5475A8", "#B50000", "#D2CDC0", "#38814E", "#AF963C", "#D1D182", "#FBF65D", "#C8E6F8")
# Now we ratify (RAT = "Raster Attribute Table") the ncld2011 (define RasterLayer as a categorical variable). This is helpful for plotting.
landsat11 <- cr8411[[2]]
landsat11 <- ratify(landsat11)
rat <- levels(landsat11)[[1]]
#
rat$landcover <- crclass
levels(landsat11) <- rat



