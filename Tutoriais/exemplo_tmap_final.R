# Arquivo: EXEMPLO_TMAP_FINAL.R

##############################################
#### GeoAn?lise e Estat?stica Espacial    ####
#### FGV Management - 1o Sem 2020         ####
#### Eduardo de Rezende Francisco         ####
##############################################

################################################
###      Exemplo de Uso da Extens?o tmap     ###
################################################

#install.packages("rgdal")
install.packages("tmap")
instal..packages("tmaptools")
install.packages("shinyjs")
require(rgdal)
require(tmap)
require(shinyjs)
require(tmaptools)

# carrega o shapefile AREACENS.SHP
ac <- rgdal::readOGR(dsn="Tutoriais/areacens_sp",layer="areacens_sp")

# explora a extens?o tmap
qtm(ac)

# mapa de renda
tmap_style("classic")
tmap_style("watercolor")
qtm(ac, fill="RENDA")
qtm(ac, fill="RENDA", style="albatross")

# sofisticando...
qtm(ac, fill="ENERGIA", fill.n=10,
    fill.title="Consumo Energia", fill.style="quantile")
qtm(ac, fill="ENERGIA", fill.n=10,
    fill.title="Consumo Energia", fill.style="equal")


# carrega o shapefile DISTRITOS
distritos <- rgdal::readOGR(dsn="c:/temp",layer="distritos_sp")

# mapa coropl?tico estilo atlas escolar
qtm(distritos, fill="MAP_COLORS", legend.show=FALSE)

#mapas mais divertidos

#explorando a paleta de cores
tmaptools::palette_explorer()


tm_shape(ac) + tm_fill("RENDA", style="quantile", palette=get_brewer_pal("Oranges", n=5)) +
  tm_legend(outside = TRUE, outside.position = "bottom", stack = "horizontal") +
  tm_borders()

tm_shape(ac) + tm_fill(c("RENDA","RENDA"), style=c("quantile","equal"), n=10,
                       palette=get_brewer_pal("Blues", n=5)) + tm_borders() +
 tm_legend(position = c("right","bottom"), stack = "horizontal")
