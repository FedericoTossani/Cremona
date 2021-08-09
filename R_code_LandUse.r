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

