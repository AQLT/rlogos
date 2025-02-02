library(RJDemetra)
library(ggplot2)
library(svglite)

series <- structure(c(268.5, 289.8, 261.9, 267.2, 241.5, 256.2, 261.3, 
                      302.4, 426.1, 237.7, 216.4, 279.7, 308.3, 310.8, 284.6, 286.2, 
                      283, 298.5, 291.8, 320.3, 464.5, 256.8, 251.2, 309, 298.6, 356, 
                      295.7, 304.6, 304, 284.2, 326.4, 359.1, 472.5, 292, 269.1, 309.4, 
                      335.1, 405.4, 338.7, 356.6, 346.7, 333.4, 385.5, 411.5, 555.3, 
                      320.3, 288.2, 304.9, 370.4, 435.7, 357.8, 371, 352.1, 359.4, 
                      395.1, 397.4, 591.7, 324, 295.9, 347.3, 386.1, 431.4, 390.3, 
                      428.9, 381.1, 413.9, 435.6, 427.4, 635.4, 341.1, 359.7, 398.7, 
                      408, 451.5, 440.1, 433.5, 424.1, 470.6, 472.6, 479.9, 678.6, 
                      432.6, 371.8, 428, 462.7, 494.9, 480.9, 460.1, 432.9, 452.9, 
                      465, 505.5, 670.1, 422.1, 357.6, 425, 456, 515.8, 477.2, 466.1, 
                      457.5, 451.2, 487.2, 515.3, 690.7, 444.3, 385.3, 423.6, 493.1, 
                      529.4, 466.7, 529.8, 477.4, 453.9, 532.1, 518.4, 727.5, 480.1, 
                      424.1, 447.9, 509.8, 547.9, 522.1, 527.8, 445, 458.7, 517.9, 
                      501.2, 719.2, 447.7, 390, 437.1, 467.5, 511.7, 501.8, 498.3, 
                      440.2, 458.8, 478.3, 504.3, 720.1, 450.7, 388, 468.6, 497.3, 
                      511.4, 476.5, 470.7, 459, 486.8, 499.5, 522.5, 742.7, 477.3, 
                      405.3, 468.6, 520.7, 523.3, 521, 483.2, 481.4, 489.2, 507.6, 
                      541.7, 764.5, 500.2, 424.3, 465.7, 507.1, 538.6, 497.6, 509.3, 
                      476.4, 467.7, 510.2, 505.1, 721.2, 474.1, 381.8, 423.5, 486.9, 
                      541.3, 470.3, 490.9, 451.9, 479.1, 511.1, 529, 755.6, 485.1, 
                      408.3, 459.7, 520.8, 579.7, 535.5, 563.9, 521, 543.8, 580.1, 
                      567.6, 849.8, 521.2, 452.1, 548.3, 598.4, 607.2, 603.3, 576.8, 
                      561.8, 601.4, 628.7, 644.5, 956.4, 548.3, 454.7, 541.5, 571.6, 
                      626, 709, 496.8, 523.9, 626, 566.1, 610.4, 920.6, 562.2, 461.1, 
                      570.3, 627.7, 672, 629.2, 600.6, 573.6, 604.5, 654.8, 681.5, 
                      998.6, 651.9, 530, 622.8, 659.4, 706.6, 639.2, 635.8, 643.9, 
                      664.5, 719.2, 769.9, 1077, 687.4, 556, 670.4, 728.2, 747.7, 711.4, 
                      698.8, 671.6, 719.4, 778.1, 804.3, 1146.7, 762.1, 630.8, 692.3, 
                      765.7, 815.8, 815.4, 768.2, 723.3, 792.8, 817.9, 830.8, 1179.9, 
                      788.6, 625.6, 757.4, 772.5, 836, 850.1, 778.8, 773.9, 846.3, 
                      862.5, 876.8, 1241.3, 807.5, 654.2, 762, 820.2, 851.6, 851.2, 
                      816.8, 825.3, 879.5, 917.9, 936.6, 1290.9, 862.7, 724, 876.3, 
                      888.1, 922.3, 967.1, 922.7, 892.8, 928.1, 984.3, 1002.3, 1381.5, 
                      896, 756.7, 832.6, 961.9, 985.3, 894.5, 942.1, 906.2, 950.2, 
                      966.7, 997.3, 1469.2, 984.5, 782.9, 966.7, 1048.9, 1114.9, 1041.6, 
                      1015.7, 988.1, 1015.6, 1039, 1093.2, 1512.5, 958.4, 766.9, 925.2, 
                      970, 1052.6, 1007.5, 1008, 963.4, 1033.4, 1045.6, 1083, 1572.2, 
                      948.6, 809.1, 962.9, 1014.3, 1066, 1007, 960.6, 931.1, 984.3, 
                      1027.3, 1055.5, 1611.6, 980.9, 822, 998.6, 996.8, 1100.7, 1077, 
                      1018.1, 984.7, 1020.2, 1074.2, 1117.8, 1641.6, 1038.9, 851.5, 
                      947.3, 1075.3, 1162.7, 1104.4, 1082.8, 1080.5, 1144.7, 1249.6, 
                      1302.9, 1819.5, 1158.7, 933.9, 1101.6, 1156.4, 1233.2, 1177.3, 
                      1136.7, 1077.6, 1147.2, 1204.7, 1204.6, 1841.6, 1160.3, 916, 
                      1132.7, 1237, 1288.3, 1215.5, 1202.1, 1113.8, 1207, 1274.4, 1281.7, 
                      1962.2, 1220.2, 1039.9, 1221.8, 1327.4, 1313.4, 1363.8, 1271.1, 
                      1206.8, 1281.7, 1304.3, 1389.7, 2130.4, 1271, 999, 1227.2, 1309.3, 
                      1378, 1369.7, 1286.3, 1233.2), .Tsp = c(1982.25, 2017.58333333333, 
                                                              12), class = "ts")
