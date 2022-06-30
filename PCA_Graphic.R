install.packages('adegenet')
install.packages('BiocManager')
install.packages('pegas')
install.packages('lea')
install.packages("magrittr")  # for piping %>%
install.packages("ade4")      # PCA computation
install.packages("factoextra")# PCA visualization

BiocManager::install('pcaMethods', force = TRUE)
BiocManager::install('LEA', force = TRUE)

library(pcaMethods)
library('adegenet')
library('ape')
library('pegas')
library(ade4)
library(factoextra)
library(magrittr)

snips =LEA::read.geno('lizards.geno')
snips_df = as.data.frame(snips)
snips_df

cores <- c(Sceloporus_occidentalis$V3)
lista_cores <- c('green', 'orange', 'yellow', 'magenta', 'blue')


sequencias<- c(Lista_Nomes_Localidades$Sequencias)

rownames(snips_df) <- c(sequencias)

snips2_df <- snips_df[-c(1:5), ]

snipsfinal_df <- snips2_df[-c(29:32),]
snipsfinal_df

#PCA
res.pca<-dudi.pca(snipsfinal_df,
                       scannf= FALSE)
res.pca
#Gr?fico do PCA 
fviz_pca_ind(res.pca, col.ind = cores, gradient.cols= lista_cores, geom = 'point', pointsize=3)
                  
 #col.ind= Index de qu?o indicativas s?o, do mais perto ao mais longe, basicamente n?o se mexe
#gradient.cols= cores que o gradiente tem 
#geom = tipo de gr?fico que se tem, meti as bolinhas para ser simples de ler
#pointsize= tamanho dos pontinhos do gr?fico



