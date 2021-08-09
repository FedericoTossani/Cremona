#################
#### CREMONA ####
#################

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
plot(veg, main='Vegetationof August 1984')

# plot delle aree con NDVI compresa tra 0.25 e 0.3
land84 <- reclassify(ndvi84, c(-Inf, 0.25, NA,  0.25, 0.3, 1,  0.3, Inf, NA))
plot(land84, main = 'What is it?')

plotRGB(landsat84RGB, r=1, g=2, b=3, axes=TRUE, stretch="lin", main="Landsat 1984")
plot(land84, add=TRUE, legend=FALSE)

# Classificazoine per differente presenza di vegetazione
vegc84 <- reclassify(ndvi84, c(-Inf,0.25,1, 0.25,0.3,2, 0.3,0.4,3, 0.4,0.5,4, 0.5,Inf, 5))
plot(vegc84,col = rev(terrain.colors(4)), main = '1984 soglia di NDVI')

par(mfrow=c(1,2))
plotRGB(landsat84RGB, r=1, g=2, b=3, axes=TRUE, stretch="lin", main="Landsat 1984")
plot(vegc84,col = rev(terrain.colors(4)), main = '1984 soglia di NDVI')