mod <- x13(ipi_c_eu[,"FR"],"RSA3")

data <- cbind(mod$final$series, mod$final$forecasts)
data  <- window(data ,start = c(2016,6), end = c(2017,5))              
colnames(data) <- c(colnames(mod$final$series), colnames(mod$final$forecasts))

time <- time(data)
dataGraph <- data.frame(cbind(time, data))
colnames(dataGraph) <- c("date", colnames(data))
# dataGraph[nrow(dataGraph)-12, sprintf("%s_f",c("y","sa","t","s","i"))] <- 
#     dataGraph[nrow(dataGraph)-12, c("y","sa","t","s","i")]

size <- 5
linetype <- 2

# dataGraph <- reshape2::melt(dataGraph, id="date")  # convert to long format
size_point <- 8 * size
p <- ggplot(data = dataGraph, aes(x = date))+
    geom_line(aes(y = y), color = "black", size = size)  +
    geom_point(aes(y = y), color = "#51a7f9", size = size_point) +
    theme_minimal() +
    theme(axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank())
p
ratio <- 2
svglite("ggdemetra/graphR.svg",height = 6 * ratio, width = 10.2 * ratio)
p
dev.off()

trend <- (1:6)
y <- trend + rep(c(2,-2),3)
sa <- trend + rnorm(6,sd = 0.4)
data_plot <- data.frame(x = 1:6, y = y, sa = sa,
                        col_y = (colorRampPalette(c("#a8d6ff", "#00488c"))( 6 )),
                        col_sa= rev(colorRampPalette(c("#33cc33", "#006600"))( 6 )),
                        stringsAsFactors = FALSE)

size <-1
size <- 5
linetype <- 2

# dataGraph <- reshape2::melt(dataGraph, id="date")  # convert to long format
size_point <- 9 * size
p <- ggplot(data = data_plot, aes(x = x))+
    geom_line(aes(y = sa), color = "#F0BA17", size = size*3)+
    geom_line(aes(y = y), color = "black", size = size*3)  +
    geom_point(aes(y = y, color = col_y), size = size_point) +
    scale_color_manual(values=rev(data_plot$col_y),guide = FALSE) +
    theme_minimal() +
    theme(axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank())
p+ylim(range(y)+c(-0.2,0.2))
svglite("ggdemetra/graphR.svg",height = 6 * ratio, width = 10.2 * ratio)
p+ylim(range(y)+c(-0.4,0.4))
dev.off()

svglite("ggdemetra/qqqds",height = 6 * ratio, width = 10.2 * ratio)
ggplot(data = data.frame(x=1:9,y= rep(c(-1,1),9)[1:9]), aes(x = x, y = y))+
    geom_line() +
    theme_minimal() +
    theme(axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank()) +
    ylim(c(-20,20)) + xlim(c(-5,15))
dev.off()
