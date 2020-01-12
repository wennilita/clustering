library(ggplot2)
library(cluster)
data=wenni
data
data$Desa
hasil <- kmeans(data[,2,3],3)
hasil
hasil$cluster
hasil$centers
hasil$size

table(hasil$cluster, data$Desa)
hasil$cluster <- as.factor(hasil$cluster)
ggplot(data, aes(data$Desa, data$Nikah, data$Talak, data$Cerai, data$Rujuk, data$Jumlah, color = hasil$cluster)) + geom_point()
dataSample <-data[,2,3]
hc <- hclust(dist(dataSample), method="ave")
hc
plot(hc, hang = -1, labels=data$Jumlah)

d <- dist(dataSample, method="euclidian")
pamCluster <- pam(d, 3)
clusplot(as.matrix(d), pamCluster$cluster, color=T, shade=T, labels=3, lines=0) 
pamCluster