

# 2018.6.20
# to test ggplot2 refering to DS4-W2 Quiz

> library(datasets)
> data(airquality)

> install.packages("ggplot2")
> library(ggplot2)

> qplot(Wind, Ozone, data=airquality, facets=.~factor(Month))
> qplot(Wind, Ozone, data=airquality, geom="smooth")


> x <- read.csv("D68-EMI2.csv")
> x_df <- tbl_df(x)

> UPrint <- subset(x_df, Ope=="U Print")
> WPrint <- subset(x_df, Ope=="W Print")
> UScan <- subset(x_df, Ope=="U Scan")
> WScan <- subset(x_df, Ope=="W Scan")
> Standby <- subset(x_df, Ope=="Standby")

> x_df_fil <- filter(x_df, x_df$Margin < 10)
> qplot(Freq, Margin, data=x_df_fil, facets=.~factor(Ope))

qplot(Freq, Margin, data=x_df_fil, facets=.~factor(Ope), col=x_df_fil$Pol)


 




# 2018.6.19 
# to analyse an EMI data

x <- read.csv("~/D68-EMI_df.csv")
dim(x)
head(x) 

x_df <- tbl_df(x)
head(x_df)

x_df_sel <- select(x_df, Frequency..MHz., Pol, Margin.QP..dB., Height..cm., Angle..deg.)

head(x_df_sel)

plot(x_df_sel$Frequency..MHz., x_df_sel$Margin.QP..dB., pch=20)  
plot(x_df_sel$Frequency..MHz., x_df_sel$Height..cm., pch=20) 
plot(x_df_sel$Frequency..MHz., x_df_sel$Angle..deg., pch=20)

plot(x_df_sel$Margin.QP..dB., x_df_sel$Frequency..MHz.,  pch=20) 
plot(x_df_sel$Margin.QP..dB., x_df_sel$Height..cm.,  pch=20) 
plot(x_df_sel$Margin.QP..dB., x_df_sel$Angle..deg.,  pch=20) 
abline(lm(x_df_sel$Margin.QP..dB. ~ x_df_sel$Angle..deg.))

hist(x_df_sel$Frequency..MHz., col="green", breaks=10)
hist(x_df_sel$Margin.QP..dB., col="green", breaks=10)
hist(x_df_sel$Height..cm., col="green", breaks=10)
hist(x_df_sel$Angle..deg., col="green", breaks=10)

pol <- table(x_df_sel$Pol)
barplot(pol, col="wheat", main="Number of Noises in Each polarization")

boxplot(Margin.QP..dB.~Frequency..MHz., data=x_df_sel, col="red")
# y ~ x to show that y (in this case pm25) depends on x (region).


hor <- subset(x_df_sel, Pol=="H")
ver <- subset(x_df_sel, Pol=="V")
plot(x_df_sel$Frequency..MHz., x_df_sel$Margin.QP..dB., pch=20, col=x_df_sel$Pol) 

> qplot(Freq, Margin, data=x_df_fil, facets=.~factor(Pol))
> qplot(Freq, Margin, data=x_df_fil, facets=.~factor(Reg))
> qplot(Angle, Margin, data=x_df_fil, facets=.~factor(Ope))

> qplot(Angle, Margin, data=x_df_fil, facets=.~factor(Ope), col=x_df_fil$Pol)


print <- subset(x_df_fil, x_df_fil$Ope=="Copy"|x_df_fil$Ope=="U Scan"|x_df_fil$Ope=="W Scan")
scan <- subset(x_df_fil, x_df_fil$Ope=="Copy"|x_df_fil$Ope=="U Scan"|x_df_fil$Ope=="W Scan")


x_df_fil2 <- mutate(x_df_fil, if(Ope=="Copy" || Ope=="U Print" || Ope=="W Print"){Engine="Print"}
  else if(Ope=="Copy" || Ope=="U Scan"  || Ope=="W Scan" ){Engine="Scan"}
  else {Engine=""})

# 2018.6.19 
# to get a learning curve by removing unnecessary characters out of data

> x <- read.table("~/20180618-progress.txt")
> y <- cbind(a, x)
Error in data.frame(..., check.names = FALSE) : 
  ?????ɈقȂ??񐔂̃f?[?^?t???[?????܂܂??Ă??܂?: 31, 30 
> a <- c(1:30)
> y <- cbind(a, x)
> y_df <- tbl_df(y)
> plot(y)
> x2 <- read.table("~/20180619-progress.txt")
> x <- rbind(x,x2)
> dim(x)
[1] 215   1
> a <- c(1:215)
> y <- cbind(a,x)
> y_df <- tbl_df(y)
> plot(y_df)
Warning message:
  In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
> dim(x2)
[1] 185   1
> head(x2)
V1
1 0.3861\b
2 0.3861\b
3 0.3861\b
4   0.3911
5   0.3871
6   0.3878
> head(y_df)
# A tibble: 6 x 2
a V1    
<int> <chr> 
  1     1 0.4788
2     2 0.4679
3     3 0.459 
4     4 0.4538
5     5 0.4497
6     6 0.4455
> tail(y_df)
# A tibble: 6 x 2
a V1        
<int> <chr>     
  1   210 "0.3856\b"
2   211 "0.3856\b"
3   212 "0.3856\b"
4   213 "0.3856\b"
5   214 "0.3856\b"
6   215 "0.3856\b"
> tail(x2)
V1
180 0.3856\b
181 0.3856\b
182 0.3856\b
183 0.3856\b
184 0.3856\b
185 0.3856\b
> library(tidyr)
Error in library(tidyr) :  ?etidyr?f ?Ƃ??????O?̃p?b?P?[?W?͂????܂??? 
> install.packages("tidyr")
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/tidyr_0.8.1.zip'
Content type 'application/zip' length 943726 bytes (921 KB)
downloaded 921 KB

package ?etidyr?f successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\032044\AppData\Local\Temp\RtmpMDIcrK\downloaded_packages
> library(tidyr)
> tail(x2)
V1
180 0.3856\b
181 0.3856\b
182 0.3856\b
183 0.3856\b
184 0.3856\b
185 0.3856\b
> tbl_df(x2)
# A tibble: 185 x 1
V1        
<fct>     
  1 "0.3861\b"
2 "0.3861\b"
3 "0.3861\b"
4 0.3911    
5 0.3871    
6 0.3878    
7 0.3875    
8 0.3876    
9 0.3874    
10 0.3868    
# ... with 175 more rows
> head(x2)
V1
1 0.3861\b
2 0.3861\b
3 0.3861\b
4   0.3911
5   0.3871
6   0.3878
> x2
V1
1   0.3861\b
2   0.3861\b
3   0.3861\b
4     0.3911
5     0.3871
6     0.3878
7     0.3875
8     0.3876
9     0.3874
10    0.3868
11    0.3867
12    0.3871
13    0.3872
14    0.3874
15    0.3878
16    0.3877
17    0.3873



> gsub("\b","",x2[,1])
[1] "0.3861" "0.3861" "0.3861" "0.3911" "0.3871" "0.3878" "0.3875"
[8] "0.3876" "0.3874" "0.3868" "0.3867" "0.3871" "0.3872" "0.3874"
[15] "0.3878" "0.3877" "0.3873" "0.3870" "0.3869" "0.3868" "0.3867"
[22] "0.3868" "0.3867" "0.3867" "0.3866" "0.3866" "0.3864" "0.3864"

> x3 <- gsub("\b","",x2[:,1])
Error: unexpected ':' in "x3 <- gsub("\b","",x2[:"
> x3 <- gsub("\b","",x2[,1])
> tail(x3)
[1] "0.3856" "0.3856" "0.3856" "0.3856" "0.3856" "0.3856"
> tbl_df(x3)
# A tibble: 185 x 1
value 
<chr> 
  1 0.3861
2 0.3861
3 0.3861
4 0.3911
5 0.3871
6 0.3878
7 0.3875
8 0.3876
9 0.3874
10 0.3868
# ... with 175 more rows
> x4 <- tbl_df(x3)
> tail(x4)
# A tibble: 6 x 1
value 
<chr> 
  1 0.3856
2 0.3856
3 0.3856
4 0.3856
5 0.3856
6 0.3856
> plot(x4)

(1-e^(-t/(RC)))*3.3

> x<- rnorm(10000)
> y<- rnorm(10000)
> smoothScatter(x,y)

x <- read.csv("E90-EMI.csv")

ggplot() + geom_point(data=mar90, mapping=aes(x=Frequency, y=Margin, col="blue"))
+ geom_point(data=mar90, mapping=aes(x=Frequency, y=X.2))
+ facet_wrap(~mode)
+ geom_hline(yintercept=3, col="red")

------- 2019.7.10 EMI Data-------
x <- read.csv("20180709-RE.csv")
xdf <- tbl_df(x)
head(xdf)
re <- select(xdf, Freq, Ant, V, H, Product, Operation, AC)
e90re <- filter(re, Product=="E90")
ggplot() + geom_point(data=e90re, mapping=aes(x=Freq, y=V, col="blue", alpha=1/2)) + geom_point(data=e90re, mapping=aes(x=Freq, y=H, col="red", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E90 PreDE3")

e93re <- filter(re, Product=="E93")
ggplot() + geom_point(data=e93re, mapping=aes(x=Freq, y=V, col="blue", alpha=1/2)) + geom_point(data=e93re, mapping=aes(x=Freq, y=H, col="red", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E93 PreDE3")


x <- read.csv("20180709-CE.csv")
xdf <- tbl_df(x)
head(xdf)
ce <- select(xdf, Freq, QP, AV, Cable, Product, Operation, AC, P.S)
e90ce_ac <- filter(ce, Product=="E90" & Cable=="AC" & QP < 15 & AV < 15)
e90ce_tel <- filter(ce, Product=="E90" & Cable=="TEL")
e90ce_lan <- filter(ce, Product=="E90" & Cable=="LAN")
e93ce_ac <- filter(ce, Product=="E93" & Cable=="AC" & QP < 15 & AV < 15)
ggplot() + geom_point(data=e90ce_ac, mapping=aes(x=Freq, y=QP, col="black", alpha=1/2)) + geom_point(data=e90ce_ac, mapping=aes(x=Freq, y=AV, col="white", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E90 PreDE3")
ggplot() + geom_point(data=e90ce_tel, mapping=aes(x=Freq, y=QP, col="black", alpha=1/2)) + geom_point(data=e90ce_tel, mapping=aes(x=Freq, y=AV, col="white", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E90 PreDE3")
ggplot() + geom_point(data=e90ce_lan, mapping=aes(x=Freq, y=QP, col="black", alpha=1/2)) + geom_point(data=e90ce_lan, mapping=aes(x=Freq, y=AV, col="white", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E90 PreDE3")
ggplot() + geom_point(data=e93ce, mapping=aes(x=Freq, y=QP, col="black", alpha=1/2)) + geom_point(data=e93ce, mapping=aes(x=Freq, y=AV, col="white", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E93 PreDE3")



e90ce <- filter(ce, Product=="E90")
e93ce <- filter(ce, Product=="E93")

g <- ggplot(data=e90ce) 
g + geom_point(data=e90ce, mapping=aes(x=Freq, y=QP, col="red", alpha=1/2)) 
+ geom_point(data=e90ce, mapping=aes(x=Freq, y=AV, col="red", alpha=1/2)) 
+ facet_wrap(~Operation) 
+ labs(x="Freq", y="Margin", title="E90 CE")



g <- ggplot(data=e90ce, aes(x=Freq, y=QP, color(factor(Cable))))
g + geom_point(alpha=1/3) + facet_grid(Operation~AC) + geom_point(y=e90ce$AV, alpha=1/3) + labs(x="Freq", y="QP, AV", title="E90 CE")

g <- ggplot(data=e93ce, aes(x=Freq, y=QP, color(factor(Cable))))
g + geom_point(alpha=1/3) + facet_grid(Operation~AC) + geom_point(y=e93ce$AV, alpha=1/3) + labs(x="Freq", y="QP, AV", title="E93 CE")


test <- c("1.3/272", "2.7/183")

library(stringr)
strsplit(test, "/")
y <- unlist(strsplit(test, "/"))
as.numeric(y)

as.matrix(Comm)
> dim(Comm_mx)
[1] 438   1


re    <- tbl_df(read.csv("EMI-RE.csv"))
e90re <- filter(re, Product=="E90")
e93re <- filter(re, Product=="E93")

ce    <- tbl_df(read.csv("EMI-CE.csv"))
e90ce <- filter(ce, Product=="E90")
e93ce <- filter(ce, Product=="E93")

g <- ggplot()
g + geom_point(data=e90re, mapping=aes(x=Freq, y=V, col="blue", alpha=1/2)) + geom_point(data=e90re, mapping=aes(x=Freq, y=H, col="red", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E90 PreDE3")

g <- ggplot()
g + geom_point(data=e93re, mapping=aes(x=Freq, y=V, col="blue", alpha=1/2)) + geom_point(data=e93re, mapping=aes(x=Freq, y=H, col="red", alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E93 PreDE3")

g <- ggplot(data=e90ce, aes(x=Freq, y=QP, color(factor(Cable))))
g + geom_point(alpha=1/3) + facet_grid(Operation~AC) + geom_point(y=e90ce$AV, alpha=1/3) + labs(x="Freq", y="QP, AV", title="E90 CE")

g <- ggplot(data=e93ce, aes(x=Freq, y=QP, color(factor(Cable))))
g + geom_point(alpha=1/3) + facet_grid(Operation~AC) + geom_point(y=e93ce$AV, alpha=1/3) + labs(x="Freq", y="QP, AV", title="E93 CE")




ggplot() + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=V, col="blue", alpha=1/2)) + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=H, col="red", alpha=1/2)) + facet_wrap(~ADF) + labs(x="Freq", y="Margin", title="E90 PreDE3")

g <- ggplot()
g + geom_point(data=e93re_adf, aes(x=Freq, y=V, alpha=1/2)) + geom_point(data=e93re_adf, aes(x=Freq, y=H, alpha=1/2)) + facet_wrap(~Operation) + labs(x="Freq", y="Margin", title="E93 PreDE3")

g <- ggplot(data=mpg, aes(x=displ, y=hwy, color=factor(year)))
g + geom_point()
g + geom_point() + facet_grid(drv~cyl, marging=TRUE)

ggplot() + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=V, color=factor(ADF))) + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=H, color=factor(ADF))) + labs(x="Freq", y="Margin", title="E90 PreDE3 ADF Copy")


g <- ggplot() + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=V, color=factor(ADF), size=3, alpha=1/2)) 
g1 <- g + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=H, color=factor(ADF), size=3, alpha=1/2)) + labs(x="Freq", y="Margin", title="E90 PreDE3 ADF Copy")
g1 + ylim(0, 20)

g  <- ggplot() 
g1 <- g  + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=V, color=factor(ADF), size=3, alpha=1/2)) + geom_smooth()
g2 <- g1 + geom_point(data=e90re_adf, mapping=aes(x=Freq, y=H, color=factor(ADF), size=3, alpha=1/2)) + geom_smooth()
g2 + ylim(0, 20) + labs(x="Freq", y="Margin", title="E90 PreDE3 ADF Copy")




re    <- tbl_df(read.csv("EMI-RE.csv"))
temp <- mutate(re, Date2 = as.Date(re$Date, "%Y/%m/%d"))
e90re <- filter(temp, Product=="E90")
e93re <- filter(temp, Product=="E93")

ce    <- tbl_df(read.csv("EMI-CE.csv"))
temp <- mutate(ce, Date2 = as.Date(ce$Date, "%Y/%m/%d"))
e90ce <- filter(temp, Product=="E90")
e93ce <- filter(temp, Product=="E93")



#------------------ 2018.7.26 ------------------  

re_V <- filter(re, !is.na(re$Ver))
re_V2 <- select(re_V2, V, AC)
re_V2_mx <- as.matrix(re_V2)
re_V2_mx_scaled <- scale(re_V2_mx)
heatmap(re_V2_mx_scaled)

factor(re$AC)

> matrix(rnorm(10), nrow=2, ncol=5)
[,1]       [,2]      [,3]      [,4]       [,5]
[1,]  1.1022975 -0.7094400 -1.629093 -2.180040 -0.2942939
[2,] -0.4755931 -0.5012581 -1.167619 -1.340993 -0.4658975

sqrt((m2[1,1]-m2[2,1])^2 + (m2[1,2]-m2[2,2])^2 + (m2[1,3]-m2[2,3])^2 + (m2[1,4]-m2[2,4])^2 + (m2[1,5]-m2[2,5])^2)

> table(re_V$Product)

E90 E93 
155  92 

> re_V$V[which.min(re_V$V)]
[1] -0.8

re_V[which.min(re_V$V),]

mdist <- dist(c(sub1[,10:12], sub1[,maxCon]))

Freq   Ver   Hor Cable  Amp.   Ant Result     X  X10m     V     H Comm  Product
<dbl> <dbl> <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <fct> <fct>  
  1  41.3    45    NA   1.1 -32.5  17.2   30.8    NA    30  -0.8    NA 1/133 E93  


mdist <- dist(sub1[,c(10:12,maxCon)]) 

> re_V[,c(1, 10:12)]
# A tibble: 247 x 4
Freq     V     H Comm 
<dbl> <dbl> <dbl> <fct>
  1  40.8  12.9    NA ""   
2  81.9  16.7    NA ""   
3  90.1  14.3    NA ""   
4  98.8  13.8    NA ""   
5 172.   10.9    NA ""   

> plot(svd1$u[,2], col=2)
> plot(svd1$u[,2], pch=2)
> boxplot(re_V$V)
> hist(re_V$V)
> barplot(re_V$V)
> plot(re_V$V)

> re_V$V[which.min(re_V$V)]
[1] -0.8

> re_V[which.min(re_V$V),]
Freq   Ver   Hor Cable  Amp.   Ant Result     X  X10m     V     H Comm  Product
<dbl> <dbl> <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <fct> <fct>  
  1  41.3    45    NA   1.1 -32.5  17.2   30.8    NA    30  -0.8    NA 1/133 E93  

PS_A <- which(re_V$PS=="A")


# Seperate angles and heights 
Comm2 <- strsplit(as.character(re$Comm), '/', fixed=TRUE)

# Create Angle and Height from Comm2
for (i in 1:length(Comm2)) {
  for (j in 1:2) {
    if (!j %% 2){
      Height[i] <- Comm2[[i]][j]
    }
    else {
      Angle[i] <- Comm2[[i]][j]
    }
   }
}

# Convert both from lists  into numeric objects
Angle <- as.numeric(Angle)
Height <- as.numeric(Height)

temp <- cbind(re, Angle)
re2 <- cbind(temp, Height)
re2 <- tbl_df(re2)

tail(select(re2, Freq, V, H, Product, Comm, Angle, Height))


x <- c(-0.5, 0, 1, 1, 1.5)
y <- c(0, 0, 2, 0, 0)
plot(x, y, lwd=3, frame=FALSE, type="l")


table, summary, str, length, dim, typeof, nrow, ncol, range, class, levels
with(), graphics.off(), head(mtcars, 15), 
data : mtcars, galton, InsectSprays, swiss, wages

# Looking for a row with specific data, 2018.8.10 
re_V[match(14, re_V$V), ]

library(manipulate) 
myHist <- function(mu){
}
g <- ggplot(galton, aes(x = child))
g <- g + geom_histogram(fill = "salmon",
                        binwidth=1, aes(y = ..density..), colour = "black") g <- g + geom_density(size = 2)
g <- g + geom_vline(xintercept = mu, size = 2)
mse <- round(mean((galton$child - mu)^2), 3)
g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
g
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

nosim <- 1000
n <- 10
sd(apply(matrix(rnorm(nosim *n), nosim), 1, mean))
sd(apply(matrix(runif(nosim*n), nosim), 1, mean))
sd(apply(matrix(rpois(nosim*n, 4), nosim), 1, mean))
sd(apply(matrix(sample(0:1, nosim*n, replace=TRUE), nosim), 1, mean))


library(UsingR); data(father.son);
x <- father.son$sheight
n <- length(x)
p <- ggplot(father.son, aes(x)) + geom_histogram()
p

round(c(var(x), var(x)/n, sd(x), sd(x)/sqrt(n)), 2)

mean(rnorm(nosim *n))
sd(rnorm(nosim *n))/sqrt(n)

hist(apply(matrix(sample(x, 1000, replace=TRUE), 100, 10), 1, mean))

library(dplyr)
library(ggplot2)
x <- t(tbl_df(read.csv("eindeces.csv")))
n <- c("YEAR", "DATE", 
       "GDP.US", "GDP.CN", "GDP.JP", "GDP.EU", "GDP.IN", "GDP.SK", "GDP.TW", "GDP.BZ", 
      "IP.US", "IP.CN", "IP.JP", "IP.EU", "IP.IN", "IP.SK", "IP.TW", "IP.BZ", 
      "CP.US", "CP.CN", "CP.JP", "CP.EU", "CP.IN", "CP.SK", "CP.TW", "CP.BZ", 
      "UNEMP.US", "UNEMP.CN", "UNEMP.JP", "UNEMP.EU", "UNEMP.IN", "UNEMP.SK", "UNEMP.TW", "UNEMP.BZ", 
      "CAB.US", "CAB.CN", "CAB.JP", "CAB.EU", "CAB.IN", "CAB.SK", "CAB.TW", "CAB.BZ", 
      "BAB.US", "BAB.CN", "BAB.JP", "BAB.EU", "BAB.IN", "BAB.SK", "BAB.TW", "BAB.BZ", 
      "IR.US", "IR.CN", "IR.JP", "IR.EU", "IR.IN", "IR.SK", "IR.TW", "IR.BZ", 
      "FX.US", "FX.CN", "FX.JP", "FX.EU", "FX.IN", "FX.SK", "FX.TW", "FX.BZ", 
      "LFX.US", "LFX.CN", "LFX.JP", "LFX.EU", "LFX.IN", "LFX.SK", "LFX.TW", "LFX.BZ")


x1 <- t(read.csv("eindeces.csv"))
x2 <- x1[3:32, 1:74]  # changed from 31 to 32
x3 <- gsub("[%]", "", x2)
x3 <- gsub("[$]", "", x3)
x3 <- gsub("[,]", "", x3)
x4 <- tbl_df(x3)
names(x4) <- n
x4[,3:74] <- mapply(x4[,3:74], FUN=as.numeric)
x4

# convert date
x4[1:9, 2] <- lapply(x4[1:9, 2], function(x) paste("2016", x, sep="/"))
x4[10:20, 2] <- lapply(x4[10:20, 2], function(x) paste("2017", x, sep="/"))
x4[21:30, 2] <- lapply(x4[21:30, 2], function(x) paste("2018", x, sep="/")) # changed from 29 to 30
x5 <- x4[,2:74]
x5$DATE <- as.Date(x5$DATE, "%Y/%m/%d")


## references ##################################
> c <-  "ce7382"
> gsub("[a-zA-Z ]", "", c)
[1] "7382"
yyz[] <- lapply(yyz, function(x) as.numeric(as.character(x)))
m <- mapply(m, FUN=as.numeric)
m <- matrix(data=m, ncol=2, nrow=3)

df1$V1 <- paste("Market", df1$V1, sep="_")
df1[] <- lapply(df1, function(x) paste("Market", x, sep="_"))
################################################

n <- 1000
mean <- cumsum(rnorm(n))/(1:n)
mean <- cumsum(sample(0:1, n, replace=TRUE))/(1:n)
sample(0:100, 10, replace=FALSE)
abline(h=0.5)

# plot the economy data
g  <- ggplot(data=x5, aes(color=GDP.US)) 
g1 <- g  + geom_line(data=x5, color="red", mapping=aes(x=DATE, y=GDP.US)) 
g2 <- g1 + geom_line(data=x5, color="blue", mapping=aes(x=DATE, y=GDP.CN)) 
g3 <- g2 + geom_line(data=x5, color="black", mapping=aes(x=DATE, y=GDP.JP)) 
g4 <- g3 + geom_line(data=x5, color="orange", mapping=aes(x=DATE, y=GDP.EU)) 
g5 <- g4 + geom_line(data=x5, color="purple", mapping=aes(x=DATE, y=GDP.IN)) 
g6 <- g5 + geom_line(data=x5, color="pink", mapping=aes(x=DATE, y=GDP.SK)) 
g7 <- g6 + geom_line(data=x5, color="black", mapping=aes(x=DATE, y=GDP.TW)) 
g8 <- g7 + geom_line(data=x5, color="black", mapping=aes(x=DATE, y=GDP.BZ)) 
#g2 + ylim(0, 20) + labs(x="DATE", y="GDP", title="GDP")
g8 + labs(x="DATE", y="GDP", title="GDP")
gg <- ggplotly(g8)
#### 2018.8.16 ###

gdp <- t(x5[, 2:9])
rnames <- row.names(gdp)
rnames <- gsub("GDP.", "", rnames)
row.names(gdp) <- rnames
gdp_v <- as.vector(gdp)

countries <- c(1:232)  # changed from 216 to 232
for (i in 1:30) {   # changed from 29 to 30
  j = 1 + 8*(i-1)
  #print(countries[j:j+6])
  countries[j:(j+7)] <- rnames
}
gdp_v <- tbl_df(gdp_v)
countries <- tbl_df(countries)
gdp <- cbind(countries, gdp_v)


ipd <- t(x5[, 10:17]) # inductrial productions
ipd_v <- as.vector(ipd)
ipd <- tbl_df(ipd_v)

cprice <- t(x5[, 18:25])  # consumer prices
cprice_v <- as.vector(cprice)
cprice <- tbl_df(cprice_v)

unemp <- t(x5[, 26:33])  # unemployments
unemp_v <- as.vector(unemp)
unemp <- tbl_df(unemp_v)

cab <- t(x5[, 34:41])  # current account balance
cab_v <- as.vector(cab)
cab <- tbl_df(cab_v)

budget <- t(x5[, 42:49])  # budget balance
budget_v <- as.vector(budget)
budget <- tbl_df(budget_v)

irate <- t(x5[, 50:57])  # interest rate
irate_v <- as.vector(irate)
irate <- tbl_df(irate_v)

crate <- t(x5[, 58:65])  # currency rate
crate_v <- as.vector(crate)
crate <- tbl_df(crate_v)

economy <- cbind(gdp, ipd)
economy <- cbind(economy, cprice)
economy <- cbind(economy, unemp)
economy <- cbind(economy, cab)
economy <- cbind(economy, budget)
economy <- cbind(economy, irate)
economy <- cbind(economy, crate)

rnames <- c("DATE", "COUT", "GDP", "IPD", "CPRICE", "UNEMP", "CAB", "BUDGET", "IRATE", "CRATE")

date1 <- x5$DATE  ## just to let R know date1 is as.date
for (i in 1:30) {  # changed from 29 to 30
  for (j in (1+8*(i-1)):(1+8*(i-1)+7)){
    date1[j] <- x5$DATE[i]
  }
}

economy <- cbind(date1, economy)
names(economy) <- rnames
edf <- tbl_df(economy)

qplot(DATE, GDP, data=edf, facets=.~factor(COUT), geom="smooth")
qplot(DATE, IPD, data=edf, facets=.~factor(COUT), geom="smooth") # inductrial productions
qplot(DATE, CPRICE, data=edf, facets=.~factor(COUT), geom="smooth") # consumer price
qplot(DATE, UNEMP, data=edf, facets=.~factor(COUT))
qplot(DATE, CAB, data=edf, facets=.~factor(COUT)) # current account balance
qplot(DATE, BUDGET, data=edf, facets=.~factor(COUT)) 
qplot(DATE, IRATE, data=edf, facets=.~factor(COUT))
qplot(DATE, CRATE, data=edf, facets=.~factor(COUT), ylim=c(0, 150), geom="smooth") # currency rate

test <- (edf$CRATE - mean(edf$CRATE, na.rm=TRUE)) / sd(edf$CRATE, na.rm=TRUE)

### 2018.8.17 ###
### Dont forget to clear all recycled variables ###
library(dplyr); library(ggplot2)
x1 <- read.csv("shares.csv")
x2 <- t(x1[2:16,2:33]) # changed from 32 to 33
#x2[1,1] <- "DATE"
x3 <- gsub("[%]", "", x2)
x3 <- gsub("[,]", "", x2)  # ! Never forget remove ","
x4 <- tbl_df(x3)
x5 <- tbl_df(mapply(x4[2:32,2:15], FUN=as.numeric)) # changed from 31 to 32

# convert date
x4[2:11, 1] <- lapply(x4[2:11, 1], function(x) paste("2016", x, sep="/"))
x4[12:22, 1] <- lapply(x4[12:22, 1], function(x) paste("2017", x, sep="/"))
x4[23:32, 1] <- lapply(x4[23:32, 1], function(x) paste("2018", x, sep="/"))   # changed from 31 to 32, 2 places
x4$`2` <- as.Date(x4$`2`, "%Y/%m/%d")

x6 <- cbind(x4$`2`[2:32], x5)   # changed from 31 to 32

remove(cnames)
cnames <- x4[1,]
cnames[1] <- "DATE"
names(x6) <- cnames[,1:15]
x7 <- tbl_df(x6)
sdf <- x7

#par(mfrow=c(3,3), mar=c(4,4,2,1))
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(sdf, plot(DATE, DJIA)); lines(sdf$DATE, sdf$DJIA)
#with(sdf, plot(DATE, `S&P`))
#ith(sdf, plot(DATE, NAScomp))
with(sdf, plot(DATE, SSEB)); lines(sdf$DATE, sdf$SSEB)
with(sdf, plot(DATE, Nikkei)); lines(sdf$DATE, sdf$Nikkei)
with(sdf, plot(DATE, DAX)); lines(sdf$DATE, sdf$DAX)
with(sdf, plot(DATE, BSE)); lines(sdf$DATE, sdf$BSE)
with(sdf, plot(DATE, KOSPI)); lines(sdf$DATE, sdf$KOSPI)
with(sdf, plot(DATE, TWI)); lines(sdf$DATE, sdf$TWI)
with(sdf, plot(DATE, BVSP)); lines(sdf$DATE, sdf$BVSP)
with(sdf, plot(DATE, `World dev'd`)); lines(sdf$DATE, sdf$`World dev'd`)
with(sdf, plot(DATE, Emerging)); lines(sdf$DATE, sdf$Emerging)

# abline(h=12, lwd=2, lty=2)
# plot(pollution$latitude, pollution$pm25, col=pollution$region)
# abline(h=12, lwd=2, lty=2)
# dev.off()

# qplot(DATE, DJIA, data=x5, geom="smooth") # consumer price
qplot(DATE, DJIA, data=x7) # consumer price

g <- ggplot()
g + geom_line(data=edf, aes(x=DATE, y=scale(CRATE), alpha=1/2), color="red") + 
    geom_line(data=x7, aes(x=DATE, y=scale(DAX), alpha=1/2), color="blue") + 
    labs(x="DATE", y="Y", title="TITLE") 


### 2018.8.178###
### Dont forget to clear all recycled variables ###
x1 <- read.csv("comms.csv")
x2 <- t(x1[2:7,2:33])  # changed from 32 to 33
#x2[1,1] <- "DATE"
x3 <- gsub("[%]", "", x2)
x3 <- gsub("[,]", "", x3)  # ! Never forget remove ","
x4 <- tbl_df(x3)
cnames <- x4[1, ]
cnames[1] <- "DATE"
names(x4) <- cnames
#x5 <- tbl_df(mapply(x4[2:29,2:15], FUN=as.numeric))

# convert date
x4[2:11, 1] <- lapply(x4[2:11, 1], function(x) paste("2016", x, sep="/"))
x4[12:22, 1] <- lapply(x4[12:22, 1], function(x) paste("2017", x, sep="/"))
x4[23:32, 1] <- lapply(x4[23:32, 1], function(x) paste("2018", x, sep="/")) #changed from 31 to 32, 2 places.
DATE <- as.Date(x4$DATE[2:32], "%Y/%m/%d")  #changed from 31 to 32

x5 <- tbl_df(mapply(x4[2:32,2:6], FUN=as.numeric))  #changed from 31 to 32
x6 <- tbl_df(cbind(DATE, x5))
cdf <- x6

par(mfrow=c(2,2), mar=c(4,4,2,1))
#with(cdf, plot(DATE, `All items`))
with(cdf, plot(DATE, Food)); lines(cdf$DATE, cdf$Food)
with(cdf, plot(DATE, Metals)); lines(cdf$DATE, cdf$Metals)
with(cdf, plot(DATE, Gold)); lines(cdf$DATE, cdf$Gold)
with(cdf, plot(DATE, WTI)); lines(cdf$DATE, cdf$WTI)

par(mfrow=c(1,1), mar=c(4,4,2,1))
with(cdf, plot(DATE, Gold)); lines(cdf$DATE, cdf$Gold)
with(cdf, abline(lm(Gold~DATE)))

##############################
x5 <- slice(x4, 1)   # to extract only the first line
x5 <- slice(x4, -1)  # remove only the first line
##############################

### 2018.9.6 Fri ###
### Study of CLT ###
# You must take sample means to estimate the population.
# Number of the small samples must be more than 10, NEVER 1.
# Although the sample mean is the same as the population mean, the sample 
# variance is much different.

p <- matrix(rnorm(10000), 1000)
p <- matrix(rpois(10000, 1), 1000)
s1 <- p[sample(1:1000, 1000), ]
mean(s1)
[1] -0.01922208
sd(s1)
[1] 0.9765362
mean(apply(s1, 1, mean))
[1] -0.01922208
sd(apply(s1, 1, mean))*sqrt(10)
[1] 1.007246

par(mfrow=c(3,1), mar=c(2,2,1,1))
hist(p)
hist(s1)
hist(apply(s1, 1, mean))

### 2018.9.7 ###
### Coursera DS5 W3 Statistical Inference ###

qnorm(0.95)  # N distribution
qt(0.95, 15) # T distribution

library(UsingR); data(father.son)
t.test(father.son$sheight - father.son$fheight)

library(datasets); data(ChickWeight); library(reshape2)
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var="weight")
names(wideCW)[-(1:2)] <- paste("time", names(wideCW)[-(1:2)], sep="")
library(dplyr)
wideCW <- mutate(wideCW, gain=time21-time0)

wideCW14 <- subset(wideCW, Diet %in% c(1,4))
t.test(gain ~ Diet, paired=FALSE, var.equal=TRUE, data=wideCW14)

### 2018.9.15 ###
### Coursera DS5 W4 Statistical Inference ###

mu0=30
mua=32
sigma=4
n=16
alpha=0.1
z <- qnorm(1-alpha)
pnorm(mu0 + z * sigma/sqrt(n), mean=mu0, sd=sigma/sqrt(n), lower.tail=FALSE)


library(manipulate)
mu0 = 30
myplot <- function(sigma, mua, n, alpha){
  g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mu0, sd = sigma / sqrt(n)), 
                        size = 2, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mua, sd = sigma / sqrt(n)), 
                        size = 2, col = "blue")
  xitc = mu0 + qnorm(1 - alpha) * sigma / sqrt(n)
  g = g + geom_vline(xintercept=xitc, size = 3)
  g
}
manipulate(
  myplot(sigma, mua, n, alpha),
  sigma = slider(1, 10, step = 1, initial = 4),
  mua = slider(30, 35, step = 1, initial = 32),
  n = slider(1, 50, step = 1, initial = 16),
  alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)

## 2018.9.22 ##
## playing with market data ##
## try to normalize currency data ##



japan <- filter(edf, COUT=="JP")
china <- filter(edf, COUT=="CN")
korea <- filter(edf, COUT=="SK")

norm_j <- (japan$CRATE - mean(japan$CRATE, na.rm=TRUE)) / sd(japan$CRATE, na.rm=TRUE)
norm_c <- (china$CRATE - mean(china$CRATE, na.rm=TRUE)) / sd(china$CRATE, na.rm=TRUE)
norm_k <- (korea$CRATE - mean(korea$CRATE, na.rm=TRUE)) / sd(korea$CRATE, na.rm=TRUE)

par(mfrow=c(1,1), mar=c(4,4,2,1))
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(japan, plot(DATE, norm_j, pch=16 ,col="blue", ylim=c(-3,3)))
par(new = TRUE)
with(china, plot(DATE, norm_c, pch=16 ,col="red", ylim=c(-3,3)))
par(new = TRUE)
with(korea, plot(DATE, norm_k, pch=16 ,col="black", ylim=c(-3,3)))
graphics.off()
## refer to https://www.statmethods.net/advgraphs/parameters.html

test <- tbl_df(cbind(norm_j, norm_c, norm_k))
test <- tbl_df(cbind(japan$DATE, test))
test

p <- ggplot(test, aes(`japan$DATE`)) + 
  geom_line(aes(y = norm_j), color="red") +
  geom_line(aes(y = norm_c), color="blue") +
  geom_line(aes(y = norm_k)) 
p
 
p <- ggplot(test, aes(`japan$DATE`, norm_j)) + 
  geom_point(aes(y = norm_c), color="blue") +
  geom_point(aes(y = norm_k)) +
  geom_smooth()
p

test1 <- data.frame(test)　#"melt" doesn't work with tbl_df, so I changed the class.
test2 <- melt(test1, id.vars="DATE")

g = ggplot(test2, aes(x = DATE, y = value, colour = variable)) + 
    geom_smooth() + geom_point()
(gg <- ggplotly(g))


#edf_df <- data.frame(edf)
#DATE COUT GDP IPD CPRICE UNEMP   CAB BUDGET IRATE   CRATE
CRATE_CN <- filter(edf, COUT=="CN")$CRATE
CRATE_JP <- filter(edf, COUT=="JP")$CRATE
CRATE_EU <- filter(edf, COUT=="EU")$CRATE
CRATE_IN <- filter(edf, COUT=="IN")$CRATE
CRATE_SK <- filter(edf, COUT=="SK")$CRATE
CRATE_TW <- filter(edf, COUT=="TW")$CRATE
CRATE_BZ <- filter(edf, COUT=="BZ")$CRATE

temp <- filter(edf, COUT=="CN")
norm_DATE <- temp$DATE

norm_CRATE_CN <- data.frame(CRATE_CN-mean(CRATE_CN))/sd(CRATE_CN)
norm_CRATE_JP <- data.frame(CRATE_JP-mean(CRATE_JP))/sd(CRATE_JP)
norm_CRATE_EU <- data.frame(CRATE_EU-mean(CRATE_EU))/sd(CRATE_EU)
norm_CRATE_IN <- data.frame(CRATE_IN-mean(CRATE_IN))/sd(CRATE_IN)
norm_CRATE_SK <- data.frame(CRATE_SK-mean(CRATE_SK))/sd(CRATE_SK)
norm_CRATE_TW <- data.frame(CRATE_TW-mean(CRATE_TW))/sd(CRATE_TW)
norm_CRATE_BZ <- data.frame(CRATE_BZ-mean(CRATE_BZ))/sd(CRATE_BZ)

norm_CRATE_CN$DATE <- norm_DATE
norm_CRATE_JP$DATE <- norm_DATE
norm_CRATE_EU$DATE <- norm_DATE
norm_CRATE_IN$DATE <- norm_DATE
norm_CRATE_SK$DATE <- norm_DATE
norm_CRATE_TW$DATE <- norm_DATE
norm_CRATE_BZ$DATE <- norm_DATE

names(norm_CRATE_CN) <- c("CN", "DATE")
names(norm_CRATE_JP) <- c("JP", "DATE")
names(norm_CRATE_EU) <- c("EU", "DATE")
names(norm_CRATE_IN) <- c("IN", "DATE")
names(norm_CRATE_SK) <- c("SK", "DATE")
names(norm_CRATE_TW) <- c("TW", "DATE")
names(norm_CRATE_BZ) <- c("BZ", "DATE")

bound_CRATE <- cbind(norm_CRATE_CN,norm_CRATE_JP,norm_CRATE_EU,norm_CRATE_IN,norm_CRATE_SK,norm_CRATE_TW,norm_CRATE_BZ)
bound_CRATE2 <- bound_CRATE[, -c(2,4,6,8,10,12)]
test1 <- data.frame(bound_CRATE2)　#"melt" doesn't work with tbl_df, so I changed the class.
test2 <- melt(test1, id.vars="DATE")

#edf_nonSK <- filter(edf, COUT!="SK")
g = ggplot(test2, aes(x = DATE, y = value, colour = variable)) + 
    geom_smooth() + geom_point()
g


temp1 <- mutate(cdf, norm_ALL = (`All items`-mean(cdf$`All items`))/sd(cdf$`All items`))
temp2 <- mutate(temp1, norm_Food = (Food-mean(cdf$Food))/sd(cdf$Food))
temp3 <- mutate(temp2, norm_Metals = (Metals-mean(cdf$Metals))/sd(cdf$Metals))
temp4 <- mutate(temp3, norm_Gold = (Gold-mean(cdf$Gold))/sd(cdf$Gold))
temp5 <- mutate(temp4, norm_WTI = (WTI-mean(cdf$WTI))/sd(cdf$WTI))
temp6 <- temp5[, -c(2:6)]
temp7 <- data.frame(temp6)
norm_cdf <- melt(temp7, id.vars="DATE")

g = ggplot(norm_cdf, aes(x = DATE, y = value, colour = variable)) + 
    geom_smooth() + geom_point()
(gg <- ggplotly(g))


temp1 <- mutate(sdf, norm_DJIA = (DJIA-mean(sdf$DJIA))/sd(sdf$DJIA))
temp2 <- mutate(temp1, norm_SP = (`S&P`-mean(sdf$`S&P`))/sd(sdf$`S&P`))
temp3 <- mutate(temp2, norm_NAScomp = (NAScomp-mean(sdf$NAScomp))/sd(sdf$NAScomp))
temp4 <- mutate(temp3, norm_SSEB = (SSEB-mean(sdf$SSEB))/sd(sdf$SSEB))
temp5 <- mutate(temp4, norm_Nikkei = (Nikkei-mean(sdf$Nikkei))/sd(sdf$Nikkei))
temp6 <- mutate(temp5, norm_DAX = (DAX-mean(sdf$DAX))/sd(sdf$DAX))
temp7 <- mutate(temp6, norm_BSE = (BSE-mean(sdf$BSE))/sd(sdf$BSE))
temp8 <- mutate(temp7, norm_KOSPI = (KOSPI-mean(sdf$KOSPI))/sd(sdf$KOSPI))
temp9 <- mutate(temp8, norm_TWI = (TWI-mean(sdf$TWI))/sd(sdf$TWI))
temp10 <- mutate(temp9, norm_BVSP = (BVSP-mean(sdf$BVSP))/sd(sdf$BVSP))
temp11 <- temp10[, -c(2:15)]
temp12 <- data.frame(temp11)
#norm_sdf <- melt(temp12, id.vars="DATE")
norm_sdf <- melt(temp12[, c(1, 2, 6:10)], id.vars="DATE")
g = ggplot(norm_sdf, aes(x = DATE, y = value, colour = variable)) + 
    geom_smooth() + geom_point()
g

# !diagnostics off
sdfdate <- sdf$DATE
cdfdate <- cdf$DATE
test <- data.frame(sdfdate)
test$cdfdate <- cdfdate

#############################################
# 2018.9.29 combination and permutation
#############################################

###
d=c(1:9)
for (i in 1:9) {
  d[i] <- dbinom(i-1, size=8, prob=0.5)
}

p=c(1:9)
for (i in 1:9) {
  p[i] <- pbinom(i-1, size=8, prob=0.5, lower.tail=TRUE)
}

In title(main = main, sub = sub, xlab = xlab, ylab = ylab, ...) 

### 2018.9.30
### DS W1 quiz

fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit) # show results

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
fit <- lm(y ~ x)
fit
plot(y, x)
par(mfrow=c(1,1), mar=c(4,4,2,1))
plot(y, x)
plot(x, y)
abline(lm(y~x))

data(mtcars)
 mpg as the outcome and weight as the predictor. 
 
### 2018.10.7 ###
### Visualize the results of the promotion tests ### 

library(reshape2)
x <- read.csv("PTest.csv")
x1 <- as.matrix(x[3:7, 1:8])
x2 <- tbl_df(mapply(x[3:7, 1:8], FUN=as.integer)) 
names(x2) <- c("Year", "Priority", "Role", "Judgement", "Leadership", "Understanding", "Expression", "Contents" )
x3 <- mutate(x2, Rate = (Priority + Role + Judgement + Leadership + Understanding + Expression + Contents)/21)
x4 <- melt(x3, id.vars="Year")
inb <- filter(x4, variable=="Priority" | variable=="Role" | variable=="Judgement" | variable=="Leadership")
paper <- filter(x4, variable=="Understanding" | variable=="Expression" | variable=="Contents")

g = ggplot(inb, aes(x = Year, y = value, colour = variable)) +
    #geom_smooth() + geom_point()
    geom_line()
g

par(mfrow=c(2,4), mar=c(4,4,2,1))
with(x3, barplot(Priority, Year, ylim=c(0, 3), ylab="Priority"))
abline(h=mean(x3$Priority))
with(x3, barplot(Role, Year, ylim=c(0, 3), ylab="Role"))
abline(h=mean(x3$Role))
with(x3, barplot(Judgement, Year, ylim=c(0, 3), ylab="Judgement"))
abline(h=mean(x3$Judgement))
with(x3, barplot(Leadership, Year, ylim=c(0, 3), ylab="Leadership"))
abline(h=mean(x3$Leadership))
with(x3, barplot(Understanding, Year, ylim=c(0, 3), ylab="Understanding"))
abline(h=mean(x3$Understanding))
with(x3, barplot(Expression, Year, ylim=c(0, 3), ylab="Expression"))
abline(h=mean(x3$Expression))
with(x3, barplot(Contents, Year, ylim=c(0, 3), ylab="Contents"))
abline(h=mean(x3$Contents))
with(x3, barplot(Rate, Year, ylim=c(0, 1), ylab="Rate"))
abline(h=mean(x3$Rate))


###################################################
# 2018.10.8 Mon
# DS7 W2 Quiz, Regression model
###################################################
data(mtcars)
with(mtcars, plot(wt, mpg))
with(mtcars, abline(lm(mpg~wt)))
mean(mtcars$wt)
points(3.21725, 20.09202, pch=19)
lm(mtcars$mpg~mtcars$wt)
mpg2 <- -5.344*mtcars$wt + 37.285
t.test(mtcars$mpg, mpg2)

data(mtcars)
with(mtcars, plot(wt, mpg))
with(mtcars, abline(lm(mpg~wt)))
cof <- lm(mtcars$mpg~mtcars$wt)$coefficients

install.packages("Metrics")
library(Metrics)
mse(mtcars$mpg, cof[1])
mse(mtcars$mpg, cof[1] + cof[2]*mtcars$wt)

mpg.res = resid(lm)

x<-c(0.61,0.93,0.83,0.35,0.54,0.16,0.91,0.62,0.62)
y<-c(0.67,0.84,0.6,0.18,0.85,0.47,1.1,0.65,0.36)
t.test(x)
2 * pt(7.3157, 8, lower=FALSE)
t.test(x, mu=0.6188889*2, conf.level=0.95)

par(mfrow=c(1,1), mar=c(4,4,2,1))
pval <- c(0:10)
mu <- c(0:10)
for (i in 1:11){
  mu[i] <- (i-1)/10
  pval[i] <- t.test(y, mu=mu[i], conf.level=0.95)$p.value
}
par(mfrow=c(1,2), mar=c(4,4,2,1))
plot(pval, mu)
lines(mu,pval)
boxplot(y)
hist(y)
lines(y)
boxplot(y)
plot(sort(y))

### 2018.10.15
### from DS7 W2 Quiz
x<-c(0.61,0.93,0.83,0.35,0.54,0.16,0.91,0.62,0.62)
y<-c(0.67,0.84,0.6,0.18,0.85,0.47,1.1,0.65,0.36)
plot(lm(y~x))
plot(x, y)
abline(lm(y~x))
par(mfrow=c(2,2), mar=c(4,4,2,1)) 
plot(lm(y~x))

data(mtcars)  
fit <- lm(mpg ~ I(wt - mean(wt)), data=mtcars)
confint(fit)

# confint(lm(mtcars$mpg~ mtcars$wt))

par(mfrow=c(1,1), mar=c(4,4,2,1))
par(mfrow=c(2,2), mar=c(4,4,2,1))
x<-c(0.61,0.93,0.83,0.35,0.54,0.16,0.91,0.62,0.62)
y<-c(0.67,0.84,0.6,0.18,0.85,0.47,1.1,0.65,0.36)
pval <- c(0:100)
mu <- c(0:100)
for (i in 1:101){
  mu[i] <- (i-1)/100
  pval[i] <- t.test(y, mu=mu[i], conf.level=0.95)$p.value
}
plot(x, y) 
lines(mu, pval)
hist(y)
lines(mu, pval)
plot(density(x))

fit <- lm(mpg ~ I(wt - mean(wt)), data=mtcars)



### 2018.10.14
### DS6-Quiz3

# In a population of interest, 
# a sample of 9 men yielded a sample average brain volume of 1,100cc 
# and a standard deviation of 30cc. What is a 95% Student 
# T confidence interval for the mean brain volume in this new population?

> 1100 + c(-1, 1)*qt(0.975, 8)*30/sqrt(9)
[1] 1076.94 1123.06

# A diet pill is given to 9 subjects over six weeks. 
# The average difference in weight (follow up - baseline) is -2 pounds. 
# What would the standard deviation of the difference in weight 
# have to be for the upper endpoint of the 95% T confidence interval 
# to touch 0?
  
> sqrt(9) * 2 /qt(0.975, 8)
[1] 2.601903

function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])

#pooled standard deviation
sp <- sqrt( ((10-1)*0.6 + (10-1)*0.68) / (10+10-2) ) 
sp <- sqrt( ((100-1)*2^2 + (10-1)*0.5^2) / (100+100-2) ) 
sp <- sqrt( ((9-1)*1.5^2 + (9-1)*1.8^2) / (9+9-2) ) 


### 2018.10.15
### DS6 Statistic Inference W4 

par(mfrow=c(1,2))
hist(runif(1000))
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)

Based on CLT, the mean of the mns is the mean of numbers generated by runif(1000) with a 95% confidence interval of +/- 2 times the standard error, which is 0.5/sqrt(40).

base <- c(140, 138, 150, 148, 135)
week2 <- c(132, 135, 151, 146, 130)

t.test(base, week2, paired=TRUE)
boxplot(base, ylim=c(130, 150))
abline(h=135)
boxplot(week2, ylim=c(130, 150))
abline(h=135)
hist(rt(1000, 4, mean(base)), xlim=c(-100, 1400))
hist(rt(1000, 4, mean(week2)), xlim=c(-100, 1400))

df=91-1, 1100cc, sd=30
c(-1, 1) * qt(0.975, 8) * 30 / 3

# 2018.10.20
# Install Galton height data
library(devtools)
library(Biobase)
library(UsingR)

install.packages(c("devtools","UsingR"))
source("http://www.bioconductor.org/biocLite.R")
biocLite(c("Biobase"))

data(galton)

# 2018.10.25
# Regression practice with "swiss"
par(mfrow=c(1,1))
with(swiss, plot(Fertility~Agriculture))
fit <- lm(Fertility~Agriculture, swiss)
abline(fit)
confint(fit)
predict(fit, newdata=data.frame(Agriculture=40), interval="prediction")
points(matrix(c(40, 40, 40, 68.07245, 43.96503, 92.17986), nrow=3, ncol=2), pch=19)

group_by(InsectSprays, spray) %>% mean()
--------------------------------------------
# 2018.10.26
# To create R markdown file
# File - New File - R markdown...
#--------------------------------------------

all <- lm(Fertility ~., data=swiss)
all

summary(all)

Recall that the Estimates are the coefficients of the independent variables of the linear model (all of which are percentages) and they reflect an estimated change in the dependent variable (fertility) when the corresponding independent variable
 changes. So, for every 1% increase in percent of males involved in agriculture as an occupation we expect a .17 decrease in fertility, holding all the other variables constant; for every 1% increase in Catholicism, we expect a .10 increase in fertility, holding all other variables constant.
 
data("InsectSprays")
head(InsectSprays, 15)
fit <- lm(count~spray, InsectSprays)
summary(fit)$coef

library(dplyr)
sA <- filter(InsectSprays, spray=="A")
sB <- filter(InsectSprays, spray=="B")
sC <- filter(InsectSprays, spray=="C")
sD <- filter(InsectSprays, spray=="D") 
sE <- filter(InsectSprays, spray=="E")
sF <- filter(InsectSprays, spray=="F")
A <- sA[, 1]
B <- sB[, 1]
C <- sC[, 1]
D <- sD[, 1]
E <- sE[, 1]
F <- sF[, 1]
IS <- cbind(A, B, C, D, E, F) 
boxplot(IS, col="gray")

#--------------------------------------------
# 2018.10.28
# 1. Write a data frame to a csv file
#--------------------------------------------

e.g) write.csv(healthstudy,'healthstudy2.csv')

freqData <- as.data.frame(table(galton$child, galton$parent))
names(freqData) <- c("child", "parent", "freq")
plot(as.numeric(as.vector(freqData$parent)), 
     as.numeric(as.vector(freqData$child)),
     pch = 21, col = "black", bg = "lightblue",
     cex = .15 * freqData$freq, 
     xlab = "parent", ylab = "child")

#--------------------------------------------
# 2018.11.3
# 1. Scrape web sites
# 2. Transforming dates
#--------------------------------------------
### copied from https://towardsdatascience.com/web-scraping-tutorial-in-r-5e71fd107f32
install.packages("rvest")
# Load packages
library(rvest)
library(stringr)
library(dplyr)
library(lubridate)
library(readr)

# Read web page
webpage <- read_html("https://www.nasdaq.com/symbol/aapl")

# Extract records info
results <- webpage %>% html_nodes(".short-desc")

# Building the dataset
records <- vector("list", length = length(results))

for (i in seq_along(results)) {
  date <- str_c(results[i] %>% 
                  html_nodes("strong") %>% 
                  html_text(trim = TRUE), ', 2017')
  lie <- str_sub(xml_contents(results[i])[2] %>% html_text(trim = TRUE), 2, -2)
  explanation <- str_sub(results[i] %>% 
                           html_nodes(".short-truth") %>% 
                           html_text(trim = TRUE), 2, -2)
  url <- results[i] %>% html_nodes("a") %>% html_attr("href")
  records[[i]] <- data_frame(date = date, lie = lie, explanation = explanation, url = url)
}

df <- bind_rows(records)

# Transform to datetime format
df$date <- mdy(df$date)

# Export to csv
write_csv(df, "trump_lies.csv")

# ------------------------------------------------
# 2018.11.7 Wed
# DS8 Practical ML W2 Quiz
# ------------------------------------------------
install.packages("AppliedPredictiveModeling")
install.packages("caret")
library(caret)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

#Which of the following commands will create non-overlapping training and test sets with about 50% of the observations assigned to each?
  
adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

pairs(mixtures)

fit <- lm(CompressiveStrength~., training)
summary(fit)

qplot(CompressiveStrength, FlyAsh, data=training)

library(Hmisc)
cutCem <- cut2(training$Cement, g=3)
table(cutCem)
pCem <- qplot(cutCem, CompressiveStrength, data=training, fill=cutCem,
            geom=c("boxplot"))
pCem

cutB <- cut2(training$BlastFurnaceSlag, g=3)
table(cutB)
pB <- qplot(cutB, CompressiveStrength, data=training, fill=cutB,
            geom=c("boxplot"))
pB

cutF <- cut2(training$FlyAsh, g=3)
table(cutF)
pF <- qplot(cutF, CompressiveStrength, data=training, fill=cutF,
            geom=c("boxplot"))
pF

cutA <- cut2(training$Age, g=3)
table(cutA)
pA <- qplot(cutA, CompressiveStrength, data=training, fill=cutA,
            geom=c("boxplot"))
pA

install.packages("cowplot")
library("cowplot")
plot_grid(pCem, pB, pF, pA , 
          labels = c("Cement", "BlastFurnaceSlag", "FlyAsh", "Age"),
          ncol = 2, nrow = 2)

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433);data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

cnames[grep("IL", cnames)]

> grep("IL", cnames)
 [1]  58  59  60  61  62  63  64  65  66  67  68  69 111

install.packages('e1071', dependencies=TRUE)
preProc <- preProcess(adData[,c(1, 58:69)], method="pca", pcaComp=12)
adDataPC <- predict(preProc, adData[,c(1, 58:69)])
plot(adDataPC[,1], adDataPC[,2])

M <- abs(cor(adData[,c(58:69)]))
diag(M) <- 0
which(M > 0.7,arr.ind=T)


typeColor <- ((adData$diagnosis=="Impaired")*1 + 1)
prComp <- prcomp(log10(adData[,-1]+1))
plot(prComp$x[,1],prComp$x[,2],col=typeColor,xlab="PC1",ylab="PC2")

# with PCA
training2 <- training[,c(1, 58:69)]
preProc <- preProcess(training2, method="pca",pcaComp=2)
trainPC <- predict(preProc,training2)
modelFit <- train(diagnosis ~.,method="glm",data=trainPC)

testPC <- predict(preProc,testing[,c(58:69)])
confusionMatrix(testing$diagnosis,predict(modelFit,testPC))

# without PCA
rm(testPC)
training2 <- training[,c(1, 58:69)]
#preProc <- preProcess(training2, method="pca",pcaComp=2)
#trainPC <- predict(preProc,training2)
modelFit <- train(diagnosis ~.,method="glm",data=training2)

testPC <- predict(training2,testing[,c(58:69)])
confusionMatrix(testing$diagnosis,predict(modelFit,testPC))

# ------------------------------------------------
# 2018.11.9 Fri
# Scraping
# ------------------------------------------------
install.packages("V8")
library(rvest)
library(V8)

URL <- "http://projects.fivethirtyeight.com/2016-election-forecast/washington/#now"
pg <- read_html(URL)
js <- html_nodes(pg, xpath=".//script[contains(., 'race.model')]") %>%  html_text()
ctx <- v8()
ctx$eval(JS(js))
race <- ctx$get("race", simplifyVector=FALSE)
length(race)

URL <- "http://www.data.jma.go.jp/obd/stats/etrn/view/monthly_s3.php?%20prec_no=44&block_no=47662"
pg <- read_html(URL)

# ------------------------------------------------
# 2018.11.10 Sat
# Applying t-test on EMS study
# ------------------------------------------------

# If you have a test result of 3/3 passes and 0/3 fails, how much you can say it's no problem.
# Tested with 1kV
1 + c(-1, 1)*qt(0.975, df=2)*0.1/sqrt(3)

x0 <- c(1.1, 0.7, 1, 0.9, 1, 0.8)
x1 <- c(1, 1, 5, 3, 4, 5)
x2 <- c(rep(1, 10), 0)
t.test(x0, x1, conf.level=0.99)
barplot(x0, ylim=c(0, 6))
barplot(x1, ylim=c(0, 6))

# ------------------------------------------------
# 2018.11.10 Sat
# Boxplot and density test
# ------------------------------------------------
library(lattice)
library(grid)
library(gridExtra)
library(ggplot2)
cutWt <- cut2(mtcars$wt, g=2)
table(cutWt)

# boxplot
p1 <- qplot(mpg, wt, data=mtcars, fill=cutWt, geom=c("boxplot"))
p2 <- qplot(mpg, wt, data=mtcars, fill=cutWt, geom=c("boxplot", "jitter"))
grid.arrange(p1,p2,ncol=2)

# table
t1 <- table(cutWt,mtcars$wt)
prop.table(t1,1)

# density plot
qplot(mpg,colour=cutWt,data=mtcars,geom="density")


# ------------------------------------------------
# 2018.11.10 Sat
# Preprocessing 
# ------------------------------------------------
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)  # inTrain is a vector of row indeces of spam
training <- spam[inTrain,]
testing <- spam[-inTrain,]

M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M > 0.75,arr.ind=T)  # Look for highly correlated variables
names(spam)[c(34,32)]
plot(spam[,34],spam[,32])

X <- 0.71*training$num415 + 0.71*training$num857  
Y <- 0.71*training$num415 - 0.71*training$num857
plot(X,Y)  # X is better than Y in terms of describing the data of num415 and num857

smallSpam <- spam[,c(34,32)]
prComp <- prcomp(smallSpam)
plot(prComp$x[,1],prComp$x[,2]) 

prComp$rotation  # the eigenvector matrix

typeColor <- ((spam$type=="spam")*1 + 1)
prComp <- prcomp(log10(spam[,-58]+1))
plot(prComp$x[,1],prComp$x[,2],col=typeColor,xlab="PC1",ylab="PC2")

# PCA with caret
preProc <- preProcess(log10(spam[,-58]+1),method="pca",pcaComp=2)
spamPC <- predict(preProc,log10(spam[,-58]+1))
plot(spamPC[,1],spamPC[,2],col=typeColor)

# Preprocessing with PCA
preProc <- preProcess(log10(training[,-58]+1),method="pca",pcaComp=2)
trainPC <- predict(preProc,log10(training[,-58]+1))
modelFit <- train(training$type ~ .,method="glm",data=trainPC)

testPC <- predict(preProc,log10(testing[,-58]+1))
confusionMatrix(testing$type,predict(modelFit,testPC))

# Alternative
modelFit <- train(training$type ~ .,method="glm",preProcess="pca",data=training)
confusionMatrix(testing$type,predict(modelFit,testing))

# ------------------------------------------------
# 2018.11.11 Sun
# Quiz4 of Regression model
# ------------------------------------------------

#install.packages("MASS")
library("MASS")
data(shutlle)

logRegShuttle <- glm(shuttle$use ~ shuttle$wind,family="binomial")
summary(logRegShuttle)
plot(shuttle$wind,logRegShuttle$fitted,pch=19,col="blue",xlab="wind",ylab="Prob autolander use")

exp(logRegShuttle$coeff)
exp(confint(logRegShuttle))

anova(logRegShuttle,test="Chisq")

# ------------------------------------------------
# 2018.11.11 Sun
# Merge edf, sdf and cdf
# ------------------------------------------------

# adjust measurements of sdf
sdf2 <- sdf[-8, ]
esdf <- cbind(x5, sdf2)

# also adjust measurements of cdf
cdf2 <- cdf[-8, ]
escdf <- cbind(esdf, cdf2)

# remove DATE of sdf and cdf
escdf2 <- escdf[, -c(74, 89)]
escdf3 <- escdf2[, -c(58, 66)]
IBND = c(32.86,31.50,33.05,32.56,33.26,33.42,
         32.93,32.11,30.56,31.10,31.29,30.98,32.09,
         32.99,33.48,34.80,35.00,34.67,34.32,34.87,
         35.70,36.21,35.89,36.12,34.16,33.63,33.94,
         33.32,33.98,33.15)
escdf3 <- cbind(escdf3, IBND)
#write.csv(escdf3,'escdf3.csv')
escdf3 <- read.csv("escdf3.csv")

# Now ready to perform analysis
par(mfrow=c(1,1))
par(mfrow=c(2,2))
fit <- lm(Gold~FX.JP, escdf3); plot(Gold~FX.JP, escdf3); abline(fit)
fit <- lm(Gold~GDP.CN, escdf3); plot(Gold~GDP.CN, escdf3); abline(fit)
fit <- lm(Gold~GDP.IN, escdf3); plot(Gold~GDP.IN, escdf3); abline(fit)
fit <- lm(Gold~IR.US, escdf3); plot(Gold~IR.US, escdf3); abline(fit)

fit <- lm(Gold~CP.CN, escdf3); plot(Gold~CP.CN, escdf3); abline(fit)
fit <- lm(Gold~FX.CN, escdf3); plot(Gold~FX.CN, escdf3); abline(fit)
fit <- lm(Gold~CP.IN, escdf3); plot(Gold~CP.IN, escdf3); abline(fit)
fit <- lm(Gold~FX.IN, escdf3); plot(Gold~FX.IN, escdf3); abline(fit)
# Gold price depreciates as Chinese, Indian and Japanese currency drops, meaning that
# it fell as US dollar goes up. So Gold price will go up again once the trend of strong 
# dollar has changed, by the impeachment of the president or something.
# 95% CI is 1250 to 1289 but the current price is 1210. It's time to buy more.

packageVersion("plotly")
setwd("/Users/keijiharada")
escdf3 <- read.csv("escdf3.csv")
x <- data.frame(escdf3)
plot_ly(data=x, x=x$FX.CN, y=x$Gold)


par(mfrow=c(1,1))
fit <- lm(Gold~DATE, escdf3); plot(Gold~DATE, escdf3); abline(fit)

plot(Gold~DATE, escdf3, ylim=c(1000, 1350))
fit <- lm(Gold~DATE, escdf3)
abline(fit)
lines(Gold~DATE, escdf3)
IBND2 <- IBND*36
points(IBND2~DATE, escdf3, pch=19)
cor(escdf3$IBND, escdf3$Gold)   #  0.58 * World bonds
cor(escdf3$FX.JP, escdf3$Gold)  # -0.61 * Yen
cor(escdf3$FX.IN, escdf3$Gold)  # -0.52 * Rupee
cor(escdf3$FX.CN, escdf3$Gold)  # -0.75 * Yuan
cor(escdf3$IR.US, escdf3$Gold)  # -0.30

fit <- lm(IBND~DATE, escdf3); plot(IBND~DATE, escdf3); abline(fit)
lines(IBND~DATE, escdf3)
points(FX.CN*184.6154~DATE, escdf3, pch=19)

# If the next 100 years are of Asian countries such as China and India, 
# is there any reason you dont but Gold!?


boxplot(escdf3$Gold)
t.test(escdf3$Gold)

par(mfrow=c(1,1))
par(mfrow=c(2,2))
fit <- lm(Gold~FX.SK, escdf3); plot(Gold~FX.SK, escdf3); abline(fit)
fit <- lm(Gold~WTI, escdf3); plot(Gold~WTI, escdf3); abline(fit)
fit <- lm(Gold~VIX, escdf3); plot(Gold~VIX, escdf3); abline(fit)
fit <- lm(Gold~`World bonds`, escdf3); plot(Gold~`World bonds`, escdf3); abline(fit)
fit <- lm(World.bonds~DATE, escdf3); plot(World.bonds~DATE, escdf3); abline(fit)
lines(World.bonds~DATE, escdf3)

fit <- lm(IBND~DATE, escdf3); plot(IBND~DATE, escdf3); abline(fit)
lines(IBND~DATE, escdf3)
fit <- lm(Gold~IBND, escdf3); plot(Gold~IBND, escdf3); abline(fit)
cor(escdf3$Gold,escdf3$IBND)   # 0.57

fit <- lm(Nikkei~FX.JP, escdf3); plot(Nikkei~FX.JP, escdf3); abline(fit)
fit <- lm(Nikkei~GDP.JP, escdf3); plot(Nikkei~GDP.JP, escdf3); abline(fit)
fit <- lm(Nikkei~IP.JP, escdf3); plot(Nikkei~IP.JP, escdf3); abline(fit)
fit <- lm(Nikkei~DJIA, escdf3); plot(Nikkei~DJIA, escdf3); abline(fit)
# Nikkei has a very strong correlation with Dow Jones Index.

fit <- lm(DATE~UNEMP.CN, escdf3); plot(DATE~UNEMP.CN, escdf3); abline(fit)

cor(escdf3$Nikkei,escdf3$DJIA)   # 0.97
cor(escdf3$IP.JP,escdf3$FX.JP)   # 0.51

View(names(escdf2)) 
par(mfrow=c(1,1))
par(mfrow=c(2,2))

# clear NA before performing linear model

escdf4 <- escdf3[, -c(42:49)]
x <- is.na(escdf4)
apply(x, 1, sum)
escdf4[11, 10] <- 0.5   # IP.US on 2017.3.17
escdf4[11, 24] <- 0.85  # CP.TW on 2017.3.17
escdf4[30, 76] <- 932   # worl bonds on 2018.10.20

library(car)
#svd(escdf4[, -1])
fit <- lm(Gold ~ GDP.US+GDP.CN+GDP.JP+GDP.EU+GDP.IN+GDP.SK+GDP.TW+GDP.BZ, data=escdf4, singular.ok = FALSE)
vif(fit)

fit <- lm(Gold ~ FX.CN+FX.IN+FX.JP+`World bonds`, data=escdf4, singular.ok = FALSE)
predict(fit, newdata=data.frame(FX.CN=10, FX.IN=3, FX.JP=100, `World bonds`=1000), interval="prediction")




# ------------------------------------------------
# 2018.11.13 Tue
# a world bond index alternative to Citigroup world bonds
# ------------------------------------------------
IBND = c(32.86,31.50,33.05,32.56,33.26,33.11,33.42,32.93,32.11,30.56,31.10,31.29,30.98,32.09,32.99,33.48,34.80,35.00,34.67,34.32,34.87,35.70,36.21,35.89,36.12,34.16,33.63,33.94,33.32,33.98,33.15)

# ------------------------------------------------
# 2018.11.16 Fri
# test "add" option on plot
# ------------------------------------------------
data(mtcars)
data(swiss)

plot(swiss$Fertility, swiss$Education)
plot(swiss$Fertility, swiss$Examination, col=rgb(1,0,0,1/4), add=TRUE)

p1 <- plot(swiss$Fertility, swiss$Education, plot=FALSE)
p2 <- plot(swiss$Fertility, swiss$Examination, plot=FALSE)
#yrange <- c(0, max(p1$Education, p2$Examination))
plot(p1, col=rgb(0,0,1,1/4), xlim=range(swiss$Fertility), ylim=c(0, 50))
plot(p2, col=rgb(1,0,0,1/4), xlim=range(swiss$Fertility), ylim=c(0, 50), add=TRUE)

p1 <- hist(swiss$Education, plot=FALSE)
p2 <- hist(swiss$Fertility, plot=FALSE)
yrange <- c(0, max(p1$counts, p2$counts))
plot(p1, col=rgb(0,0,1,1/4), xlim=range(swiss), ylim=yrange, xlab="Estimated coefficient of x1",
     main="Bias Effect of Omitted Regressor")
plot(p2, col=rgb(1,0,0,1/4), xlim=range(swiss), ylim=yrange, add=TRUE)

data("InsectSprays")
summary(InsectSprays)
par(mfrow=c(2,2))
boxplot(InsectSprays)
names(swiss)
hist(swiss$Agriculture)


# ------------------------------------------------
# 2018.11.17 Sat
# review dbinom, pbinom
# Quiz 4 of Regression model
# ------------------------------------------------
dbinom(4, size=12, prob=0.2) # p-value of getting 4 out of 12 five-options. 
pbinom(4, size=12, prob=0.2) # p-value of getting 1 to 4 out of 12 five-options. 

h0 <- c(140, 138, 150, 148, 135)
ha <- c(132, 135, 151, 146, 130) 

t.test(ha, h0, paired=TRUE, alternative="two.sided")
plot(density(h0))

1100 + c(-1, 1) * qt(0.975, 8) * 30/sqrt(9)




> anova(fit1, fit3)
Analysis of Variance Table

Model 1: Fertility ~ Agriculture
Model 2: Fertility ~ Agriculture + Examination + Education
Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1     45 6283.1                                  
2     43 3180.9  2    3102.2 20.968 4.407e-07 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# ------------------------------------------------
# 2018.11.19 Mon
# function "order"
# ------------------------------------------------

attach(mtcars)
newdata <- mtcars[order(mpg),] 
newdata <- mtcars[order(mpg, cyl),]
newdata <- mtcars[order(mpg, -cyl),]
detach(mtcars)

# ------------------------------------------------
# 2018.11.20 Tue
# play with market data
# ------------------------------------------------

par(mfrow=c(1,1))
fit1 <- lm(escdf3$DJIA~escdf3$DATE); plot(escdf3$DJIA~escdf3$DATE); lines(escdf3$DJIA~escdf3$DATE)
fit1 <- lm(escdf3$DJIA[20:30]~escdf3$DATE[20:30]); plot(escdf3$DJIA[20:30]~escdf3$DATE[20:30]); lines(escdf3$DJIA[20:30]~escdf3$DATE[20:30])
fit1 <- lm(escdf3$WTI~escdf3$DATE); plot(escdf3$WTI~escdf3$DATE); lines(escdf3$WTI~escdf3$DATE)

par(mfrow=c(2,2))
x <- c(escdf3$DJIA[20:30], 25070)
plot(x)
lines(x)


x <- c(escdf3$NAScomp[20:30], 7028)
plot(x)
lines(x)

# ------------------------------------------------
# 2018.11.21 Wed
# Quiz4 of DS Statistic inference
# ------------------------------------------------

c <- c(1, 1, 1, 1, 0)
p <- c(0, 0, 0, 0, 1)
t.test(c, p, paired = TRUE)
t.test(p, c, paired = TRUE)
t.test(c)


# ------------------------------------------------
# 2018.11.23 Fri
# Quiz4 of DS Regression model
# ------------------------------------------------

useNum <- c(1:length(shuttle$use))
for (i in 1:length(shuttle$use)) {
  if (shuttle$use[i]=="auto"){
    useNum[i] <- 1
  }
  else {
    useNum[i] <- 0
  }
}
shuttle2 <- cbind(shuttle, useNum)
mdl <- glm(useNum ~ wind, family="binomial", shuttle2)
lodds <- predict(mdl, data.frame(wind=c("head", "tail")))
odds <- exp(lodds)/(1+exp(lodds))
odds[1]/odds[2]

mdl <- glm(useNum ~ wind + magn, family="binomial", shuttle2)
lodds <- predict(mdl, data.frame(wind=c("head", "tail"), magn=c("Light", "Medium", "Out", "Strong")))
odds <- exp(lodds)/(1+exp(lodds))
odds[1]/odds[2]

mdl <- glm(useNum ~ wind, family="binomial", shuttle2)

# ------------------------------------------------
# 2018.11.23 Fri
# Quiz3-1 of DS Regression model
# ------------------------------------------------
mtcars
> fit <- lm(mpg ~ cyl + wt, mtcars)
> summary(fit)$coefficients
Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 39.686261  1.7149840 23.140893 3.043182e-20
cyl         -1.507795  0.4146883 -3.635972 1.064282e-03
wt          -3.190972  0.7569065 -4.215808 2.220200e-04
> -1.507795 * 4
[1] -6.03118

> fit2 <- lm(mpg ~ cyl, mtcars)
> summary(fit2)$coefficients
Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 37.88458  2.0738436 18.267808 8.369155e-18
cyl         -2.87579  0.3224089 -8.919699 6.112687e-10

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)




# ------------------------------------------------
# 2018.11.24 Sat
# DS7, Video Multivariate regression PartII continued
# ------------------------------------------------

# How to use "coef()"
fit <- lm(Fertility ~ Education, swiss)
coef(fit)

which.max(hits[, 'visits'])

# ------------------------------------------------
# 2018.11.25 Sun 
# DS7, Quiz3
# ------------------------------------------------
install.packages("lmtest")
library(lmtest)
 # Thought to use relative something test but figured out that 
 # anova can do the same thing.


# ------------------------------------------------
# 2018.11.26 Mon 
# DS7, Quiz4
# ------------------------------------------------
# #4 Poisson regression

head(InsectSprays)
mdl1 <- glm(count ~ factor(spray), data=InsectSprays, family="poisson")
summary(mdl1)
1-exp(0.05588)

mdl1 <- glm(count ~ spray, data=InsectSprays, family="poisson")
round(exp(mdl1$coefficients[1])/exp(mdl1$coefficients[1]+mdl1$coefficients[2]), 4)


# #6 
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
# Using a knot point at 0, fit a linear model that looks like a hockey stick 
# with two lines meeting at x=0. Include an intercept term, x and the knot point term. 
# What is the estimated slope of the line after 0?

fit <- lm(y~x)
abline(fit)  
fit <- lm(y[6:11]~x[6:11])  
abline(fit, color="red")
summary(fit)


# ------------------------------------------------
# 2018.11.26 Mon 
# DS7, Week4
# How to use "manipulate" 
# ------------------------------------------------
library(manipulate) 
x <- seq(-10, 10, length=1000)
manipulate(
  plot(x, exp(beta0 + beta1 * x) / (1 + exp(beta0 + beta1 * x)),
       type = "l", lwd=3, frame=FALSE),
  beta1 = slider(-2, 2, step=.1, initial=2),
  beta0 = slider(-2, 2, step=.1, initial=0)
)

par(mfrow=c(1,1))
x <- seq(-10, 10, length=100)
manipulate(
  plot(x, x^power, type="l", lwd=3, frame=FALSE),
  power = slider(-3, 3, step=.1, initial=1)
)


# ------------------------------------------------
# 2018.11.28 Wed 
# DS7, Week4
# Understand "OLS" and "MLE"
# Understand "log-likelihood
# ------------------------------------------------
x <- c(115,122,130,127,149,160,152,138,149,180)
mdl <- glm(y~x, family="gaussian", x) # this doesn't work. you'll get errors

# ------------------------------------------------
# 2018.11.29 Thu 
# 
# ------------------------------------------------

# play with the GDP data.
gdp %>% gather(ITEM.COUNTRY, NUMBERS , -DATE) %>% separate(ITEM.COUNTRY, c("ITEM","COUNTRY"))

# play with the EMI data
re    <- tbl_df(read.csv("EMI-RE.csv"))
re[, c(1, 10,11)] %>% gather(Orientation, Margin, -Freq, )

# ------------------------------------------------
# 2018.11.30 Fri 
# DS8 Practical ML, W2
# ------------------------------------------------
library(caret); library(kernlab); data(spam) # load libraries and data
inTrain <- createDataPartition(y=spam$type, p=0.75, list=FALSE)  # indeces of spam data fot training
training <- spam[inTrain,] # create spam data for training
testing <- spam[-inTrain,] # create spam data for testing
dim(training)
dim(testing)

set.seed(32343)  # set a seed for test reproducibility
now()
modelFit <- train(type~., data=training, methog="glm")  # fit a model, takes appox.
now()
modelFit # see the fit result
modelFit$finalModel # check the calculated parameters

predictions <- predit(modelFit, newdata=testing)
confusionMatrix(predictions, testing$type)

folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain=TRUE)
sapply(folds,length)
folds[[1]][1:10]

folds <- createResample(y=spam$type,times=10,list=TRUE) 
sapply(folds,length)

length(spam$type)

# ------------------------------------------------
# 2018.12.2 Sun 
# DS8 Practical ML, W2, plotting predictors
# ------------------------------------------------

install.packages("ISLR")
library(ISLR); library(ggplot2); library(caret);
data(Wage)
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)

training <- Wage[inTrain, ]
testing <- Wage[-inTrain, ]
dim(training); dim(testing)

featurePlot(x=training[,c("age", "education", "jobclass")], 
            y=training$wage,
            plot="pairs")
qplot(age, wage, color=jobclass, data=training)

qq = qplot(age, wage, color=education, data=training)
qq + geom_smooth(method="lm", formula=y~x)

library(Hmisc)
cutWage <- cut2(training$wage,g=3)  # cut out "wage" to factorize in 3 groups 
table(cutWage)  # see the result of "cut"
quantile(training$wage) 


library(gridExtra)
library(grid)

p1 <- qplot(cutWage, age, data=training, fill=cutWage, 
            geom=c("boxplot"))  # Boxplot with cut2

p2 <- qplot(cutWage, age, data=training, fill=cutWage,
            geom=c("boxplot", "jitter")) # Boxplot with points overlaid

grid.arrange(p1,p2,ncol=2)

t1 <- table(cutWage,training$jobclass)  # Create a table of cutWage x jobclass
t1

prop.table(t1, 1) # make a proportion table of t1

qplot(wage, color=education, data=training, geom="density") # Make a density plot

# ------------------------------------------------
# 2018.12.2 Sun 
# DS8 Practical ML, W2, Preprocessing
# ------------------------------------------------
library(caret); library(kernlab); data(spam)
iTrain <- createDataPartition(y=spam$type, 
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve, main="", xlab="ave. capital run length")
range(training$capitalAve)

# Preprocess all predictors
preObj <- preProcess(training[,-58], method=c("center", "scale")) 

# Check how "captiveAve" has been proprocessed using preObj
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
mean(trainCapAveS) # mean should be 0
sd(trainCapAveS) # sd should be 1
hist(trainCapAveS, main="", xlab="ave. capital run length")
par(mfrow=c(2, 1))

# Applied the same preprocess "preObj" on the test data as well.
testCapAveS <- predict(preObj,testing[,-58])$capitalAve
mean(testCapAveS)
sd(testCapAveS)

# Preprocess argument
set.seed(32343)
modelFit <- train(type~., data=training,
                  preProcess=c("center", "scale"), method="glm")

# Box-Cox transform, to make my data more normal distribution-like.
# This is created by both Dr Box and Dr Cox and very hard to understand
# withough strong mathematics background. 

preObj <- preProcess(training[, -58], method=c("BoxCox"))
trainCapAveS <- predict(preObj, training[, -58])$capitalAve
par(mfrow=c(1,2)); hist(trainCapAveS); qqnorm(trainCapAveS)


# Imputing data

install.packages("RANN"); library(RANN)
set.seed(13343)

# Make some values NA
training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1], size=1, prob=0.05)==1
training$capAve[selectNA] <- NA

# Impute and standardize
proObj <- preProcess(training[,-58], method="knnImpute")
capAve <- predict(preObj, training[,-58])$capAve

# Standardize true values
capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth-mean(capAveTruth))/sd(capAveTruth)

# Compare Imputed and true
quantile(capAve -capAveTruth)
quantile((capAve - capAveTruth)[selectNA])
quantile((capAve - capAveTruth)[!selectNA])

# ------------------------------------------------
# 2018.12.2 Sun 
# Try to use "cut2" on EMI data but failed
# ------------------------------------------------
library(tidyr)
emi <- re %>% select(Freq, V, H) %>% gather(Orientation, Margin, -Freq)
cutMargin <- cut2(emi$Margin, g=3)
cutFreq <- cut2(emi$Freq, g=5)
table(cutMargin);table(cutFreq) 
qplot(cutData, Freq, data=emi, fill=cutData, geom=c("boxplot"))
t1 <- table(cutData, cutMargin)
t1

# ------------------------------------------------
# 2018.12.2 Sun 
# Swirl() review: 
# Getting and Cleaning Data, Dates and Times with lubridate
# ------------------------------------------------
library(lubridate)
now()
wday(now(), label=TRUE)
today()
second(now())
minute(now())
hour(now())
ymd(), dmy(), hms(), ymd_hms()
my_date <- ymd("1989-05-17")
ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)
ymd("1920/1/2")
dt1 <- "2014-08-23 17:23:02"
ymd_hms(dt1)
hms("03:22:14")
[1] "3H 22M 14S"

# ------------------------------------------------
# 2018.12.7 Fri
# Install swirl for macmini
# ------------------------------------------------

install_course("R Programming")
install_course("Exploratory Data Analysis")
install_course("Getting and Cleaning_Data")
install_course("Regression Models")
install_course("Statistical Inference")

# ------------------------------------------------
# 2018.12.7 Fri
# DS8 W2 Covariates creation
# ------------------------------------------------
library(ISLR);library(caret);data(wage);
inTrain <- createDataPartition(y=Wage$wage, 
                               p=0.7, list=FALSE)
training <- Wage[inTrain,]; testing <- Wage[-inTrain,]
table(training$jobclass)
dummies <- dummyVars(wage ~ jobclass, data=training)
head(predict(dummies, newdata=training))

nsv <- nearZeroVar(training, saveMetrics=TRUE)
nsv

# ------------------------------------------------
# 2018.12.9 Sun
# DS9 W1 Shiny project
# ------------------------------------------------
setwd("/Users/keijiharada/AI/Coursera/Data_Science/work/Shiny_test/")
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Data science FTW!"),
  sidebarPanel(
    h3('Sidebar text')
  ),
  mainPanel(
    h3('Main Panel text')
  )
))

library(shiny)
shinyServer(
  function(input, output) {
  }
)

# ------------------------------------------------
# 2018.12.9 Sun
# DS6 Quiz4 #6
# ------------------------------------------------

qnorm(0.95, mean=0, sd=0.04/sqrt(100))
1 - pnorm(0.006579415, mean=0.01, sd=0.04/sqrt(100))

x1 <- rnorm(1000, mean=0, sd=0.004)
x2 <- rnorm(1000, mean=0.01, sd=0.004)
plot(density(x1), xlim=c(-0.02, 0.02))
lines(density(x2))
abline(v=0.00664)

# ------------------------------------------------
# 2018.12.12 Wed
# Leaflet
# You can find the slide on the course and also 
# refer to his book named ddp.dpf
# ------------------------------------------------

install.packages("leaflet")
library(leaflet)
my_map <- leaflet() %>% addTiles()
my_map

m = leaflet() %>%
  addTiles() %>%
  addMarkers(lat=39.298113, lng=-76.590248, popup="Where Brian works")
m
hopkins = data.frame(
  lat = c(41.3851,39.299838),
  lng=c(-76.590248,-76.593143),
  labels=c("BSPH", "KKI")
)
m = leaflet(hopkins) %>% addTiles %>% addMarkers(popup=~labels)

# ------------------------------------------------
# 2018.12.16 Sun
# Combination, Permutation
# ------------------------------------------------
perm = function(n, x) {
  factorial(n) / factorial(n-x)
}

comb = function(n, x) {
  factorial(n) / factorial(n-x) / factorial(x)
}

perm(10,4)
comb(10,4)

# ------------------------------------------------
# 2018.12.21 Fri
# DS9 Data products, googleVis
# ------------------------------------------------
suppressPackageStartupMessages(library(googleVis))
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=600, height=400))
plot(M)
#print(M,"chart")

M1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(M1)

# ------------------------------------------------
# 2018.12.22 Sat
# DS9 Data products, plotly
# ------------------------------------------------
library(plotly)
plot_ly(mtcars, x=wt, y=mpg, mode="markers")
class(mtcars)

attach(mtcars)
plot_ly(mtcars, x=wt, y=mpg, mode="markers", 
        color=as.factor(cyl), size=hp)
detach(mtcars)

# 3 dimentional plot
library(plotly)
set.seed(2016-07-21)
temp <- rnorm(100, mean=30, sd=5)
pressure <- rnorm(100)
dtime <- 1:100
plot_ly(x=temp, y=pressure, z=dtime,
        type='scatter3d', mode="markers", color=temp)

# map
m = leaflet() %>%
  addTiles() %>%
  addMarkers(lat=39.298113, lng=-76.590248, popup="Where Brian works")

# time series data
data("airmiles")
airmiles
time(airmiles)
plot_ly(x=time(airmiles), y=airmiles, mode='lines')

# multiple graphs
library(plotly)
library(tidyr)
library(dplyr)
data(EuStockMarkets)
is.data.frame(EuStockMarkets)
stocks <- as.data.frame(EuStockMarkets) %>%
  gather(index, price) %>%
  mutate(time=rep(time(EuStockMarkets), 4))  # rep:replicate
attach(stocks)
plot_ly(stocks, x=time, y=price, color=index, mode='lines')
detach(stocks)

# Histogram
plot_ly(x = precip, type="histogram")

# Boxplot
attach(iris)
plot_ly(iris, y=Petal.Length, color=Species, type="box")
detach(iris)

# Heatmap
terrain1 <- matrix(rnorm(100*100), nrow=100, ncol=100)
plot_ly(z=terrain1, type="heatmap")

# 3D surface
terrain2 <- matrix(sort(rnorm(100*100)), nrow=100, ncol=100)
plot_ly(z=terrain2, type="surface")

# map
state_pop <- data.frame(State = state.abb, Pop=as.vector(state.x77[,1]))
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))
borders <- list(color=toRGB("red"))

map_options <- list(
  scope='usa',
  projection=list(type='albers usa'),
  showlakes=TRUE,
  lakecolor=toRGB('white')
)

Sys.setenv("plotly_username"="cage")
Sys.setenv("plotly_api_key"="yfVMsPzTY2OPi4U8H1p7")

attach(state_pop)
plot_ly(state_pop, z=Pop, text=hover, locations=State,
        type='choropleth', locationmode='USA-states',
        color=Pop, colors='Blues', marker=list(line=borders)) %>%
  layout(title='US Population in 1975', geo=map_options)
detach(state_pop)

plotly_POST(gg)

# ------------------------------------------------
# 2018.12.24 Mon
# Understanding PCA and eigenvectors, eigenvalues
# ------------------------------------------------

x <- c(1.07, 0.63)
y <- c(0.63, 0.64)
plot(x, y)

# ------------------------------------------------
# 2018.12.29 Sat
# Understanding central limit theorem and its application
# ------------------------------------------------
x <- runif(10000, 0, 10) # original random data
hist(x)
mean(x)

set.seed(20181230)
par(mfrow=c(1,2))
n=5
xbar <- c(1:1000) # data of the sample means
for (j in 1:1000) {
  xbar[j] <- mean(sample(x, n))
}

hist(xbar, main=n, xlim=c(0, 10)) 
abline(v=mean(xbar)+2*sd(x)/sqrt(n), col="red") 
abline(v=mean(xbar)-2*sd(x)/sqrt(n), col="red") 
abline(v=mean(xbar)+2*sd(x1)/sqrt(n), col="blue") 
abline(v=mean(xbar)-2*sd(x1)/sqrt(n), col="blue") 
abline(v=mean(xbar)+2*sd(xbar), col="yellow") 
abline(v=mean(xbar)-2*sd(xbar), col="yellow") 
abline(v=mean(xbar), col="blue")
abline(density(xbar))
text(x=40, y=50, label="1.1", cex=0.7)
abline(density(xbar))

x1 <- sample(x, n)
hist(x1, main=n, xlim=c(0, 10))
abline(v=mean(x1)+2*sd(x1), col="blue") 
abline(v=mean(x1)-2*sd(x1), col="blue") 
abline(v=mean(x1), col="blue")

#mean(x)-mean(x1)+c(-1,1)*qt(0.975, 5-1)*sd(x1)/sqrt(n)

t.test(x, x1)
#power.t.test(n=5, delta=mean(x)-mean(x1), sd=sd(x1)/sqrt(n), sig.level=0.05)
power.t.test(n=n, delta=mean(x)-mean(x1), sd=sd(x1)/sqrt(n), sig.level=0.05)$power
power.t.test(power=0.8, delta=mean(x)-mean(x1), sd=sd(x1)/sqrt(n), sig.level=0.05)$n

#ｎを一定にしても計算するたびに違う結果になるのはなぜだろう？
# 知りたいのは、適正なサンプル数、サンプル数がｎのときにその精度はどの程度か、
# 例えば何かの試験をするときにｎをいくつにすれば全体の何割をカバーできるか
　#歩留まり９９％にしたい、いくつのサンプルをみればいいか？

# ------------------------------------------------
# 2018.12.31 Mon
# DS8, Practical machine learning
# Predicting with trees
# ------------------------------------------------
data(iris); library(ggplot2)
names(iris)
table(iris$Species)
setosa versicolor  virginica 
50         50         50 

> head(iris)
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa

inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)

training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training);dim(testing)

qplot(Petal.Width, Sepal.Width, color=Species, data=training)

# "rpart" stands for "recursive partitioning"
library(caret) 
modFit <- train(Species~., method="rpart", data=training)
print(modFit$finalModel)
plot(modFit$finalModel, uniform=TRUE,
     main="Classification Tree")
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)

par(mfrow=c(1,1))
library(rattle)
fancyRpartPlot(modFit$finalModel)

predict(modFit, newdata=testing)

# トレーニングデータの作り方、フィッティングのしかたがわかった。
# この出力を他のアプリケーションでつかうにはどうすればいいのか？

# ------------------------------------------------
# 2018.12.31 Mon
# DS8, Practical machine learning
# Bagging、Bootstrap aggregating
# サンプリングと並べ替えリグレッションを繰り返してその平均をとる
# ------------------------------------------------
install.packages("ElemStatLearn")
library(ElemStatLearn); data(ozone, package="ElemStatLearn")
ozone <- ozone[order(ozone$ozone),]
head(ozone)

ll <- matrix(NA, nrow=10, ncol=155)
for(i in 1:10){
  ss <- sample(1:dim(ozone)[1], replace=T) # ss=subset
  ozone0 <- ozone[ss,];ozone0 <- ozone0[order(ozone0$ozone), ]
  loess0 <- loess(temperature~ozone, data=ozone0, span=0.2)
  ll[i,] <- predict(loess0, newdata=data.frame(ozone=1:155))
}

plot(ozone$ozone, ozone$temperature, pch=19, cex=0.5)
for(i in 1:10){
  lines(1:155, ll[i,], col="grey", lwd=2)
}
lines(1:155, apply(ll, 2, mean), col="red", led=2)

# ------------------------------------------------
# 2019.1.4 Fri
# DS8, Practical machine learning
# Random forests
# ランダムフォレスト法を用いた分類
# ------------------------------------------------
data(iris); library(ggplot2)
inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training <- iris[inTrain, ]
testing <- iris[-inTrain, ]

library(caret)  # "rf" stands for "random forest"
modFit <- train(Species~., data=training, method="rpart")
modFit <- train(Species~., data=training, method="rf", prox=TRUE)
modFit

getTree(modFit$finalModel, k=2)

irisP <- classCenter(training[,c(3,4)], 
                     training$Species, modFit$finalModel$prox)
irisP <- as.data.frame(irisP); 
irisP$Species <- rownames(irisP)
p <- qplot(Petal.Width, Petal.Length, col=Species, data=training)
p + geom_point(aes(x=Petal.Width, y=Petal.Length, col=Species),
               size=5, shape=4, data=irisP)

pred <- predict(modFit, testing)
testing$predRight <- pred==testing$Species
table(pred, testing$Species)

qplot(Petal.Width, Petal.Length, color=predRight, data=testing, main="newdata Predictions")


# ------------------------------------------------
# 2019.1.5 Sat
# DS8, Practical machine learning
# Boosting
# 単純な分類の合成＋エラーデータに重みを付けて再分類
# ------------------------------------------------
library(ISLR); data(Wage); library(ggplot2); library(caret);
wage <- subset(Wage, select=-c(logwage))
inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
training <- Wage[inTrain,];testing <- Wage[-inTrain,]

modFit <- train(wage~., method="gbm", data=training, verbose=FALSE)
print(modFit)

qplot(predict(modFit, testing), wage, data=testing)


# ------------------------------------------------
# 2019.1.7 Mon
# DS8, Practical machine learning
# Model Based Prediction
# Unable to understand how they work!
# ------------------------------------------------
data(iris); library(ggplot2)
inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training <- iris[inTrain, ]
testing <- iris[-inTrain, ]
dim(training);dim(testing)

library(caret)  # "rf" stands for "random forest"
modFit <- train(Species~., data=training, method="rf", prox=TRUE)
modlda <- train(Species~., data=training, method="lda")  # Linear Discriminant Analysis
modnb  <- train(Species~., data=training, method="nb")   # Naive Bayes
plda <- predict(modlda, testing); pnb <- predict(modnb, testing)
table(plda, pnb)

equalPredictions <- (plda==pnb)
qplot(Petal.Width, Sepal.Width, color=equalPredictions, data=testing)


# ------------------------------------------------
# 2019.1.13 Sat
# Play with my health data
# ------------------------------------------------

x <- data.frame(read.csv("health.csv"))
x$Date <- lapply(x$Date, function(x) paste("2018", x, sep="/"))
#t <- ymd_hm("2016/8/27 6:56")

x$Date <- paste(x$Date, x$time, sep=" ")
x$Date <- head(ymd_hm(x$Date))


x$softness <- as.integer(x$softness)
cex = .15 * freqData$freq, 

# ------------------------------------------------
# 2019.1.13 Sat
# Play with economic data
# ------------------------------------------------
> which(is.na(escdf4), arr.ind=T)
     row col
[1,]  11  11
[2,]  11  25
[3,]  30  42
[4,]  30  77
escdf5 <- escdf4[c(-11, -30), ]

inTrain <- createDataPartition(y=escdf5$Gold, p=0.7, list=FALSE)
training <- escdf5[inTrain, ]
testing <- escdf5[-inTrain, ]
 
library(caret)
modFit <- train(Gold~., data=training, method="rf", prox=TRUE)
modFit

pred <- predict(modFit, testing)
testing$predRight <- pred==testing$Gold
table(pred, testing$Gold)

qplot(DJIA, KOSPI, color=predRight, data=testing, main="newdata Predictions")
plot(testing$Gold, pred, xlim=c(1200, 1350), ylim=c(1200, 1350))
abline(lm(pred~testing$Gold))
abline(fit)

# ------------------------------------------------
# 2019.1.13 Sat
# Play with EMI data
# ------------------------------------------------

x <- read.csv("EMI-RE.csv")
library(tidyr)
library(dplyr)

y1 <- gather(y, Orientation, Margin, -Freq, -Product, -Operation, -AC)
#     Freq Product Operation  AC Orientation Margin
# 1  40.82     E90 USB Print 120           V   12.9
# 2  81.92     E90 USB Print 120           V   16.7
# 3  90.11     E90 USB Print 120           V   14.3
# 4  98.76     E90 USB Print 120           V   13.8
# 5 165.93     E90 USB Print 120           V     NA

y1 <- gather(y, Orientation, Margin, -Freq, -Product, -Operation, -AC, na.rm=TRUE)
y2 <- spread(y1, Product, Margin)
Error: Duplicate identifiers for rows (156, 167, 175), (31, 150), (275, 379), (387, 398), (166, 186)
Call `rlang::last_error()` to see a backtrace

# ------------------------------------------------
# 2019.1.14 Mon
# Play with economic data
# This time with Gold2 that is one month shift from Gold
# ------------------------------------------------
Gold <- escdf4$Gold
Gold2 <- Gold[2:length(Gold)]
escdf5 <- escdf4[1:(dim(escdf4)[1]-1), ]
escdf5$Gold2 <- Gold2

# >which(is.na(escdf4), arr.ind=T)
# row col
# [1,]  11  11
# [2,]  11  25
# [3,]  30  42
# [4,]  30  77
escdf5 <- escdf5[c(-11, -30), ]

inTrain <- createDataPartition(y=escdf5$Gold2, p=0.7, list=FALSE)
training <- escdf5[inTrain, ]
testing <- escdf5[-inTrain, ]

library(caret)
modFit <- train(Gold2~., data=training, method="rf", prox=TRUE)
modFit

pred <- predict(modFit, testing)
testing$predRight <- pred==testing$Gold2
table(pred, testing$Gold2)

qplot(DJIA, KOSPI, color=predRight, data=testing, main="newdata Predictions")
plot(testing$Gold2, pred, xlim=c(1200, 1350), ylim=c(1200, 1350))
abline(lm(pred~testing$Gold2))
abline(fit)

predict(modFit, escdf4[dim(escdf4)[1],])

# ------------------------------------------------
# 2019.1.15 Tue
# Create something that visualize load current data on DC/DC converter
# ------------------------------------------------

x <- matrix(runif(10, 0.1, 1.5), 5)
#hist(runif(20, 0.1, 1.5))
xdf <- data.frame(x)
names <- c('a', 'b', 'c', 'd', 'e')
xdf$names <- names
#class(xdf)
#barplot(xdf)
# qplot(x=xdf$X1, y=xdf[2,], fill=names(xdf),
#       data=xdf, geom="bar", stat="identity",
#       position="dodge")

# Animals <- c("giraffes", "orangutans", "monkeys")
# SF_Zoo <- c(20, 14, 23)
# LA_Zoo <- c(12, 18, 29)
# data <- data.frame(Animals, SF_Zoo, LA_Zoo)

# refer to https://plot.ly/r/bar-charts/
p <- plot_ly(xdf, x = ~xdf[,3], y = ~xdf[,1], type = 'bar', name = 'xdf[1]') %>%
  add_trace(y = ~xdf[,2], name = 'xdf[2]') %>% 
  layout(yaxis = list(title = 'Max current'), barmode = 'group')
p

par(mfrow=c(1, 2))
barplot(xdf$X1, cex.names=0.7, names.arg=xdf$names, col='lightblue')
barplot(xdf$X2, cex.names=0.7, names.arg=xdf$names, col='lightpink')

test <- cbind(xdf$X1, xdf$X2)
barplot(test, beside=T)

# ------------------------------------------------
# 2019.1.19 Sat
# Practice creating barplots
# ------------------------------------------------
x <- matrix(runif(10, 0.1, 1.5), 2)
xtb<- as.table(x)
#           A         B         C         D         E
# A 1.2752309 0.4039941 0.9611267 0.2976092 0.6879109
# B 0.8753509 0.2023901 0.5256996 0.1881982 1.1956598
barplot(xtb, col=c("red", "lightpink"), las=1)
barplot(xtb, beside=T, las=1)
barplot(xtb, beside=T, horiz=T, names.arg=c("t1", "t2", "t3", "t4", "t5"), las=1)

library(ggplot2)
y <- matrix(runif(10, 0.1, 1.5), 5)
ydf <- data.frame(y)
ydf$timing <-c("t1", "t2", "t3", "t4", "t5")
ydf2 <- gather(ydf, Products, Current, -timing)
#    timing Products   Current
# 1      t1       X1 0.1913701
# 2      t2       X1 0.2676496
# 3      t3       X1 0.8860108
# 4      t4       X1 0.8144771
# 5      t5       X1 1.1048368
# 6      t1       X2 0.5516004
# 7      t2       X2 0.1869674
# 8      t3       X2 1.1996401
# 9      t4       X2 1.0599391
# 10     t5       X2 0.2727712
p <- ggplot(ydf2, aes(x=timing, y=Current, fill=Products)) +
  geom_bar(stat="identity") 
p

C_rounded <- round(ydf2$Current, 1)
p <- ggplot(ydf2, aes(x=timing, y=Current, fill=Products)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_text(aes(label=C_rounded)) +
  #scale_fill_manual(values=c("black", "lightgray")) 
  scale_fill_brewer(palette="Reds");p
p

(pp <- ggplotly(p))

library(plotly)
#          X1        X2 timing
# 1 0.1913701 0.5516004     t1
# 2 0.2676496 0.1869674     t2
# 3 0.8860108 1.1996401     t3
# 4 0.8144771 1.0599391     t4
# 5 1.1048368 0.2727712     t5

p <- plot_ly(ydf, x=~timing, y=~X1, type='bar', name="X1") %>%
  add_trace(y=~X2, name="X2") %>%
  layout(yaxis=list(title="Current"), barmode="group")
p

p <- ydf %>% 
  plot_ly() %>%
  add_trace(x=~timing, y=~X1, type='bar', 
            text=round(ydf$X1,2), textposition='auto', 
            name="X1", color=I("red")) %>%
  add_trace(x=~timing, y=~X2, type='bar', 
            text=round(ydf$X2,2), textposition='auto', 
            name="X2", color=I("lightpink")) %>%
  layout(yaxis=list(title="Current"), barmode="group")
p

# ------------------------------------------------
# 2019.1.19 Sat
# Play with the economic data
# ------------------------------------------------

names(escdf4)
x <- escdf4[, c(3, 4, 51, 53, 65, 68, 70, 77, 82, 83)]
cnames <- names(escdf4[, c(3, 4, 51, 53, 65, 68, 70, 77, 82, 83)])
library(PerformanceAnalytics)
chart.Correlation(x, histogram=FALSE, pch=19, xlab=cnames)

x1 <- filter(x, !is.na(x$World.bonds))
cor(x1$Gold, x1$World.bonds)

which(is.na(escdf4), arr.ind=T)
# row col
# [1,]  11  11
# [2,]  11  25
# [3,]  30  42
# [4,]  30  77
escdf5 <- filter(escdf4, !is.na(escdf4[,11]))
which(is.na(escdf5), arr.ind=T)
# row col
# [1,]  29  42
# [2,]  29  77
escdf5 <- filter(escdf5, !is.na(escdf4[,29]))
x <- escdf5[, 3:length(escdf5)]
chart.Correlation(x, histogram=TRUE, pch=19, xlab=cnames)

GDP <- select(escdf5, contains("GDP"));GDP$Gold <- escdf5$Gold
IP <- select(escdf5, contains("IP"));IP$Gold <- escdf5$Gold
CP <- select(escdf5, contains("CP"));CP$Gold <- escdf5$Gold 
IR <- select(escdf5, contains("IR"));IR$Gold <- escdf5$Gold
FX <- select(escdf5, contains("FX"), -contains("LFX"));FX$Gold <- escdf5$Gold
LFX <- select(escdf5, contains("LFX"));LFX$Gold <- escdf5$Gold
STK <- select(escdf5, c(65:74));STK$Gold <- escdf5$Gold
IDX <- select(escdf5, c(75:81, 83));IDX$Gold <- escdf5$Gold

chart.Correlation(GDP, histogram=TRUE, pch=19, xlab=cnames)

# ------------------------------------------------
# 2019.1.20 Sun
# GoogleVis again
# ------------------------------------------------
library(googleVis)
#https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html

df=data.frame(country=c("US", "GB", "BR"), 
              val1=c(10,13,14), 
              val2=c(23,12,32))
Line <- gvisLineChart(df)
plot(Line)
# ------------------------------------------------
# 2019.1.21 Sun
# DS Regression Models
# ------------------------------------------------
library(ggplot2)
g = ggplot(diamond, aes(x=carat, y=price), )
g = g + geom_point(size=6, color="black", alpha="0.2")
g = g + geom_point(size=5, color="blue", alpha="0.2")
g = g + geom_smooth(method="lm", color="black")
g

fit <- lm(price ~ carat, data=diamond)
coef(fit)
summary(fit)

fit2 <- lm(price ~ I(carat - mean(carat)), data=diamond)
coef(fit2)

plot(price~carat, diamond)
abline(fit)
abline(fit2)
confint(fit)
coef(fit)
points(confint(fit), col="red")

newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2]*newx
predict(fit, newdata=data.frame(carat=newx))

# ------------------------------------------------
# 2019.1.25 Fri
# Study Odds
# ------------------------------------------------

p <- seq(0, 0.9, by=0.01)
o <- p/(1-p)
plot(p, o)

data <- data.frame(cbind(p, o))
plot_ly(data=data, x=p, y=o)
head(o)


# ------------------------------------------------
# 2019.2.2 Sat
# Polar plot
# ------------------------------------------------
install.packages("plotrix")
library(plotrix)
polar.plot(c(0,1,3,4),c(30,60,90,120),start=90,clockwise=TRUE,rp.type="s",
           point.symbols=19,radial.lim=c(0,5),boxed.radial=F)

library(dplyr)
library(plotly)
p <- plot_ly(
  type = 'scatterpolar',
  r = c(0,1,2,2),
  theta = c(0,45,90,0),
  mode = 'markers'
)
p

p <- plot_ly(
  type = 'scatterpolar',
  r = c(0,1,2,2),
  theta = c(0,45,90,0),
  mode = 'markers',
  marker = list(
    size=15,
    line=list(
      color='#FFF'
    ),
    opacity=0.7
  )
)
p

freq <- sample(30:300, 40)
angle <- sample(0:360, 40)
height <- runif(40, 1, 4)
margin <- runif(40, 0, 15)
product <- sample(c("A", "B", "C"), 40, replace=TRUE)
emi <- data.frame(cbind(freq, angle, height, margin))
emi$product <- product
emi1 <- filter(emi, height >= 1 & height < 2)
emi2 <- filter(emi, height >= 2 & height < 3)
emi3 <- filter(emi, height >= 3 & height <= 4)

# library(plotrix)
# polar.plot(emi$margin,emi$angle,start=90,clockwise=TRUE,rp.type="s",
#            point.symbols=19,radial.lim=c(0,20),boxed.radial=F)


library(plotly)
p1 <- plot_ly(
  type = 'scatterpolar',
  r = emi1$margin,
  theta = emi1$angle,
  mode = 'markers',
  marker = list(
    size=15,
    line=list(
      color='#FFF'
    ),
    opacity=0.7
  )
) 
p2 <- plot_ly(
  type = 'scatterpolar',
  r = emi2$margin,
  theta = emi2$angle,
  mode = 'markers',
  marker = list(
    size=15,
    line=list(
      color='#FFF'
    ),
    opacity=0.7
  )
) 
p3 <- plot_ly(
  type = 'scatterpolar',
  r = emi3$margin,
  theta = emi3$angle,
  mode = 'markers',
  marker = list(
    size=15,
    line=list(
      color='#FFF'
    ),
    opacity=0.7
  )
) 
p <- subplot(p1, p2, p3)
p

p <- plot_ly(
  type = 'scatterpolar',
  mode = 'lines'
  ) %>%
  add_trace(
    type = 'scatterpolar',
    r = emi1$margin,
    theta = emi1$angle,
    mode = 'markers',
    name = 'antenna 1-2m',
    mode = "text",
    text = emi1$freq
  ) %>%
  add_trace(
    type = 'scatterpolar',
    r = emi2$margin,
    theta = emi2$angle,
    mode = 'markers',
    name = 'antenna 2-3m',
    mode = "text",
    text = emi2$freq
  ) %>%
  add_trace(
    type = 'scatterpolar',
    r = emi3$margin,
    theta = emi3$angle,
    mode = 'markers',
    name = 'antenna 3-4m',
    mode = "text",
    text = emi3$freq
  ) 
p

#p <- subplot(p1, p2, p3)

plot(emi$height, emi$margin, col=emi$freq)
hist(emi$height)
plot(emi$margin, emi$height, col=emi$freq)

# ------------------------------------------------
# 2019.2.2 Sat
# Voltage drop simulation
# ------------------------------------------------

# res <- seq(0.01, 1, 0.01)
# cur <- seq(0, 0.5, 0.1)
# v33 <- c(3.3*0.97, 3.3*1.03)
# vdd <- v33 - cur * res
# plot(res, vdd, type="p")
#   
# rdf <- data.frame(res)
# cdf <- data.frame(cur)
# vdf <- data.frame(v33)
# vdd <- data.frame(rbind(v33, cur, res))
# t(vdd)
# 
# cur <- rep(c(0, 0.1, 0.2, 0.3, 0.4, 0.5), each=100)
# v33 <- rep(c(3.3*0.97, 3.3*1.03), each=600)
# temp <- cbind(cur, c(res, res, res))
# data <- data.frame(cbind(v33, c(temp, temp)))
# 
# resdf <- data.frame(res)
# curdf <- data.frame(cur)
# v33df <- data.frame(v33)
# temp <- cbind(curdf, resdf )
 
res <- rep(seq(0.01, 0.2, 0.01), 240)  # 20*12
cur <- rep(rep(c(0, 0.1, 0.2, 0.3, 0.4, 0.5), each=20), 2) # 6*20 *2
v33 <- rep(c(0.9*1.03*0.97, 0.9*1.03*1.03), each=120) # 2*120

length(res); length(cur); length(v33)
data <- data.frame(res, cur, v33)
data <- mutate(data, vdd = v33 - res*cur)
head(data)
plot(data$res, data$vdd, type="p", 
     xlim=c(0.0, 0.2), ylim=c(0.7, 1), cex=0.4)
abline(h=0.9*1.07, v=0.1)
abline(h=0.9*0.93)

qplot(res, vdd, data=data, facets=.~factor(v33), color=as.factor(cur))
p <- ggplot(data=data, aes(x=res, y=vdd, color=as.factor(cur))) + 
  geom_point() + 
  geom_hline(yintercept=0.9*1.07) + facet_wrap(.~v33) + 
  geom_hline(yintercept=0.9*0.93) + geom_vline(xintercept=0.1) +
  xlab("resistance") + ylab("vdd") + 
  ggtitle("0.9V drop calculation, +3%")
gg <- ggplotly(p)
gg

# ------------------------------------------------
# 2019.2.3 Sun
# EMS measures effectiveness study
# ------------------------------------------------
level <- seq(0.5, 5, 0.5)

# ------------------------------------------------
# 2019.2.3 Sat
# R programming course note
# ------------------------------------------------
test <- c("I", "have", "a", "pen")
paste(test, collapse=" ")
[1] "I have a pen"

a <- "Don't"
b <- "shy away"
paste(a, b, sep=' ')
[1] "Don't shy away"

seq(0, 10, by=0.1)
rep(0, 10)
rep(c(1, 2), time=10)
rep(c(1, 2), each=10)

x[1:10]
x[is.na(x)]
x[!is.na(x)]
x[-c(2,10)]

# ------------------------------------------------
# 2019.2.3 Sun
# Coursera Data science course memo
# ------------------------------------------------
any()
all()
args()
dim()
class()
lapply()
sapply()
vapply()
tapply()
str()
summary()
set.seed(100)
rpois(10, 1)
is.na()
sample(1:10, 6)
args(sample)
a <- seq(1, 12, by=2)
b <- rep(c(1, 2), each=3)
c <- sample(1:10, 6)
adf <- data.frame(a)
bdf <- data.frame(b)
cdf <- data.frame(c)
data <- cbind(adf, bdf, cdf)
data
heatmap(as.matrix(data))
# ------------------------------------------------
# 2019.2.8 Fri
# Play with factory data 
# ------------------------------------------------
# 
# hist(rnorm(100, 1.1, 1.1*0.005), bin=10, xlim=c(1.1*0.97, 1.1*1.03))
# 
# hist(sample(1.1*0.97:1.1*1.03,size=10))
# 
# ?sample
# sample(0:100, 10, replace=FALSE)
# 
# hist(rnorm(100, 1.1, sd=1.1*0.01), xlim=c())
# abline(v=1.1*0.97)
# 
# dd11 <- seq(1.1*0.97, 1.1*1.03, by=0.001)
# hist(sample(dd11, 40))
# length(dd11)
# hist(rt(100, 5))
# 
# dd11 <- rnorm(100, mean=1.1, sd=1.1*0.05)
# dd11 <- data.frame(dd11)
# ggplot(dd11, aes(x=dd11)) + 
#   geom_histogram(fill="salmon", binwidth=0.02) +
#   geom_density(size=1) +
#   geom_vline(xintercept=c(1.1*0.97, 1.1*1.03))

sd=1.1*0.005
mu=1.1
dd11 <- rt(n=100, 10)*sd+mu
dd11 <- data.frame(dd11)
ggplot(dd11, aes(x=dd11)) + 
  geom_histogram(fill="salmon", binwidth=1.1*0.005) +
  #geom_density(size=1) +
  geom_vline(xintercept=c(1.1*0.97, 1.1*1.03)) +
  scale_x_continuous(limits=c(1.1*0.95, 1.1*1.05)) +
  scale_y_continuous(limits=c(0, 100))
  
sd=3.3*0.005
mu=3.3
dd33 <- rt(n=100, 10)*sd+mu
dd33<- data.frame(dd33)
ggplot(dd33, aes(x=dd33)) + 
  geom_histogram(fill="salmon", binwidth=3.3*0.005) +
  #geom_density(size=1) +
  geom_vline(xintercept=c(3.3*0.97, 3.3*1.03)) +
  scale_x_continuous(limits=c(3.3*0.95, 3.3*1.05)) +
  scale_y_continuous(limits=c(0, 100))


myplot <- function(df, V){
  g = ggplot(df, aes(x=df[,1])) + 
    geom_histogram(fill="salmon", binwidth=V*0.005) +
    #geom_density(size=1) +
    geom_vline(xintercept=c(V*0.97, V*1.03)) +
    scale_x_continuous(limits=c(V*0.95, V*1.05)) +
    scale_y_continuous(limits=c(0, 100))
  g
}

myplot(dd11, 1.1)
myplot(dd33, 3.3)

sd=5*0.005
mu=5
dd50 <- rt(n=10, 10)*sd+mu
dd50<- data.frame(dd50)
myplot(dd50, 5)

# ------------------------------------------------
# 2019.2.8 Fri
# Play with plotting with small and big ball
# ------------------------------------------------
y <- galton$child - mean(galton$child)
x <- galton$parent - mean(galton$parent)
freqData <- as.data.frame(table(x, y))
names(freqData) <- c("child", "parent", "freq") 
freqData$child <- as.numeric(as.character(freqData$child)) 
freqData$parent <- as.numeric(as.character(freqData$parent)) 
myPlot <- function(beta){
  g <- ggplot(filter(freqData, freq > 0), aes(x = parent, y = child))
  g <- g + scale_size(range = c(2, 20), guide = "none" )
  g <- g + geom_point(colour="grey50", aes(size = freq+20, show_guide = FALSE)) 
  g <- g + geom_point(aes(colour=freq, size = freq))
  g <- g + scale_colour_gradient(low = "lightblue", high="white")
  g <- g + geom_abline(intercept = 0, slope = beta, size = 3)
  mse <- mean( (y - beta * x) ^2 )
  g <- g + ggtitle(paste("beta = ", beta, "mse = ", round(mse, 3)))
  g
}
manipulate(myPlot(beta), beta = slider(0.6, 1.2, step = 0.02))

# ------------------------------------------------
# 2019.2.9 Sat
# DS Exploratory data analysis
# ------------------------------------------------
set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40) 
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

set.seed(678910) 
for (i in 1:40) { # flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  # if coin is heads add a common pattern to that row 
  if (coinFlip) {
  dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5) }
}
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2, 4)) 
heatmap(dataMatrix)

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1]) 
plot(rowMeans(dataMatrixOrdered), 40:1, , 
     xlab = "Row Mean", ylab = "Row", pch = 19) 
plot(colMeans(dataMatrixOrdered), xlab = "Column", 
     ylab = "Column Mean", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", 
     ylab = "First left singular vector", pch = 19)
plot(svd1$v[, 1], xlab = "Column", 
     ylab = "First right singular vector", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", 
     ylab = "Percent of variance explained",pch = 19)

# ------------------------------------------------
# 2019.2.10 Sun
# function to calculate pooled variance
# ------------------------------------------------

# pooled variances
p_var <- function(v1, n1, v2, n2){
  num <- (n1-1)*v1 + (n2-1)*v2
  den <- (n1-1) + (n2-1)
  num/den
}

# pooled sample sizes
p_n <- function(n1, n2){
  n1*n2/(n1+n2)
}

# pooled standard error
p_se <- function(v1, n1, v2, n2){
  sqrt((p_var(v1, n1, v2, n2))) / sqrt(p_n(n1, n2))
}

rnorm2 <- function(n, mean, sd){
  mean + sd*scale(rnorm(n))
}

x1 <- rnorm2(10, 5, sqrt(0.68))
x2 <- rnorm2(10, 3, sqrt(0.6))
t.test(x2, x1, paired=FALSE, var.equal=TRUE)

x1 <- rnorm2(100, 6, 2)
x2 <- rnorm2(100, 4, 0.5)
t.test(x2, x1, paired=FALSE, var.equal=FALSE)


x1 <- rnorm2(9, -3, 1.5)
x2 <- rnorm2(9, 1, 1.8)

-3-1+c(-1, 1)*qt(0.95, 16)*sqrt(8*(1.5^2+1.8^2)/16)*sqrt(2/9)
t.test(x1, x2, paired=FALSE, var.equal=TRUE, conf.level=0.90)
mean(x1); sd(x1); dim(x1)
mean(x2); sd(x2); dim(x2)

x1 <- c(140, 138, 150, 148, 135)
x2 <- c(132, 135, 151, 146, 130)
t.test(x1, x2, paired=TRUE, var.equal=FALSE, conf.level=0.95)

# ------------------------------------------------
# 2019.2.11 mon
# Very basic R commands
# ------------------------------------------------

a <- c(NA, 1, 9, 0, NA)
a[!is.na(a)]
which(x==9)
any(a==9)
all(a==9)

Sys.Date()
Sys.time()
ymd(20190102)
ymd_hm(201901021002)
strptime("12/2", "%m/%d")
strptime("12/2, 12:05:45", "%m/%d, %H:%M:%S")

# ------------------------------------------------
# 2019.2.11 mon
# Study to utilize R commands for EMI test  
# ------------------------------------------------
x <- c(1, 1, 1, 1, 0)
y <- c(1, 1, 1, 0)
binom.test(4,5)


# ------------------------------------------------
# 2019.2.16 sat
# Review DS Quiz
# ------------------------------------------------
ppois(10, lambda=0.01*1787)
x# 1%が基準であるところ、1787人中10人の感染が確認された
# この病院は基準を満足しているか？
# 10/1787=0.0056, 0.56%
# lambda = λ is the expected number of occurrences
# ppois(10, lambda=0.01*1787)=0.0323
# つまり、1%基準において、0.56%以下である確率は3.2%
# 従って、基準よりも十分に低いと言える

 <- seq(1, 30, by=1)
plot(x, ppois(x, lambda=0.01*1787))
aplot(ppois(x, lambda=0.01*1787))
bline(v=10)

x <- 0:60
plot(x, ppois(x, lambda=30))
abline(v=10)
plot(x, dpois(x, lambda=30))

x <- seq(-3, 3, by=0.1)  # x = quantile
df <- 10
plot(x, pt(x, df))

x <- seq(-3, 3, by=0.02) # x = quantile
df <- 10
plot(x, dt(x, df))
# ------------------------------------------------
# 2019.2.16 Fri
# Play with factory data 
# ------------------------------------------------

seq(1, 20, by=1)  # Continuous data
rep(0:1, each=10)  # Repetitive data
library(lubridate)
seq(ISOdate(2019,1,3), ISOdate(2019,1,4), by=60) # Continous time data by minutes
rbinom(100, 2, prob=0.01) # Probable data
rnorm(100, mean=3.3, sd=0.02) # Normally distributed data



seq(as.POSIXct("2015-1-1 8:30"), as.POSIXct("2015-1-1 21:00"), by = "hour")

seq(ISOdate(1910,1,1), ISOdate(1910,1,2), "hours")
seq(ISOdate(2000,1,1), by = "month", length.out = 12)
seq(as.POSIXct("2015-1-1 0:00"), as.POSIXct("2015-1-1 12:00"), by = "hour")


# ------------------------------------------------
# 2019.2.17 Sun
# DS Quiz
# ------------------------------------------------
x1 <- scale(rnorm(9))*1.5-3
x2 <- scale(rnorm(9))*1.8+1
t.test(x2, x1, paired=FALSE, var.equal=TRUE)


# ------------------------------------------------
# 2019.2.20 Wed
# Compare multi data and extract differences
# google "r command that compare multiple files" 
# ------------------------------------------------

rname <- c("R1", "R2", "R3", "R4", "R5", "R6")
a <- c(1, 3, 5, 7, 9)
b <- c(3, 6, 8, 9, 10)
c <- c(2, 3, 4, 5, 7, 9)

intersect(intersect(a, b), c)
Reduce(intersect, list(a, b, c))

library(readxl)
install.packages("readxl")

m <- cbind(a, b, c)

m[1, 1] == m[1, 2]

# ------------------------------------------------
# 2019.2.23 Sat
# ------------------------------------------------
x1 <- c("A", "A", "A", "C")
x2 <- c("A", "A", "A", "B")
x3 <- c("A", "D", "A", "C")

x <- c(x1, x2)
unique(x)
duplicated(x)
x[duplicated(x)]
test <- x1==x2
x[!test]

x1 <- c("IC1", NA, "IC2")
x2 <- c("PN1", "PN10", "PN2")
x3 <- c("MAKER1", "MAKER10", "MAKER2")

for(i in 1:length(x1)){
  if(is.na(x1)[i]){
    x1[i] <- paste(x1[i-1], "A", sep="")
  }
}
"IC1"  "IC1A" "IC2" 

X <- cbind(x1, x2, x3)
unique(X)
test12 <- x1==x2
test13 <- x1==x3
test <- test12*test13
X[!test, ]
x1  x2  x3 
[1,] "A" "A" "D"
[2,] "C" "B" "C"

add_A <- function(x){
  for(i in 1:dim(x)[1]){
    if(is.na(x)[i, 1]){
      x[i, 1] <- paste(x[i-1, 1], "A", sep="")
    }
  }
  x
}

change_NA <- function(x){
  for(j in 1:dim(x)[2]){
    for(i in 1:dim(x)[1]){
      if(is.na(x)[i,j]){
        x[i, j] <- "Blank"
        print(i)
        print(j)
      }
    }
  }
  x
}

cmp <- c("R1", "R2", NA, "R4", "R5")
name <- c("A", "B", NA, "D", "E")
pcs <- c(1, 2, 3, 4, 5)
x1 <- cbind(cmp, name, pcs)
x1 <- add_A(x1)
x1 <- change_NA(x1)
x1df <- data.frame(x1[,2:3])
rownames(x1df) <- x1[,1]

cmp <- c("R1", "R2", NA, "R4", "R5")
name <- c("A", "B", "C", "D", "F")
pcs <- c(1, 2, 3, 4, 5)
x2 <- cbind(cmp, name, pcs)
x2 <- add_A(x2)
x2 <- change_NA(x2)
x2df <- data.frame(x2[,2:3])
rownames(x2df) <- x2[,1]

cmp <- c("R1", "R2", NA, "R4", "R5")
name <- c("A", "B", "G", "D", NA)
pcs <- c(1, 2, 3, 5, 5)
x3 <- cbind(cmp, name, pcs)
x3 <- add_A(x3)
x3 <- change_NA(x3)
x3df <- data.frame(x3[,2:3])
rownames(x3df) <- x3[,1]


test12 <- as.matrix(x1df)== as.matrix(x2df)
test13 <- as.matrix(x1df)== as.matrix(x3df)
test <- test12 * test13
    name pcs
R1     1   1
R2     1   1
R2A    0   1
R4     1   0
R5     0   1

cbind(x1df, x2df, x3df)
      name pcs name pcs  name pcs
R1      A   1    A   1     A   1
R2      B   2    B   2     B   2
R2A Blank   3    C   3     G   3
R4      D   4    D   4     D   5
R5      E   5    F   5 Blank   5

# Need to list mismatched part(s) so that one can easily trace them.
# Examples are followings 
       x1  x1   x2  x2   x3  x3
     name pcs name pcs name pcs
R2A    C   3    C   3    G   3
R4     D   4    D   4    D   5
R5     E   5    F   5    F   5

change_NA <- function(x){
  fo
  
  
list_0 <- function(x1, x2, x3, test){
  for(i in 1:dim(x)[1]){
    if(any(test[i,]==0)){
      print(cbind(x1[i,], x2[i,], x3[i,]))
    }
  }
}

list_0(x1df, x2df, x3df, test)

# ------------------------------------------------
# 2019.3.8 Fri
# K Means  
# ------------------------------------------------
require(graphics)

# a 2-dimensional example
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c("x", "y")
(cl <- kmeans(x, 2))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)

# ------------------------------------------------
# 2019.3.11 Sun
# PCA
# ------------------------------------------------

# Using the matrix x above, 
prcomp(x)
# Standard deviations (1, .., p=2):
#   [1] 0.7638508 0.3395897
# 
# Rotation (n x k) = (2 x 2):
#   PC1        PC2
# x 0.7196558  0.6943310
# y 0.6943310 -0.7196558
u1 <- c(0.71458776 0.6966083)
z <- x %*% u1

par(mfrow=c(2,1))
plot(x) # Since x is a matrix, don't have to write "y" in the code.
stripchart(z, pch = "+")

# t1 <- c(2,8,11,19)
# t1 <- data.frame(t1,1) ## 1 is your "height"
# plot(t1, type = 'o', pch = '|', ylab = '')
# plot(t1, type="b")
# 
# library(lattice)
# stripplot(t1)
# 
# stripchart(t1, pch = "+")

# ------------------------------------------------
# 2019.3.23 Sat
# naive bayes
# ------------------------------------------------

# using the same data from iris, run naive Bayes on training data
nb <- train(Species ~ ., data=training,method="nb")
# predict test outcomes using naive Bayes model
pred.nb <- predict(nb,testing)
# print results
pred.nb

training <- c(1,1,1,0,1,1,0,1,1,1,1,0,0,1,1,1,1,1,1,1)
length(training)
training <- data.frame(training)
training$game <- c(1:20)
names(training) <- c("results", "game")

for(i in 1:length(training$results)) {
  if(training$results[i]==1) {
    training$results[i] <- "won"
  }
  else {
    training$results[i] <- "lost"
  }
}

nb <- train(results~., data=training, method="nb")

testing <- data.frame(c("lost", "won"))
testing$game <- c(21,22)
pred.nb <- predict(nb,testing)
pred.nb
t.test(training$results)


# ------------------------------------------------
# 2019.3.27 Wed
# Test jitter()
# ------------------------------------------------

plot(child~parent,galton)
fit<-lm(child~parent, galton)
points(fit)

# ------------------------------------------------
# 2019.3.29 fri
# Developing a model for factory, 
# Predicting a factor y using a real number X
# ------------------------------------------------

set.seed(20190329)
x <- rnorm(100, 0.06, 0.01)
plot(x)
hist(x)
y <- rnorm(100, 0.07, 0.025)
plot(y)
plot(x, y, xlim=c(0, 0.15), ylim=c(0, 0.15))
fit <- lm(y~x)
abline(fit)
dt <-cbind(x, y)
boxplot(dt)
mean(y)
mean(x)
abline(v=10)
sd <- sqrt(var(fit$residuals))
mn <- mean(x)


logicalize = function(xvec, min, max) {
  for(i in 1 : length(xvec)){
    if(xvec[i] < min || xvec[i] > max){
      yvec[i] <- 1
    }
    else{
      yvec[i] <- 0
    }
  }
  yvec
}

y2 <- logicalize(y, 0.03, 0.10)
dt2 <- cbind(x, y2)
plot(dt2)
plot(y2~y)

# df2 <- data.frame(cbind(x, y2))
# log_y2 <- glm(df2$y2 ~ df2$x,family="gaussian")
# summary(log_y2)
# plot(df2$x,log_y2$fitted,pch=19,col="blue",xlab="x",ylab="Prob check results", ylim=c(0, 1))
# 
# exp(log_y2$coeff)
# exp(confint(log_y2))

library(caret)
set.seed(20190329)
#adData = data.frame(diagnosis,predictors)
y3 <- as.factor(y2)
df3 <- data.frame(x, y3)
inTrain = createDataPartition(df3$y3, p = 3/4)[[1]]
training = df3[ inTrain,]
testing = df3[-inTrain,]

modelFit <- train(y3 ~ x,method="glm",data=training)

predict(modelFit,testing)
confusionMatrix(testing$y3,predict(modelFit,testing))

### with using glm()
mdl <- glm(y3~x, family="binomial", training)
lodds <- predict(mdl, data.frame(x=c(0.035, 0.055, 0.09)))
exp(lodds)/(1+exp(lodds))
summary(mdl)

### with using naive bayes
# using the same data from iris, run naive Bayes on training data
nb <- train(y3 ~ x, data=df3, method="nb")
# predict test outcomes using naive Bayes model
pred.nb <- predict(nb,testing)
# print results
pred.nb

# ------------------------------------------------
# 2019.3.31 Sun
# Anomaly detection for one variable
# ------------------------------------------------
set.seed(20190329)
x <- rnorm(100, 0.06, 0.01)
sd <- sqrt(var(x[1:75]))
mn <- mean(x[1:75])
testing <- (x[76:100]-mn)/sd
rtesting <- x[76:100]

p <- dnorm(testing)
par(mfrow=c(1,2))
plot(testing, p)
#plot(x[76:100], testing)
df <- data.frame(cbind(p, testing, rtesting))
filter(df, df$p < 0.1)
hist(rtesting)

#create vectors -- these will be our columns
a <- c(1,2,3,4,5,6)
b <- c(2,3,5,6,1,9)
c <- c(3,5,5,5,10,8)
d <- c(10,20,30,40,50,55)
e <- c(7,8,9,4,6,10)

#create matrix from vectors
M <- cbind(a,b,c,d,e)

# ------------------------------------------------
# 2019.4.12 Fri
# Big data visualization    
# ------------------------------------------------
set.seed(20190329)
n <- 100

par(mfrow=c(2,3))
CR1 <- rnorm(n, sd=0.03, mean=rnorm(1, sd=0.01))
plot(CR1)
hist(CR1)
boxplot(CR1)

boxplot(log(CR1))


CR1 <- rnorm(n, sd=0.03, mean=rnorm(1, sd=0.01))
plot(CR1)
hist(CR1)
boxplot(CR1)



par(mfrow=c(1,3))
AR1 <- rnorm(n, sd=0.0015, mean=rnorm(1, sd=0.01))
plot(AR1)
hist(AR1)
boxplot(AR1)

# ------------------------------------------------
# 2019.4.12 Fri
# Practice "split"   
# ------------------------------------------------
x <- matrix(1:10, 2, 5)
xdf <- data.frame(x)
names(xdf) <- c("a", "b", "c", "d", "e")
test <- split(xdf, xdf$a)

# ------------------------------------------------
# 2019.4.14 Sun
# take a memo of a plot 
# ------------------------------------------------
pdf("~/myplot.pdf")
plot(x)
dev.off()

# ------------------------------------------------
# 2019.4.14 Sun
# Shiny
# ------------------------------------------------
library(shiny)

# ------------------------------------------------
# 2019.4.20 Sat
# Test how to handle excel file in R code
# ------------------------------------------------
install.packages("readxl")
library(readxl)
x <- read_excel("analysis.xlsx")
x <- read_excel("cameras.xlsx")


# ------------------------------------------------
# 2019.4.21 Sun
# Play with the Economist data
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
x <- data.frame(read.csv("メモ2019 - 経済指標.csv"))
x1 <- x[2:dim(x)[1], 35:39]  # cut unnecessary part
rownames(x1) <- 1:nrow(x1)  # rename rows
colnames(x1) <- 1:ncol(x1)  # rename columns
x2 <- x1[c(1:9, 18:57, 59:65, 68:69, 70:80, 83:87),]  # cut unnecessary rows
rownames(x2) <- 1:nrow(x2)
colnames(x2) <- 1:ncol(x2)
x3 <- data.frame(t(x2))
x3$X1 <- as.Date(as.character(x3$X1), "%m/%d")
#x3$X2 <- as.double(gsub("%", "", x3$X2))
for (i in 2:dim(x3)[2]) {
  if (any(grepl("%", x3[,i]))) {
    x3[,i] <- as.double(gsub("%", "", x3[,i]))
  }
  else if (any(grepl(",", x3[,i]))) {
    x3[,i] <- as.double(gsub(",", "", x3[,i]))
  }
  else{
    x3[,i] <- as.numeric(as.character(x3[,i]))
  }
}

cnames <- c("DATE", 
       "GDP.US", "GDP.CN", "GDP.JP", "GDP.EU", "GDP.IN", "GDP.SK", "GDP.TW", "GDP.BZ", 
       "CP.US", "CP.CN", "CP.JP", "CP.EU", "CP.IN", "CP.SK", "CP.TW", "CP.BZ", 
       "UEP.US", "UEP.CN", "UEP.JP", "UEP.EU", "UEP.IN", "UEP.SK", "UEP.TW", "UEP.BZ", 
       "CAB.US", "CAB.CN", "CAB.JP", "CAB.EU", "CAB.IN", "CAB.SK", "CAB.TW", "CAB.BZ", 
       "BGB.US", "BGB.CN", "BGB.JP", "BGB.EU", "BGB.IN", "BGB.SK", "BGB.TW", "BGB.BZ", 
       "IR.US", "IR.CN", "IR.JP", "IR.EU", "IR.IN", "IR.SK", "IR.TW", "IR.BZ", 
       "FX.CN", "FX.JP", "FX.EU", "FX.IN", "FX.SK", "FX.TW", "FX.BZ", 
       "SP", "NDQ", "SSE", "NK", "DAX", "BSE", "KSP", "TWI", "BVS", "DEV", "EM", "IGB", "HYB",
       "ALL", "FOOD", "METAL", "GOLD", "WTI")
colnames(x3) <- cnames
#write.csv(x3, "20190421-economist.csv")

#x3 <- read.csv("20190428-economist.csv")
#x3 <- read.csv("20190504-economist.csv")
x3 <- read.csv("20190526-economist.csv")
x3$DATE <- as.Date(as.character(x3$DATE), "%Y-%m-%d")
#x3 <- x3[,2:dim(x3)[2]] # remove unexpectedly added column


# plot GDP
par(mfrow=c(2,4))
#x3 <- filter(x3, DATE > "2018-12-12")
cnames <- names(x3)
for (i in 2:9){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="GDP", ylim=c(0,7.5))
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Consumer prices
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 10:17){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="C Price", ylim=c(0,4.5))
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Unemployment rates
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 18:25){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="Unemployment", ylim=c(0,8))
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Current account balances
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 26:33){
  plot(x3$DATE[31:36], x3[31:36,i], xlab=cnames[i], ylab="Current account", ylim=c(-3,6))
  lines(x3$DATE[31:36], x3[31:36,i])
  abline(lm(x3[31:36,i]~x3$DATE[31:36]), col='blue')
  abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Government's budget balance
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 34:41){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="Budget balance", ylim=c(-5,1))
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Interest rates of 10 year government bonds
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 42:49){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="Interest rate", ylim=c(-1,4))
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Foreign exchanges
par(mfrow=c(1,1))
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 50:56){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="Foreign exchange")
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Stock market indeces
par(mfrow=c(1,1))
par(mfrow=c(3,4))
cnames <- names(x3)
for (i in 57:67){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="Stock market index")
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Bonds and commodities
par(mfrow=c(1,1))
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 68:74){
  plot(x3$DATE, x3[,i], xlab=cnames[i], ylab="US Dollar")
  lines(x3$DATE, x3[,i])
  abline(lm(x3[,i]~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}


##### Using normalized version of data

# plot Foreign exchanges
par(mfrow=c(1,1))
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 50:56){
  plot(x3$DATE, scale(x3[,i]), xlab=cnames[i], ylab="Foreign exchange", ylim=c(-1.5,1.5))
  lines(x3$DATE, scale(x3[,i]))
  abline(lm(scale(x3[,i])~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Stock market indeces
par(mfrow=c(1,1))
par(mfrow=c(3,4))
cnames <- names(x3)
for (i in 57:67){
  plot(x3$DATE, scale(x3[,i]), xlab=cnames[i], ylab="US Dollars", ylim=c(-1.5,1.5))
  lines(x3$DATE, scale(x3[,i]))
  abline(lm(scale(x3[,i])~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
# plot Bonds and commodities
par(mfrow=c(1,1))
par(mfrow=c(2,4))
cnames <- names(x3)
for (i in 68:74){
  plot(x3$DATE, scale(x3[,i]), xlab=cnames[i], ylab="US Dollars", ylim=c(-1.5,1.5))
  lines(x3$DATE, scale(x3[,i]))
  abline(lm(scale(x3[,i])~x3$DATE), col='blue')
  #abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}

s <- subset(x3, DATE>"2018-8-06", c(DATE, IR.US, FX.JP, FX.EU, SP, NDQ, METAL, GOLD))
par(mfrow=c(2,4))
cnames <- names(s)
for (i in 2:8){
  plot(s$DATE, s[,i], xlab=cnames[i], ylab="Interest rate")
  lines(s$DATE, s[,i])
  abline(lm(s[,i]~s$DATE), col='blue')
  abline(h=0, col="red")
  #text(x3$DATE, x3[,i]+0.5, label=x3[,i], cex=1)
}
s

# ------------------------------------------------
# 2019.4.21 Sun
# Test interpolation(), not extrapolation
# ------------------------------------------------
x <- 1:10
y <- rnorm(10)
par(mfrow = c(2,1))
plot(x, y, main = "approx(.) and approxfun(.)")
points(approx(x, y), col = 2, pch = "*")
points(approx(x, y, method = "constant"), col = 4, pch = "*")

f <- approxfun(x, y)
curve(f(x), 0, 10, col = "green")
points(x, y)
is.function(fc <- approxfun(x, y, method = "const")) # TRUE
curve(fc(x), 0, 10, col = "darkblue", add = TRUE)

x <- c(2,2:4,4,4,5,5,7,7,7)
y <- c(1:6, 5:4, 3:1)
approx(x,y, xout=x)$y # warning
(ay <- approx(x,y, xout=x, ties = "ordered")$y)
stopifnot(ay == c(2,2,3,6,6,6,4,4,1,1,1))
approx(x,y, xout=x, ties = min)$y
approx(x,y, xout=x, ties = max)$y

df <- data.frame(approx(x, y))
plot(df)

f <- function(x){x^2}  # define a function
curve(f(x), -10, 10)  # draw the line of the function 
f <- approxfun(x, y) # get a function approximated by the data, x and y
f(2)  # get a y value by giving x to the function
curve(f(x), 0, 20)  # draw the line of the approximated function
points(x, y)  # put points on the curve

# ------------------------------------------------
# 2019.4.25 Thu
# How to put {} for if else statements
# ------------------------------------------------
a <- 1
b <- 2

  if (!a %% 2){
    a <- 10
    a
  } else {
    b <- 20
    b
  }
# ------------------------------------------------
# 2019.4.28 Sun
# Install TF for R
# ------------------------------------------------
devtools::install_github("rstudio/tensorflow")

library(tensorflow)
install_tensorflow()
install_tensorflow(version = "1.12")
# ------------------------------------------------
# 2019.4.28 Sun
# Test Keras
# ------------------------------------------------
library(keras)

boston_housing <- dataset_boston_housing()
#dataset_boston_housing(path="/Users/keijiharada/Downloads/boston_housing.npz")

c(train_data, train_labels) %<-% boston_housing$train # assign x and y of train onto train_data and train_labels each. 
c(test_data, test_labels) %<-% boston_housing$test

library(tibble)
column_names <- c('CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE', 
                  'DIS', 'RAD', 'TAX', 'PTRATIO', 'B', 'LSTAT')
train_df <- as.tibble(train_data)
colnames(train_df) <- column_names

# Normalize features
train_data <- scale(train_data) 
train_data[1,]

# Normalize test dataset using means and standard deviations of training dataset.
col_means_train <- attr(train_data, "scaled:center") 
col_stddevs_train <- attr(train_data, "scaled:scale")
test_data <- scale(test_data, center = col_means_train, scale = col_stddevs_train)

## Create model
build_model <- function() {
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu",
                input_shape = dim(train_data)[2]) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dense(units = 1)
  
  model %>% compile(
    loss = "mse",
    optimizer = optimizer_rmsprop(),
    metrics = list("mean_absolute_error")
  )
  
  model
}

model <- build_model()
model %>% summary()

# Display training progress by printing a single dot for each completed epoch.
print_dot_callback <- callback_lambda(
  on_epoch_end = function(epoch, logs) {
    if (epoch %% 80 == 0) cat("\n")
    cat(".")
  }
)    

epochs <- 500

history <- model %>% fit(
  train_data,
  train_labels,
  epochs = epochs,
  validation_split = 0.2,
  verbose = 0,
  callbacks = list(print_dot_callback)
)

library(ggplot2)

plot(history, metrics = "mean_absolute_error", smooth = FALSE) +
  coord_cartesian(ylim = c(0, 5))

## implement "early stop" on neural nets learning process
#
# early_stop <- callback_early_stopping(monitor = "val_loss", patience = 20)
# 
# model <- build_model()
# history <- model %>% fit(
#   train_data,
#   train_labels,
#   epochs = epochs,
#   validation_split = 0.2,
#   verbose = 0,
#   callbacks = list(early_stop, print_dot_callback)
# )
# 
# plot(history, metrics = "mean_absolute_error", smooth = FALSE) +
#   coord_cartesian(xlim = c(0, 150), ylim = c(0, 5))
# 
# c(loss, mae) %<-% (model %>% evaluate(test_data, test_labels, verbose = 0))
# 
# paste0("Mean absolute error on test set: $", sprintf("%.2f", mae * 1000))
# 

test_predictions <- model %>% predict(test_data)
test_predictions[ , 1]

par(mfrow=c(2,2))
plot(test_predictions~test_labels, ylim=c(0, 50), main="neural nets")
fit <- lm(test_predictions~test_labels)
abline(fit)
dev <- deviance(fit)
text(x=40, y=10, label=round(dev,0), cex=0.7)
#boxplot(fit$residuals)
#hist(fit$residuals)

## removed worst predictions 
x <- data.frame(cbind(test_predictions, test_labels))
subset(x, test_labels < 30 & test_labels > 10 & V1 > 40)
test_predictions2 <- test_predictions[c(1:19, 21:70, 72:97, 99:102)]
test_labels2 <- test_labels[c(1:19, 21:70, 72:97, 99:102)]

plot(test_predictions2~test_labels2, ylim=c(0, 50), main="neural nets2")
fit_nn2 <- lm(test_predictions2~test_labels2)
abline(fit_nn2)
dev_nn2 <- deviance(fit_nn2)
text(x=40, y=10, label=round(dev_nn2,0), cex=0.7)


library(caret)  # "rf" stands for "random forest"
bh.train <- data.frame(boston_housing$train)
bh.test <- data.frame(boston_housing$test)

library(caret)

# modFit <- train(y~., data=bh.t, method='rf', prox=TRUE)
# modlda <- train(y~., data=bh.t, method="lda")  # Linear Discriminant Analysis
# modnb  <- train(y~., data=bh.t, method="nb")   # Naive Bayes
# modelFit <- train(y ~.,method="glm",data=bh.t)
model2 <- lm(y~., data=bh.train)
pred2 <- predict(model2, bh.test)

plot(pred2~test_labels, ylim=c(0, 50), main="lm")
fit2 <- lm(pred2~test_labels)
abline(fit2)
dev2 <- deviance(fit2)
text(x=40, y=10, label=round(dev2,0), cex=0.7)
#boxplot(fit2$residuals, ylim=c(-10, 25))
#hist(fit2$residuals)

## Test random forest, this time with different package
## https://www.r-bloggers.com/random-forests-in-r/
require(randomForest)
model3 <- randomForest(y~., data=bh.train)
model3
pred3 <- predict(model3, bh.test)
plot(pred3~test_labels, ylim=c(0, 50), main="random forest")
fit3 <- lm(pred3~test_labels)
abline(fit3)
dev3 <- deviance(fit3)
text(x=40, y=10, label=round(dev3,0), cex=0.7)

## Test glm 
## https://www.statmethods.net/advstats/glm.html
model4 <- glm(y~., data=bh.train, family=)
model4
pred4 <- predict(model4, bh.test)
plot(pred4~test_labels, ylim=c(0, 50), main="glm")
fit4 <- lm(pred4~test_labels)
abline(fit4)
dev4 <- deviance(fit4)
text(x=40, y=10, label=round(dev4,0), cex=0.7)

library(e1071)
model5  <- naiveBayes(y~., data=bh.train, na.action=na.pass)   # Naive Bayes
model5  <- naiveBayes(y~., data=bh.train)   # Naive Bayes

pred5 <- predict(model5, newdata=bh.test)
plot(pred5~test_labels, ylim=c(0, 50), main="naive bayes")
fit5 <- lm(pred5~test_labels)
abline(fit5)
dev5 <- deviance(fit5)
text(x=40, y=10, label=round(dev5,0), cex=0.7)


# ------------------------------------------------
# 2019.4.29 Mon
# Test plotly animation
# https://plot.ly/r/animations/
# ------------------------------------------------
library(plotly)
library(gapminder)

## Animations
p <- gapminder %>%
  plot_ly(
    x = ~gdpPercap, 
    y = ~lifeExp, 
    size = ~pop, 
    color = ~continent, 
    frame = ~year, 
    text = ~country, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )

p <- p %>% 
  animation_opts(
    1000, easing = "elastic", redraw = FALSE
  )

# ------------------------------------------------
# 2019.4.29 Mon
# Two plots
# https://moderndata.plot.ly/upgrading-to-plotly-4-0-and-above/?_ga=2.194279917.1770805992.1556496001-1776000975.1545386946
# ------------------------------------------------
subplot(
  plot_ly(economics, x = ~date, y = ~psavert, type = "scatter") %>% 
    add_trace(y = ~uempmed) %>%
    layout(yaxis = list(title = "Two Traces")),
  plot_ly(economics, x = ~date, y = ~psavert) %>% 
    add_trace(y = ~uempmed) %>% 
    layout(yaxis = list(title = "One Trace")),
  titleY = TRUE, shareX = TRUE, nrows = 2
) %>% hide_legend()


# ------------------------------------------------
# 2019.5.1 Wed : Bad
# 3D ggplot : the plot can NOT be rotated using mouse
# rCharts : doesn't work with the latest R 3.5.1
# https://stackoverflow.com/questions/45052188/how-to-plot-3d-scatter-diagram-using-ggplot
# ------------------------------------------------

# ------------------------------------------------
# 2019.5.2 Thu : Quiz4 of DS
# glm
# ------------------------------------------------

library(MASS)
data(shuttle)
shuttle$auto <- 1 * (shuttle$use=="auto")
shuttle$headwind <- 1 * (shuttle$wind=="head")
fit <- glm(auto~headwind, data=shuttle, family=binomial)

exp(coef(fit))
(Intercept)    headwind 
1.3272727   0.9686888 

predict(fit, newdata=data.frame(headwind=shuttle$headwind))

  # Odds ratio between auto and headwind is almost 1, 
  # which means that both probabilities are the same.
  # There are 145 cases of auto=1, of which there are 72 cases of 
  # headwind=1.

shuttle$tailwind <- 1 * (shuttle$wind=="tail")
shuttle$vis <- 1 * (shuttle$vis=="yes")
fit <- glm(auto~tailwind, data=shuttle, family=binomial)
exp(coef(fit))

fit <- glm(auto~headwind+magn+vis, data=shuttle, family=binomial)
exp(coef(fit))

exp(predict(fit, newdata=data.frame(headwind=1, magn="Medium")))

# ------------------------------------------------
# 2019.5.2 Thu : DS
# Understand Prediction with Trees
# file:///Users/keijiharada/AI/Coursera/Data_Science/sux13-DataScienceSpCourseNotes-ab9dbc9/8_PREDMACHLEARN/Practical_Machine_Learning_Course_Notes.html#constructing-trees-with-caret-package
# ------------------------------------------------
data(iris); library(ggplot2)
inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training <- iris[inTrain, ]
testing <- iris[-inTrain, ]

library(caret)  # "rf" stands for "random forest"
modFit <- train(Species~., data=training, method="rpart")
#modFit <- train(Species~., data=training, method="rf")

print(modFit$finalModel)
rattle::fancyRpartPlot(modFit$finalModel)

ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=factor(Species))) + 
    geom_point(size=2, alpha=1/2, ) 
# ------------------------------------------------
# 2019.5.4 Sat : How to calculate Power
# https://www.cyclismo.org/tutorial/R/power.html
# ------------------------------------------------
par(mfrow=c(1,1))
a <- 5
s <- 2
n <- 20
set.seed(20190504)
hist(rnorm(20, mean=5, sd=s/sqrt(n)), xlim=c(3, 7))
error <- qnorm(0.975)*s/sqrt(n)
left <- a-error
right <- a+error
abline(v=left)
abline(v=right)

# ------------------------------------------------
# 2019.5.5 Sun : Dataset "swiss"
# ------------------------------------------------
> swiss
Fertility Agriculture Examination Education Catholic
Courtelary        80.2        17.0          15        12     9.96
Delemont          83.1        45.1           6         9    84.84
Franches-Mnt      92.5        39.7           5         5    93.40
Moutier           85.8        36.5          12         7    33.77

# ------------------------------------------------
# 2019.5.6 Mon : log likelihood
# https://www.cyclismo.org/tutorial/R/power.html
# ------------------------------------------------

# Deviance is squared sum of erros.
# This is the same with a poisson, binomial distribution.
x <- rnorm(10)
fit <- lm(x~1)
fit$coefficients
sum((x-fit$coefficients)^2) # square sum of errorss
[1] 15.94732
deviance(fit) # deviance of the linear model
[1] 15.94732

# ------------------------------------------------
# 2019.5.6 Mon : Dataset "InsectSprays"
# ------------------------------------------------
> head(InsectSprays)
count spray
1    10     A
2     7     A
3    20     A
4    14     A
5    14     A
6    12     A

x <- split(IS, IS$spray)
x <- data.frame(split(IS, IS$spray))
x1 <- x[, c(1,3,5,7,9)]
boxplot(x1)

x <- InsectSprays
x$number <- rownames(x)
spread(InsectSprays, spray, count)

# ------------------------------------------------
# 2019.5.11 Sat
# K Means  
# ------------------------------------------------
iris1 <- data.matrix(iris)
cl <- kmeans(iris1, 3)
plot(iris1, col=cl$cluster)
points(cl$centers, col=1:4, pch=8, cex=2)

subset(iris, Sepal.Length > 4, c(Sepal.Length, Species))
sapply(split(iris, iris$Species), nrow)
with(iris, tapply(Sepal.Length, Species, mean))

with(iris, plot_ly(x=Sepal.Length, y=Sepal.Width, z=Petal.Length,
        type='scatter3d', mode="markers", color=Sepal.Length))


# ------------------------------------------------
# 2019.5.12 Sun
# Plotly 3D
# Trying to understand the meaning of glm coefficients
# ------------------------------------------------
x <- glm(vs~wt+disp, family=binomial, data=mtcars)
summary(x)
exp(confint(x))

with(mtcars, plot_ly(x=wt, y=disp, z=vs,
                   type='scatter3d', mode="markers", color=wt))

with(mtcars, plot_ly(x=wt, y=disp, z=vs, type='scatter3d', mode="lines",
                     opacity=1, line=list(width=6, color=~wt, reverscale=TRUE)))

with(mtcars, plot_ly(x=wt, y=disp, z=vs, type='scatter3d', mode="lines",
                     opacity=1, line=list(width=6, color=~wt, reverscale=FALSE)))

with(mtcars, plot_ly(x=wt, y=disp, z=vs, type='scatter3d', mode="markers"))
with(mtcars, plot_ly(x=wt, y=disp, z=vs, type='scatter3d', mode="lines"))
with(mtcars, plot_ly(x=wt, y=disp, z=vs, type='scatter3d', mode="mesh3d"))

predict(x, newdata=data.frame(wt=2.62, disp=160))
yhat <- predict(x, newdata=data.frame(wt=mtcars$wt, disp=mtcars$disp))

par(mfrow=c(2,2))
#plot(y, exp(yhat)/(1+exp(yhat)))
plot(mtcars$wt, exp(yhat)/(1+exp(yhat)), xlab="wt")
plot(mtcars$disp, exp(yhat)/(1+exp(yhat)), xlab="disp")
plot(mtcars$wt, y)
plot(mtcars$disp, y)


# ------------------------------------------------
# 2019.5.12 Sun
# Power
# ------------------------------------------------

power.t.test(power=0.8, NULL, delta=0.01, sd=0.04, type="one.sample", alt="one.sided")

# refer to http://users.stat.umn.edu/~corbett/classes/3022/Power_and%20_sample_size_for_t_in_R.txt
power.t.test( 20 , 1 , 3 , .05 , NULL , type = "one.sample" )
power.t.test( NULL , 1 , 3 , .05 , .8 , type = "one.sample" )
power.t.test( 20 , NULL , 3 , .05 , .8 , type = "one.sample" )

power.t.test( NULL , 1 , 3 , .05 , .8 )


x3 <- read.csv("20190608-economist.csv")

# ------------------------------------------------
# 2019.6.29 Sat
# Data analysis practice using UCI data
# UCI-Abalone.Rmd
# ------------------------------------------------
# Abalone
x <- read.csv("abalone.data")
cnames <- c("Sex", "Length", "Diameter", "Height", "Whole.weight", "Shucked.weight", "Viscera.weight", "Shell.weight", "Rings")
names(x) <- cnames

library(caret)
set.seed(20190629)
inTrain = createDataPartition(x$Rings, p=3/4)
inTrain = createDataPartition(x$Rings, p=3/4)[[1]]
training = x[inTrain,]
testing = x[-inTrain,]
require(randomForest)
rf <- randomForest(Rings~., data=training)

pred <- predict(rf, testing)
par(mfrow=c(1,1))
plot(pred, testing$Rings, xlim=c(0, 20))
fit <- lm(pred~testing$Rings)
abline(fit)
text(x=15, y=5, label=round(dev, 0), cex=0.7)
dev <- deviance(fit)
summary(fit)
hist(fit$residuals)

par(mfrow=c(1,2))
plot(testing$Rings)
plot(pred)

rf <- randomForest(Rings~., data=training, importance=TRUE)
par(mfrow=c(2,2))
boxplot(rf$rsq)
hist(rf$rsq)
hist(rf$mse)

sd(x)

x2 <- x[, 2:9]
library(caret)
set.seed(20190629)
inTrain = createDataPartition(x2$Rings, p=3/4)
inTrain = createDataPartition(x2$Rings, p=3/4)[[1]]
training = x2[inTrain,]
testing = x2[-inTrain,]

library(e1071)
nb <- naiveBayes(Rings~., data=training)   # Naive Bayes
pred <- predict(nb, testing, type="raw")

par(mfrow=c(1,1))
plot(pred, testing$Rings, xlim=c(0, 20))

model5  <- naiveBayes(y~., data=bh.train)   # Naive Bayes


# Do you really need all the variable to do random forest?
# Or use other machine learning such as NB?
# Get better prediction by removing infant data?
# Need to change the rate b/w training and testing?
# Too small data?
# Creating variables by combining existing variable?

# ------------------------------------------------
# 2019.6.29 Sat
# control the color of polar plot
# so as color the marker based on the clustering result
# ------------------------------------------------
library(dplyr)
library(plotly)
p <- plot_ly(
  type = 'scatterpolar',
  r = c(0,1,2,2),
  theta = c(0,45,90,0),
  mode = 'markers'
)
p

freq <- sample(30:300, 40)
angle <- sample(0:360, 40)
height <- runif(40, 1, 4)
margin <- runif(40, 0, 15)
product <- sample(c("A", "B", "C"), 40, replace=TRUE)
emi <- data.frame(cbind(freq, angle, height, margin))
#emi1$product <- product
#emi <- filter(emi, height >= 1 & height < 2)
cluster <- kmeans(emi, 3)
emi$color <- cluster$cluster

for (i in 1:length(cluster$cluster)) {
  if (cluster$cluster[i]==1){
  emi$color[i] <- "red" 
  }
  else if(cluster$cluster[i]==2){
  emi$color[i] <- "green" 
  }
  else if(cluster$cluster[i]==3){
  emi$color[i] <- "yellow" 
  }
  else {
  emi$color[i] <- "black" 
  }
}

library(plotly)
p <- plot_ly(
  type = 'scatterpolar',
  mode = 'lines'
) %>%
  add_trace(
    type = 'scatterpolar',
    r = emi$margin,
    theta = emi$angle,
    mode = 'markers',
    name = 'antenna 1-2m',
    mode = "text",
    marker = list(size=10, color=emi$color, opacity=0.7),
    text = emi$freq
  ) %>% layout(polar=list(radialaxis=list(range=c(0, 15)), 
                          autosize = F, width = 700, height = 700))
p

#p <- ggplot(emi, aes(x = freq, y = margin, color = emi$color)) +
p <- ggplot(emi, aes(x = freq, y = margin)) +
  geom_point(color = emi$color)
ggplotly(p)

library(leaflet)
emi %>% 
highlight_key(~color) %>%
plot_ly(x=~freq, y=~margin, text=round(margin, 2), 
        mode="markers+text", textposition="top", hoverinfo="x+y", 
        color=~color) %>%
highlight(on="plotly_hover", off="plotly_doubleclick")
  
highlight(ggplotly(p), "plotly_hover")


# ------------------------------------------------
# 2019.7.8 Mon
# Polar plot with ggplot
# https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html
# ------------------------------------------------
install.packages("ggrepel")
library(ggrepel)
set.seed(42)

mtcars$label <- rownames(mtcars)
mtcars$label[mtcars$mpg < 25] <- ""

p <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl), label = label)) +
  coord_polar(theta = "x") +
  geom_point(size = 2) +
  scale_color_discrete(name = "cyl") +
  geom_text_repel(show.legend = FALSE) + # Don't display "a" in the legend.
  theme_bw(base_size = 18)
p
ggplotly(p)

# ------------------------------------------------
# 2019.7.20 Sat
# Data analysis practice using UCI data
# UCI-Adult.Rmd
# ------------------------------------------------
# Adult

setwd("/Users/keijiharada/Downloads")
x <- read.csv("adult.data")
cnames <- c("Age", "Workclass", "Fnlwgt", "Education", "Education.num", "Marital.status",
            "Occupation", "Relationship", "Race", "Sex", "Capital.gain", "capital.loss",
            "Hours.per.week", "Native.country", "Encome")
names(x) <- cnames

library(caret)
set.seed(20190629)
inTrain = createDataPartition(x$Rings, p=3/4)
inTrain = createDataPartition(x$Rings, p=3/4)[[1]]
training = x[inTrain,]
testing = x[-inTrain,]
require(randomForest)
rf <- randomForest(Rings~., data=training)

# ------------------------------------------------
# 2019.8.2 Fri
# Study multi dimention data 
# ------------------------------------------------

x <- array(1:24, dim=c(4,3,2), dimnames=list(
  c("c0", "c1", "c2", "c3"),
  c("r0", "r1", "r3"),
  c("t0", "t1"))
)

ncol(x)
nrow(x)
dim(x)
length(x)
rownames(x)
colnames(x)
dimnames(x)
#https://www.oreilly.com/library/view/learning-r/9781449357160/ch04.html

y <- array(25:48, dim=c(4, 3, 2))
cbind(x, y)
rbind(x, y)

# ------------------------------------------------
# 2019.8.3 Sat
# merge(d0, d1, by="state")
# ------------------------------------------------

authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  retired = c("yes", rep("no", 4)))

books <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA))

merge(authors, books, by.x="surname", by.y="name")
merge(books, authors, by.x="name", by.y="surname")#
 ------------------------------------------------
# 2019.8.3 Sat
# ggmap test
# ------------------------------------------------
install.packages("mapproj")
install.packages("ggmap")
install.packages("DeducerSpatial")

require(maps)
require(ggmap)

par(mfrow=c(2,1))
map("usa")
map("county")
map("world", "China")
par(mfrow=c(1,1))
map.cities(country="China", capitals=2)
map("state", "GEORGIA")
data(us.cities)
map.cities(us.cities, country="GA")
map("world", "Japan")
map.cities(country="Japan", capitals=3)

# ------------------------------------------------
# 2019.8.2 Fri
# sapply, tapply, subset, split
# ------------------------------------------------


sapply(split(mtcars, mtcars$gear), nrow)
with(mtcars, tapply(mpg, cyl, mean))
subset(mtcars, cyl==6, c(mpg, cyl, carb))

x2 %>% group_by(Race, Sex) %>% mutate(ave=mean(Age))
# ------------------------------------------------
# 2019.8.4 Sun
# Data analysis practice using UCI data
# UCI-Badges
# ------------------------------------------------

setwd("/Users/keijiharada/Downloads")
x <- read.csv("badges.csv", header=TRUE)
#x <- read.table("badges.data", header=FALSE, fill=TRUE, strip.white=TRUE)

# I had a problem importing the file, badges.data, but avoided it by once
# converting all spaces into commas and changed the extension of the file
# from data to csv. Then open it with Number and export it as "badges.csv".
# Somehow Number could read the file correctly, with five variables.

#x2 <- x[-c(57,108), ]
#cnames <- c("badge", "n1", "n2", "n3")
#names(x2) <- cnames

library(caret)
set.seed(20190805)
inTrain = createDataPartition(x$p, p=3/4)[[1]]
training = x[inTrain,]
testing = x[-inTrain,]
require(randomForest)
rf <- randomForest(p~., data=training)

library(e1071)
nb <- naiveBayes(p~., data=training)   # Naive Bayes
pred <- predict(nb, testing, type="raw")

yhat <- c(1:dim(pred)[1])
for(i in 1 : dim(pred)[1]) {
  if(pred[i, 2] > 0.5){
    yhat[i] <- "+"
  }
  else{
    yhat[i] <- "-"
  }
}
  
mean(yhat == testing$p)

postResample(yhat, testing$p)

### Aug 6, 2019 ###
# removed two data from x and defined it as x2
# run rf again but failed due to an error
# run nb again and I got "Jr." and 'Maza" that should have been removed somehow.


# ------------------------------------------------
# 2019.8.8 Thu
# A plot with different marker size
# ------------------------------------------------
library(plotly)
library(ggplot2)
library(tidyr)
library(dplyr)

esd <- data.frame(c(1.3, 1.3, 1.3, 2.6, 2.6, 5.2))
loc <- data.frame(c("CRFFC","CRFFC","CRFFC","CRFFC","CRFFC","CRFFC"))
freq <- data.frame(c(3, 3, 3, 2, 2, 1))

res <- cbind(esd, loc, freq)
names(res) <- c("esd", "loc", "freq") 

a <- table(res$esd)
as.data.frame(a)

p <- ggplot(res, aes(x=loc, y=esd, color=loc)) +
  geom_point(size=res$freq*2, alpha=0.5)
ggplotly(p)

# ------------------------------------------------
# 2019.8.11 Sun
# How to use group_by
# ---------------------------------------------
x <- read.csv("adult.data")
cnames <- c("Age", "Workclass", "Fnlwgt", "Education", "Education.num", "Marital.status",
             "Occupation", "Relationship", "Race", "Sex", "Capital.gain", "capital.loss",
              "Hours.per.week", "Native.country", "Income")
names(x) <- cnames
x1 <- x[, c(1, 2, 4)]
x2 <- x %>% group_by(Race, Sex) %>% mutate(ave=mean(Age))


# ------------------------------------------------
# 2019.8.17 Sat
# Play with leaflet and googleVis
# ------------------------------------------------

library(leaflet)

travel2019 = data.frame(
  lat = c(41.3851,40.4168),
  lng = c( 2.1734, -3.7038),
  labels=c("MAD", "BCN")
)
m = leaflet(travel2019) %>% addTiles %>% addMarkers(popup=~labels)
m

install.packages("googleVis")
library(googleVis)
stateDF = data.frame(State = state.name, state.x77)
gchart = gvisGeoChart(data = stateDF,
                      locationvar = "State",
                      colorvar = "Population",
                      options = list(region="Japan",
                                     displayMode="regions",
                                     resolution="provinces",
                                     width=600, height=400))
plot(gchart)

# ------------------------------------------------
# 2019.8.17 Sat
# FFT
# Refer to ddp.pdf, the book of developing data product in R
# ------------------------------------------------
notes4 <- c(261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25)
## The time variable (how long the chord is played and how frequently it is digi\
#tally sampled)
t <- seq(0, 2, by = .001); n <- length(t)
## The notes for a C Major Chord
c4 <- sin(2 * pi * notes4[1] * t); e4 <- sin(2 * pi * notes4[3] * t);
g4 <- sin(2 * pi * notes4[5] * t)
## Create the chord by adding the three together
chord <- c4 + e4 + g4 + rnorm(n, 0, 0.3)
## Create a basis that has all of the notes
x <- sapply(notes4, function(freq) sin(2 * pi * freq * t))
## Fit the model
fit <- lm(chord ~ x - 1)
cof <- fit$coefficients
plot(t, chord, type = "l")
a <- fft(chord)
plot(Re(a)^2, type = "l")


# ------------------------------------------------
# 2019.8.26 Mon
# How to run app online
# ------------------------------------------------
shiny::runGist("c4db11d81f3c46a7c4a5")


# ------------------------------------------------
# 2019.9.14
# making sample waveforms
# ------------------------------------------------
install.packages("tuneR")
library(tuneR)
# About 'tunrR' refer to https://cran.csiro.au/web/packages/tuneR/tuneR.pdf
# 'seewave' may be interesting as well.

Wobj <- sine(440, duration = 1000)
Wobj2 <- noise(duration = 1000)
Wobj3 <- pulse(220, duration = 1000)
plot(Wobj)
plot(Wobj2)
plot(Wobj3)


ang <- c(1:360)
amp <- rnorm(1, mean=0.8, sd=0.2)
#sns <- amp * c(rep(0, 20), seq(0.1, 1, 0.1), rep(1, 10), seq(0.9, 0, -0.1), rep(0, 310))
sns <- amp * c(sin(rnorm(20, mean=0.1, sd=0.05)),   # zero
               seq(0.1, 1, 0.1),                    # ramp up
               rep(1, 10) + sin(rnorm(10, mean=0.1, sd=0.05)),   # peak
               seq(0.9, 0, -0.1),    # ramp down
               sin(rnorm(310, mean=0.1, sd=0.1)))   # zero
det <- c(rep(0, 40), rep(1, 10), rep(0, 310))
org <- data.frame(cbind(ang, sns, det))
par(mfrow=c(1,1))
plot(org$ang, org$sns, type="l", ylim=c(0, 1.2))
points(org$ang, org$det, type="l", col="red")

### Test generating data as plotting ####
par(mfrow=c(1,1))
#i <- sample(1:359, 1)
i <- sample(1:309, 1)
amp <- rnorm(1, mean=0.8, sd=0.2)
sim.sns <- c(org$sns[(360-(i-1)):360], org$sns[1:(360-i)]) * amp
sim.det <- c(org$det[(360-(i-1)):360], org$det[1:(360-i)])
plot(org$ang, sim.sns, type="l", ylim=c(0,1))
points(org$ang, sim.det, type="l", col="red")
#sim[j] <- data.frame(cbind(ang, sim.sns, sim.det))

### Generating data ####
data <-  array(1:1000*360*3, dim=c(1000, 360, 3))
for(j in 1:1000){
  i <- sample(1:309, 1)
  amp <- rnorm(1, mean=0.8, sd=0.2)
  sim.sns <- c(org$sns[(360-(i-1)):360], org$sns[1:(360-i)]) * amp
  sim.det <- c(org$det[(360-(i-1)):360], org$det[1:(360-i)])
  data[j,,] <- (cbind(ang, sim.sns, sim.det))
}

### Confirming the data as plotting ####
par(mfrow=c(3,3))
for(n in 1:9){
  plot(data[n,,2], type='l', ylim=c(0, 1.2))
  points(data[n,,3], type='l', col='red')
}


### Making a model that predict down edge of the pulse
# 1st of all I need to create 2x2 data frame from the array of 1000x360x3
# I can do that simply by arranging all 1000 data vertically

vdata <- data.frame(matrix(1:360*3, 360, 3))
for(j in 1:100){
  i <- sample(1:309, 1)
  amp <- rnorm(1, mean=0.8, sd=0.2)
  sim.sns <- c(org$sns[(360-(i-1)):360], org$sns[1:(360-i)]) * amp
  sim.det <- c(org$det[(360-(i-1)):360], org$det[1:(360-i)])
  if(j==1){
      vdata <- cbind(ang, sim.sns, sim.det)
  }
  else{
    vdata <- rbind(vdata, cbind(ang, sim.sns, sim.det))
  }
}
data <- data.frame(vdata)

### Training with RF
library(caret)
require(randomForest)
start.time <- Sys.time()
rf <- randomForest(sim.det~., data=data) 
end.time <- Sys.time()
Pasttime <- start.time - end.time

pred <- predict(rf, data[1:360,])
plot(data[1:360, 1], data[1:360, 2], type='l', ylim=c(0, 1.2))
points(data[1:360, 1], pred, type='l', col='red')
postResample(pred, testing$sim.det)

### Confirming the data as plotting ####
par(mfrow=c(3,3))
for(n in 11:19){
  start <- 1+360*(n-1)
  end   <- start + 359
  pred <- predict(rf, data[start:end, ])
  pred2 <- pred-0.5>0
  plot(data[start:end, 1], data[start:end, 2], type='l', ylim=c(0, 1.2))
  points(data[start:end, 1], pred, type='l', col='red')
  points(data[start:end, 1], pred2, type='l', col='blue')
  points(data[start:end, 1], data[start:end, 3], type='l', col='green')
}


### Training with NB
library(e1071)
#nb <- naiveBayes(sim.det~., data=data, na.action=na.pass) 
#nb <- naiveBayes(sim.det~., data=data) 
data$sim.det.fac <- as.factor(data$sim.det)
start.time <- Sys.time()
#nb <- train(sim.det.fac ~ ang + sim.sns, data=data, method="nb")
nb <- naiveBayes(sim.det.fac ~ ang + sim.sns, data=data, na.action=na.pass) 
end.time <- Sys.time()
Pasttime <- start.time - end.time

### Confirming the data as plotting ####
par(mfrow=c(3,3))
for(n in 1:9){
  start <- 1+360*(n-1)
  end   <- start + 359
  pred <- predict(nb, data[start:end, 1:2])
  #pred2 <- pred-0.5>0
  plot(data[start:end, 1], data[start:end, 2], type='l', ylim=c(0, 1.2))
  points(data[start:end, 1], ifelse(pred=='1', 1, 0), type='l', col='red')
  points(data[start:end, 1], data[start:end, 3], type='l', col='green')
  #points(data[start:end, 1], pred2, type='l', col='blue')
}

### Training with GRU

build_model <- function() {
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu",
                input_shape = dim(train_data)[2]) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dense(units = 1)
  
  model %>% compile(
    loss = "mse",
    optimizer = optimizer_rmsprop(),
    metrics = list("mean_absolute_error")
  )
  
  model
}

build_model <- function() {
  model <- keras_model_sequential() %>%
    layer_gru(units = 360, activation = "tanh",
                input_shape = dim(data)[2]) %>%
    layer_dense(units = 1, activation = "sigmoid")
  
  model %>% compile(
    loss = "mse",
    optimizer = optimizer_rmsprop(),
    metrics = list("mean_absolute_error")
  )
  
  model
}


model <- build_model()
model %>% summary()

# Display training progress by printing a single dot for each completed epoch.
print_dot_callback <- callback_lambda(
  on_epoch_end = function(epoch, logs) {
    if (epoch %% 80 == 0) cat("\n")
    cat(".")
  }
)    

epochs <- 500

history <- model %>% fit(
  train_data,
  train_labels,
  epochs = epochs,
  validation_split = 0.2,
  verbose = 0,
  callbacks = list(print_dot_callback)
)

# ------------------------------------------------
# 2019.11.10 Sun
# R Practice
# ------------------------------------------------

# group
g <- gl(2, 50, labels=c("male", "female"))

# loess
x <- loess(mpg~hp, data=mtcars)
plot(x)
fit <- loess(mpg~hp, data=mtcars)
plot(x)
abline(fit)
qplot(hp, mpg, data=mtcars, geom=c("point", "smooth"))

# qplot
qplot(wt, mpg, data=mtcars, facet=.~am, geom=c("point", "smoooth"))
qplot(mpg, qsec, data=mtcars, facets=vs~.)+geom_smooth(method=lm)
qplot(mpg, qsec, data=mtcars, facets=vs~., color=am)+geom_smooth(method=lm)
qplot(mpg, qsec, data=mtcars, facets=vs~., color=as.factor(am))+geom_smooth(method=lm)
qplot(mpg, data=mtcars, fill=as.factor(gear))

# subset
subset(iris, Sepal.Length > 4, c(Sepal.Length, Species))
sapply(split(iris, iris$Species), nrow)
with(iris, tapply(Sepal.Length, Species, mean))

# spread
library(tidyr)

# ggplot
ggplot(InsectSprays, aes(x=spray, y=count)) + geom_boxplot()
ggplot(mtcars, aes(disp, mpg)) + geom_point() + geom_smooth()
ggplot(mtcars, aes(disp, mpg)) + geom_point() + geom_smooth(method="lm")
g <- ggplot(mtcars, aes(disp, mpg))
g + geom_point() + geom_smooth(method="lm") + facet_grid(.~cyl) + theme_bw()
g + geom_point(color="steelblue", size=4, alpha=1/2)
g + geom_point(aes(color=as.factor(gear)), size=4, alpha=1/2)
g + geom_point() + labs(title="test") + labs(x=expression("log"*PM[2.5]), y="Y")
g + geom_point() + geom_smooth(method="lm", se=FALSE)
ggplot(mtcars, aes(disp, mpg)) + geom_line() + ylim(10, 25)
g <- ggplot(mpg, aes(displ, hwy))
#g + geom_point(alpha=1/3) + facet_grid(cyl~class)
g + geom_point(alpha=1/3) + facet_wrap(cyl~class)



app = system.file('examples', 'DT-rows', package = 'DT')
shiny::runApp(app)

# ------------------------------------------------
# 2019.11.18 Mon
# Clustering Case Study
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
load("samsungData.rda")
names(samsungData)[1:12]
table(samsungData$activity)

par(mfrow=c(1,2), mar=c(5,4,1,1))
samsungData <- transform(samsungData, activity=factor(activity))
sub1 <- subset(samsungData, subject==1)
plot(sub1[, 1], col=sub1$activity, ylab=names(sub1[1]))
plot(sub1[, 2], col=sub1$activity, ylab=names(sub1[2]))
legend("bottomright", legend=unique(sub1$activity), col=unique(sub1$activity), pch=1)

subset(mtcars, carb==1)   # pick up all data where carb=1
subset(mtcars, carb==1, mpg)  # pick up mpg where carb=1

myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ##    hclust:    hclust object
  ##    lab:        a character vector of labels of the leaves of the tree
  ##    lab.col:    colour for the labels; NA=default device foreground colour
  ##    hang:     as in hclust & plclust
  ## Side effect:
  ##    A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height,2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]
  x <- x[which(x<0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot( hclust, labels=FALSE, hang=hang, ... )
  text( x=x, y=y[hclust$order]-(max(hclust$height)*hang), labels=lab[hclust$order], col=lab.col[hclust$order], srt=90, adj=c(1,0.5), xpd=NA, ... )}

distanceMatrix <- dist(sub1[,1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col=unclass(sub1$activity))

par(mfrow=c(1,2))
plot(sub1[,10], pch=19, col=sub1$activity, ylab=names(sub1)[10])
plot(sub1[,11], pch=19, col=sub1$activity, ylab=names(sub1)[11])

distanceMatrix <- dist(sub1[, 10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col=unclass(sub1$activity))


summation = function(n){
  for(i in 1:n-1){
    n <- n + i
  }
  n
}

# ------------------------------------------------
# 2019.11.2x 
# Study of sound data, trying to understand spectrogram, etc.
# ------------------------------------------------

install.packages("soundgen")
install.packages("tuneR")
install.packages("seewave")xinstall.packages("audio")
library(soundgen)
library(tuneR)
library(seewave)
library(audio)
s1 <- readWave("SCircuit.wav")
str(s1)
x <- s1@left
plot(x)

# ------------------------------------------------
# 2019.11.30 Sat
# BP management
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
#x <- read.csv("20191201-BP.csv")
#x <- read.csv("20200118-BP2.csv")
#x <- read.csv("20200524-BP2.csv")
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
x <- read.csv("20200921-BP2.csv")
#ggplot(x, aes(TIME, H))+geom_point(aes(TIME, L))+ylim(0, 200)
bp <- gather(x[,c(1:5)], HL, BP, -c(DATE, TIME, P))
bp <- gather(x[,c(1:6)], HL, BP, -c(DATE, TIME, P, HA))

bp$t <- as.POSIXct(strftime(paste(bp$DATE, bp$TIME), "%Y-%m-%d %H:%M"))
g <- ggplot(bp, aes(t, BP))
#p <- g + geom_point(size=3, alpha=1/2, aes(color=HL))
p <- g + geom_point(size=3, alpha=1/2, aes(color=HA))
p <- p + ylim(0, 200) + geom_hline(yintercept=c(120, 80), linetype="dotted", color="red")
ggplotly(p)

bp$t <- as.POSIXct(paste0(bp$TIME, ":00"), format="%H:%M:%S")
noon <- as.POSIXct(strptime("12:00:00", "%H:%M:%S"))
H <- subset(bp, HL=="H")
L <- subset(bp, HL=="L")
  # Portable OS Interface, calender time
  # String pointer time
g <- ggplot(bp, aes(t, BP))
p <- g + geom_point(size=3, alpha=1/2, aes(color=HA))
p <- p + ylim(0, 200) + geom_hline(yintercept=c(120, 80), linetype="dotted", color="red")
p <- p + scale_x_datetime(date_label="%H:%M")
p <- p + labs(x="measured time") 
p <- p + geom_text(x=noon, y=120, label="120")
p <- p + geom_text(x=noon, y=80, label="80")
p <- p + geom_smooth(data=H, method="lm", col="red", alpha=1/4, size=0.5)
p <- p + geom_smooth(data=L, method="lm", col="blue", alpha=1/4, size=0.5)
ggplotly(p)


x1 <- mutate(x, press = H-L)
g <- ggplot(x1, aes(x=H-L, fill=factor(HA)))
#p = g + geom_histogram(color="black", fill="lightblue", binwidth=5)
p = g + geom_histogram(binwidth=5)
gp = p + labs(x = "Diff btw High and Low")
ggplotly(p)

par(mfrow=c(3,1))
hist(x1$H, col=rgb(1,0,0,0.15), xlim=c(50, 140), ylim=c(0, 10), main="BP", xlab="mmHg")
hist(x1$L, col=rgb(0,0,1,0.15), add=TRUE)
text(x=mean(x1$L), y=10, labels=round(mean(x1$L)), col=rgb(0,0,1,1))
text(x=max(x1$L), y=10, labels=round(max(x1$L)), col=rgb(0,0,1,0.5))
text(x=mean(x1$H), y=10, labels=round(mean(x1$H)), col=rgb(1,0,0,1))
text(x=max(x1$H), y=10, labels=round(max(x1$H)), col=rgb(1,0,0,0.5))
points(x1$L, y=rep(0, length(x1$L)), pch=21, bg=rgb(0,0,1,0.15))
points(x1$H, y=rep(0, length(x1$H)), pch=21, bg=rgb(1,0,0,0.15))

hist(x1$press, col=rgb(1,0,1,0.15), xlim=c(0, 60), main="Highs - Lows", xlab="mmHg")
text(x=mean(x1$press), y=10, labels=round(mean(x1$press)), col=rgb(1,0,1,1))
text(x=max(x1$press), y=10, labels=round(max(x1$press)), col=rgb(1,0,1,0.5))
points(x1$press, y=rep(0, length(x1$press)), pch=21, bg=rgb(1,0,1,0.15))


hist(x1$P, col=rgb(0,1,0,0.15), xlim=c(50, 100), ylim=c(0, 12), main="pulses", xlab="BPM, beats per minute")
text(x=min(x1$P), y=10, labels=round(min(x1$P)), col=rgb(0,1,0,0.5))
text(x=mean(x1$P), y=10, labels=round(mean(x1$P)), col=rgb(0,1,0,1))
text(x=max(x1$P), y=10, labels=round(max(x1$P)), col=rgb(0,1,0,0.5))
points(x1$P, y=rep(0, length(x1$P)), pch=21, bg=rgb(0,1,0,0.15))

 ------------------------------------------------
# 2019.11.30 Sat
# EMI data analyses
# ------------------------------------------------
par(mfrow=c(1,1))
PreDE <- subset(f60re, Phase=="PreDE")
distM <- dist(PreDE[, c(1, 3:5)])
hclustering <- hclust(distM)
myplclust(hclustering, lab.col=unclass(sub1$Operation))
names(PreDE)

par(mfrow=c(1,2))
plot(PreDE[,3], pch=19, col=PreDE$Operation, ylab=names(PreDE)[3])
plot(PreDE[,4], pch=19, col=PreDE$Operation, ylab=names(PreDE)[4])

par(mfrow=c(1,1))
distanceMatrix <- dist(PreDE[, c(1, 3:5)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col=unclass(PreDE$Combo.SSCG))

#d <- d[!is.na(d)]
#which(is.na(escdf4), arr.ind=T)

x <- PreDE[, c(1, 3:5)]
#x <- subset(x, !is.na(x))
x2 <- filter(x, !is.na(x$Margin))
svd1 = svd(scale(x2))
par(mfrow=c(1,2))
plot(svd1$u[,1], col=PreDE$Operation, pch=19)
plot(svd1$u[,2], col=PreDE$Operation, pch=19)

#Find maximum contributer
plot(svd1$v[,2], pch=19)

par(mfrow=c(1,1))
maxContrib <- which.max(svd1$v[,2])
distanceMatrix <- dist(PreDE[, c(1, 3:5, maxContrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col=unclass(PreDE$Orientation))
names(PreDE)[maxContrib]


PreDE2 <- filter(PreDE, !is.na(PreDE$Margin))
PreDE3 <- filter(PreDE2, !is.na(PreDE2$Sources))

kClust <- kmeans(scale(x2), centers=16, nstart=100)
table(kClust$cluster, PreDE2$Sources)
plot(kClust$centers[11, 1:4], pch=19)

# ------------------------------------------------
# 2019.12.8 Sun
# Bootstrap in Statistical inference, Week4 
# ------------------------------------------------
library(UsingR)
data(father.son);
x <- father.son$sheight
n <- length(x)
ggplot(father.son, aes(x)) + geom_histogram()

B <- 10000
resamples <- matrix(sample(x, n*B, replace=TRUE), B, n) 
medians <- apply(resamples, 1, median)  # taking median of each row
sd(medians)
quantile(medians, c(0.025, 0.975))

g = ggplot(data.frame(medians=medians), aes(x=medians))
g = g + geom_histogram(color="black", fill="lightblue", binwidth=0.05)
g

# ------------------------------------------------
# 2019.12.15 Sun
# dplyr::group_by, dplyr::arrange
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
re <- read.csv(file("EMI-RE-20ciss-26.csv", encoding="Shift_JIS"))
write.csv(re, "data_input.csv", fileEncoding = "UTF-8")
dummy <- read.csv("EMI-RE-20ciss-dummy26.csv")
re2  <- mutate(re, Date2 = as.Date(re$Date, "%Y/%m/%d"))
dummy <-mutate(dummy, Date2 = as.Date(dummy$Date, "%Y/%m/%d"))
f60re <- filter(re2, Product=="F60" | Product=="F56" | Product=="F64" | Product=="F58" | Product=="F62")

x <- f60re[ !is.na(f60re$Margin) & !is.na(f60re$Phase), ] # Remove NAs on Margin and Phase
by_product <- group_by(x, Product) # Group by Product the data "x"

# Extract minmum data of each product in Report
by_product %>% filter(Phase=="Report") %>% filter(Margin==min(Margin)) 
by_product %>% filter(Phase=="Report") %>% filter(AC==120) %>% filter(Margin==min(Margin))
by_product %>% filter(Phase=="Report") %>% filter(AC==100) %>% filter(Margin==min(Margin))
by_product %>% filter(Phase=="Report") %>% filter(AC==230) %>% filter(Margin==min(Margin))

f60re %>% group_by(Engineer, Date2) %>% summarize(n()) %>% group_by(Engineer) %>% summarise(n())

f60re %>% group_by(Machine, Date2) %>% summarize(times=n()) %>% arrange(times)
mtcars %>% group_by(cyl, gear) %>% summarize(mean_mpg = mean(mpg, na.rm=TRUE))

# ------------------------------------------------
# 2019.12.27 Fri
# Coursera Bayesian Statistics:
# Techniques and Models W1
# Monte Carlo simulation
# ------------------------------------------------

m = 1e5

y = numeric(m)
phi=numeric(m)
for(i in 1:m){
  phi[i] = rbeta(1, shape1=2, shape2=2)
  y[i] = rbinom(1, size=10, prob=phi[i])
}

# ! Vercterized version
phi=rbeta(m, shape1=2.0, shape2=2.0)
y = rbinom(m, size=10, prob=phi)  # simulate

table(y)/m
plot(table(y)/m)

# Quiz
theta=rbeta(10000, shape1=5, shape2=3)
odds =mean(theta/(1-theta)) 

# ------------------------------------------------
# 2019.12.30 Mon
# Coursera Bayesian statistics
# Techniques and Models W1
# ------------------------------------------------
y <- rnorm(1000)
hist(y)
hist(y, freq=FALSE)
points(y, rep(0, 1000))
curve(dt(x, df=1), lty=2, add=TRUE)

# ------------------------------------------------
# 2019.12.30 Mon
# Poisson distribution
# Possibility of getting one error in 10 samples 
#   of a distribution whose average error rate is 1/200.
# ------------------------------------------------
ppois(1, 100/200) - ppois(0, 100/200)

# ------------------------------------------------
# 2019.12.31 Tue
# poisson.test
# ------------------------------------------------
# "city",   "age",  "pop", "cases"
# 5,  "Fredericia", "55-59",    800,    11
# 6,     "Horsens", "55-59",   1083,     6
# 7,     "Kolding", "55-59",   1050,     8
# 8,       "Vejle", "55-59",    878,     7

poisson.test(c(11, 6+8+7), c(800, 1083+1050+878))
poisson.test(c(11, 6+8+7), c(800, 1083+1050+878))$conf

lambda1 <- 11/800
lambda2 <- 21/3011
se1 <- sqrt(lambda1/1)
se2 <- sqrt(lambda2/2)

# https://stats.stackexchange.com/questions/15371/how-to-calculate-a-confidence-level-for-a-poisson-distribution
confint1 <- lambda1 + c(-1, 1)*1.96*se1
confint2 <- lambda2 + c(-1, 1)*1.96*se2

confint1
confint2

# Here is good material below
# https://cran.r-project.org/web/packages/exactci/vignettes/exactci.pdf

# ------------------------------------------------
# 2020.1.2 Thu
# Coursera Bayesian statistics
# Techniques and Models W2
# ------------------------------------------------

install.packages("rjags")

# 1. Specify the model
library(rjags)

mod_string = "model {
  for (i in 1:n){
    y[i] ~ dnorm(mu, 1.0/sig2)
  }
  mu ~ dt(0.0, 1.0/1.0, 1)
  sig2 = 1.0
}"
  
# 2. Set up the model
set.seed(50)

#y = c(1.2, 1.4, -0.5, 0.3, 0.9, 2.3, 1.0, 0.1, 1.3, 1.9)
y = c(-0.2, -1.5, -5.3, 0.3, -0.8, -2.2)
n = length(y)

data_jags = list(y=y, n=n)
#params = c("mu")  # c("mu", "sig2") if you want to add sig2 as the second parameter.
params = c("mu", "sig2")

inits = function() {
    init = list("mu"=1.0, "sig2"=1.0)
}

mod = jags.model(textConnection(mod_string), data=data_jags, inits=inits)  

# 3. Run the MCMC sampler
update(mod, 500)
mod_sim = coda.samples(model=mod, variable.names=params, n.iter=5000)

# 4. Post
library(coda)
plot(mod_sim)
summary(mod_sim)

# ------------------------------------------------
# 2020.1.6 Mon
# Coursera Bayesian statistics
# Techniques and Models W2
# ------------------------------------------------

update_mu = function(n, ybar, sig2, mu_0, sig2_0) {
  sig2_1 = 1.0 / (n / sig2 + 1.0 / sig2_0)
  mu_1 = sig2_1 * (n * ybar / sig2 + mu_0 / sig2_0)
  rnorm(n=1, mean=mu_1, sd=sqrt(sig2_1))
}

update_sig2 = function(n, y, mu, nu_0, beta_0) {
  nu_1 = nu_0 + n / 2.0
  sumsq = sum( (y - mu)^2 ) # vectorized
  beta_1 = beta_0 + sumsq / 2.0
  out_gamma = rgamma(n=1, shape=nu_1, rate=beta_1) # rate for gamma is shape for inv-gamma
  1.0 / out_gamma # reciprocal of a gamma random variable is distributed inv-gamma
}

gibbs = function(y, n_iter, init, prior) {
  ybar = mean(y)
  n = length(y)
  
  ## initialize
  mu_out = numeric(n_iter)
  sig2_out = numeric(n_iter)
  
  mu_now = init$mu
  
  ## Gibbs sampler
  for (i in 1:n_iter) {
    sig2_now = update_sig2(n=n, y=y, mu=mu_now, nu_0=prior$nu_0, beta_0=prior$beta_0)
    mu_now = update_mu(n=n, ybar=ybar, sig2=sig2_now, mu_0=prior$mu_0, sig2_0=prior$sig2_0)
    
    sig2_out[i] = sig2_now
    mu_out[i] = mu_now
  }
  
  cbind(mu=mu_out, sig2=sig2_out)
}

#y = c(1.2, 1.4, -0.5, 0.3, 0.9, 2.3, 1.0, 0.1, 1.3, 1.9)
y = c(-0.2, -1.5, -5.3, 0.3, -0.8, -2.2)
ybar = mean(y)
n = length(y)

## prior
prior = list()
prior$mu_0 = 0.0
prior$sig2_0 = 1.0
prior$n_0 = 2.0 # prior effective sample size for sig2
prior$s2_0 = 1.0 # prior point estimate for sig2
prior$nu_0 = prior$n_0 / 2.0 # prior parameter for inverse-gamma
prior$beta_0 = prior$n_0 * prior$s2_0 / 2.0 # prior parameter for inverse-gamma

hist(y, freq=FALSE, xlim=c(-1.0, 3.0)) # histogram of the data
curve(dnorm(x=x, mean=prior$mu_0, sd=sqrt(prior$sig2_0)), lty=2, add=TRUE) # prior for mu
points(y, rep(0,n), pch=1) # individual data points
points(ybar, 0, pch=19) # sample mean

set.seed(53)

init = list()
init$mu = 0.0

post = gibbs(y=y, n_iter=5e3, init=init, prior=prior)

head(post)
library("coda")
plot(as.mcmc(post))

summary(as.mcmc(post))


# ------------------------------------------------
# 2020.1.9 Thu
# Coursera Bayesian statistics
# W3
# ------------------------------------------------

library("car")  # load the 'car' package, "Companion to Applied Regression"
data("Anscombe")  # load the data set
?Anscombe  # read a description of the data
head(Anscombe)  # look at the first few lines of the data
education income young urban

ME       189   2824 350.7   508
NH       169   3259 345.9   564
VT       230   3072 348.5   322
MA       168   3835 335.3   846
RI       180   3549 327.1   871
CT       193   4256 341.0   774

pairs(Anscombe)  # scatter plots for each pair of variables
fit <- lm(education~income+young+urban, Anscombe)
summary(fit )
#--------------------------------------------
library("rjags")

mod_string = " model {
    for (i in 1:length(education)) {
        education[i] ~ dnorm(mu[i], prec)
        mu[i] = b0 + b[1]*income[i] + b[2]*young[i] + b[3]*urban[i]
    }
    
    b0 ~ dnorm(0.0, 1.0/1.0e6)
    for (i in 1:3) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(1.0/2.0, 1.0*1500.0/2.0)
    	## Initial guess of variance based on overall
    	## variance of education variable. Uses low prior
    	## effective sample size. Technically, this is not
    	## a true 'prior', but it is not very informative.
    sig2 = 1.0 / prec
    sig = sqrt(sig2)
} "

data_jags = as.list(Anscombe)

coda::traceplot(as.mcmc(Anscombe$education))
coda::autocorr.plot(as.mcmc(Anscombe$education))
coda::gelman.diag(as.mcmc(Anscombe$education), as.mcmc(Anscombe$income))
coda::gelman.plot(as.mcmc(Anscombe))

plot(fit)

# ------------------------------------------------
# 2020.1.9 Thu
# Coursera Bayesian statistics
# W3 jags model (linear regression)
# ------------------------------------------------
library("car")
data("Leinhardt")
pairs(Leinhardt)
Leinhardt$loginfant = log(Leinhardt$infant)
Leinhardt$logincome = log(Leinhardt$income)
plot(loginfant~logincome, Leinhardt)
dat=na.omit(Leinhardt)

library("rjags")

mod1_string = "model{  
  #1 This tells the likelihood of the data
  for(i in 1:n){  # n is the number of data
    y[i] ~ dnorm(mu[i], prec) # 1/prec is the variance, dnorm is a jags function, 
    mu[i] = b[1]+b[2]*log_income[i] # b[1], b[2] are coefficients of this linear model
  }
  
  #2.This gives us the priors for the coefficients
  for(j in 1:2){
    b[j] ~ dnorm(0.0, 1.0/1.0e6)  # 1.0e6 is the variance
  }
  
  prec ~ dgamma(5.0/2.0, 5.0*10/2.0)
  sig2 = 1/prec
  sig = sqrt(sig2)
}"

  # 5:prior sample size,
  # 5.0/2.0 turns 5.0 into the gamma parameter "shape"
  # 5.0*10 10 is the prior guess
  # 5.0*10/2.0 is the rate for the gamma
  # 5.0*10/2.0 is also the scale for the inverse gamma
  # shape and rate
  # You must use "~" instead of "="?
    # "~" assings a distribution
    # "=" is a deterministic 
  # Why use a gamma distribution for getting a variance?
  # What's the gamma distribution

# setting a model
set.seed(72)
data1_jags = list(y=dat$loginfant, n=nrow(dat), log_income=dat$logincome)

# parameters we want to monitor for the model1 are b[1] and b[2]
params1 = c("b", "sig")

# initial value for the model1, which are b[1], b[2] and prec
inits1 = function(){
  inits = list("b"=rnorm(2, 0.0, 100.0), "prec"=rgamma(1, 1.0, 1.0))
  # shape=1.0, rata=1.0 --> an exponential distribution
}

# Specifying the model itself
mod1 = jags.model(textConnection(mod1_string), data=data1_jags, inits=inits1, n.chains=3)
# running 3 different chains

update(mod1, 1000)  # Burn-in period
# This ran the model for 1000 iterations but didn't keep the samples

# Create coda.samples from the model
mod1_sim = coda.samples(model=mod1, variable.names=params1, n.iter=5e3)

mod1_csim = do.call(rbind, mod1_sim)

# Convergence
plot(mod1_sim) # no pattern observed on each trace, which is good.
gelman.diag(mod1_sim) # Gelman and Rubin diagnostic
  # the factors are very close to 1, indicatin g that we probably have converged

autocorr.diag(mod1_sim) # 
effectiveSize(mod1_sim) # Out of 5000*3 samples, only 300 or so samples are effective
summary(mod1_sim)

# ------------------------------------------------
# 2020.1.11 Sat
# Data analysis practice using data()
# ------------------------------------------------
data("AMSsurvey") # American Math Society Survey Data
?AMSsurvey
AMSsurvey %>% group_by(sex, type) %>% summarize(mean=mean(count), n=n())
?dplyr::summarize

data("PlantGrowth")
PlantGrowth %>% group_by(group) %>% summarize(mean(weight))

# ------------------------------------------------
# 2020.1.15 Wed
# Coursera Bayesian statistics
# W3 Lesson 7.2
# ------------------------------------------------

library("car")
data("Leinhardt")
?Leinhardt
head(Leinhardt)
str(Leinhardt)
pairs(Leinhardt)
plot(infant ~ income, data=Leinhardt)
hist(Leinhardt$infant)
hist(Leinhardt$income)
Leinhardt$loginfant = log(Leinhardt$infant)
Leinhardt$logincome = log(Leinhardt$income)
plot(loginfant ~ logincome, data=Leinhardt)
lmod = lm(loginfant ~ logincome, data=Leinhardt)
summary(lmod)

# W3 Lesson 7.3
dat = na.omit(Leinhardt)
library("rjags")
mod1_string = " model {
    for (i in 1:n) {
        y[i] ~ dnorm(mu[i], prec)
        mu[i] = b[1] + b[2]*log_income[i] 
    }
    
    for (i in 1:2) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(5/2.0, 5*10.0/2.0)
    sig2 = 1.0 / prec
    sig = sqrt(sig2)
} "

set.seed(72)
data1_jags = list(y=dat$loginfant, n=nrow(dat), 
                  log_income=dat$logincome)

params1 = c("b", "sig")

inits1 = function() {
  inits = list("b"=rnorm(2,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}

mod1 = jags.model(textConnection(mod1_string), data=data1_jags, inits=inits1, n.chains=3)
update(mod1, 1000) # burn-in

mod1_sim = coda.samples(model=mod1,
                        variable.names=params1,
                        n.iter=5000)

mod1_csim = do.call(rbind, mod1_sim) # combine multiple chains

# W3 Leson 7.4 MCMC convergence
plot(mod1_sim)
gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
autocorr.plot(mod1_sim)
effectiveSize(mod1_sim)
summary(mod1_sim)

lmod0 = lm(infant ~ income, data=Leinhardt)
plot(resid(lmod0)) # to check independence (looks okay)

plot(predict(lmod0), resid(lmod0)) # to check for linearity, constant variance (looks bad)
qqnorm(resid(lmod0)) # to check Normality assumption (we want this to be a straight line)

X = cbind(rep(1.0, data1_jags$n), data1_jags$log_income)
head(X)
(pm_params1 = colMeans(mod1_csim)) # posterior mean
yhat1 = drop(X %*% pm_params1[1:2])
resid1 = data1_jags$y - yhat1
plot(resid1) # against data index

plot(yhat1, resid1) # against predicted values
qqnorm(resid1) # checking normality of residuals
plot(predict(lmod), resid(lmod)) # to compare with reference linear model
rownames(dat)[order(resid1, decreasing=TRUE)[1:5]] # which countries have the largest positive residuals?

# W3 Lesson 7.5 Additional covariates

library("rjags")

mod2_string = " model {
    for (i in 1:length(y)) {
        y[i] ~ dnorm(mu[i], prec)
        mu[i] = b[1] + b[2]*log_income[i] + b[3]*is_oil[i]
    }
    
    for (i in 1:3) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(5/2.0, 5*10.0/2.0)
    sig = sqrt( 1.0 / prec )
} "


set.seed(73)
data2_jags = list(y=dat$loginfant, log_income=dat$logincome,
                  is_oil=as.numeric(dat$oil=="yes"))
data2_jags$is_oil

params2 = c("b", "sig")

inits2 = function() {
  inits = list("b"=rnorm(3,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}
mod2 = jags.model(textConnection(mod2_string), data=data2_jags, inits=inits2, n.chains=3)
update(mod2, 1e3) # burn-in

mod2_sim = coda.samples(model=mod2,
                        variable.names=params2,
                        n.iter=5e3)

mod2_csim = as.mcmc(do.call(rbind, mod2_sim)) # combine multiple chains

plot(mod2_sim)

gelman.diag(mod2_sim)
autocorr.diag(mod2_sim)

autocorr.plot(mod2_sim)
effectiveSize(mod2_sim)
summary(mod2_sim)

X2 = cbind(rep(1.0, data1_jags$n), data2_jags$log_income, data2_jags$is_oil)
head(X2)
(pm_params2 = colMeans(mod2_csim)) # posterior mean
yhat2 = drop(X2 %*% pm_params2[1:3])
resid2 = data2_jags$y - yhat2
plot(resid2) # against data index
plot(yhat2, resid2) # against predicted values
plot(yhat1, resid1) # residuals from the first model
sd(resid2) # standard deviation of residuals

mod3_string = " model {
    for (i in 1:length(y)) {
        y[i] ~ dt( mu[i], tau, df )
        mu[i] = b[1] + b[2]*log_income[i] + b[3]*is_oil[i]
    }
    
    for (i in 1:3) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    df = nu + 2.0 # we want degrees of freedom > 2 to guarantee existence of mean and variance
    nu ~ dexp(1.0)
    
    tau ~ dgamma(5/2.0, 5*10.0/2.0) # tau is close to, but not equal to the precision
    sig = sqrt( 1.0 / tau * df / (df - 2.0) ) # standard deviation of errors
} "

dic.samples(mod1, n.iter=1e3)
dic.samples(mod2, n.iter=1e3)

# ------------------------------------------------
# 2020.1.18 Sat
# Coursera Bayesian statistics
# W3 jags model Lesson 7 quiz
# ------------------------------------------------

library("car")  # load the 'car' package, "Companion to Applied Regression"
data("Anscombe")  # load the data set

library("rjags")

mod_string = " model {
    for (i in 1:n) {
        y[i] ~ dnorm(mu[i], prec)
        mu[i] = b0 + b[1]*income[i] + b[2]*young[i] + b[3]*urban[i]
    }
    
    b0 ~ dnorm(0.0, 1.0/1.0e6)
    for (i in 1:3) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(1.0/2.0, 1.0*1500.0/2.0)
    	## Initial guess of variance based on overall
    	## variance of education variable. Uses low prior
    	## effective sample size. Technically, this is not
    	## a true 'prior', but it is not very informative.
    sig2 = 1.0 / prec
    sig = sqrt(sig2)
} "

pairs(Anscombe)
mean(is.na(Anscombe))
dat = na.omit(Anscombe)

# setting a model
set.seed(0117)
data1_jags = list(y=dat$education, n=nrow(dat), income=dat$income, 
young=dat$young, urban=dat$urban)

# parameters we want to monitor for the model1 are b[1] and b[2]
params1 = c("b", "sig")

# initial value for the model1, which are b[1], b[2] andh prec
inits1 = function(){
	inits=list("b"=rnorm(3, 0.0, 200.0), "prec"=rgamma(1, 1.0, 1.0))
	# shape=1.0, rate=1.0 --> an e xponential distribution
}

# Specifying the model itself
mod1 = jags.model(textConnection(mod_string), data=data1_jags, inits=inits1, n.chains=3)
# running 3 different chains

update(mod1, 1000)	# Burn-in period
# This ran the model for 1000 iterations but didn't keep the samples

# Create coda.samples from the model
mod1_sim = coda.samples(model=mod1, variable.names=params1, n.iter=5e3)

mod1_csim = do.call(rbind, mod1_sim)

#Convergence
plot(mod1_sim) # no pattern observed on each trace, which is good
gelman.diag(mod1_sim) #Gelman and Rubin diagnostic	
	# the factors are very close to 1, indicating that we probably have converged

autocorr.diag(mod1_sim)
effectiveSize(mod1_sim) # Out of 5000*3 samples, only 15000 samples are effective
summary(mod1_sim)

fit <- lm(education~income+young+urban, Anscombe)

# Device information criterion
dic.samples(mod1, n.iter=1e3)

# ------------------------------------------------
# 2020.1.19 Sun
# Coursera Bayesian statistics
# W3 Lesson 8 ANOVA
# ------------------------------------------------

# Data
data("PlantGrowth")
?PlantGrowth
head(PlantGrowth)

boxplot(weight ~ group, data=PlantGrowth)

# Modeling
lmod = lm(weight ~ group, data=PlantGrowth)
summary(lmod)

anova(lmod)

library("rjags")

mod_string = " model {
    for (i in 1:length(y)) {
        y[i] ~ dnorm(mu[grp[i]], prec)
    }
    
    for (j in 1:3) {
        mu[j] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(5/2.0, 5*1.0/2.0)
    sig = sqrt( 1.0 / prec )
} "

set.seed(82)
str(PlantGrowth)
data_jags = list(y=PlantGrowth$weight, 
                 grp=as.numeric(PlantGrowth$group))

params = c("mu", "sig")

inits = function() {
  inits = list("mu"=rnorm(3,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}

mod = jags.model(textConnection(mod_string), data=data_jags, inits=inits, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim)) # combined chains

# Model cheking
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
effectiveSize(mod_sim)

(pm_params = colMeans(mod_csim))

yhat = pm_params[1:3][data_jags$grp]
resid = data_jags$y - yhat
plot(resid)

plot(yhat, resid)

# Results
summary(mod_sim)
HPDinterval(mod_csim)
mean(mod_csim[,3] > mod_csim[,1])
mean(mod_csim[,3] > 1.1*mod_csim[,1])

PlantGrowth %>% group_by(group) %>% summarize(mean(weight))
predict(lmod, newdata=data.frame(group="ctrl"))

dic1 <- dic.samples(mod, n.iter=1e3)
# ------------------------------------------------
# 2020.1.18 Sat
# How to get financial public data
# ------------------------------------------------

install.packages("pdfetch") 
  #https://rdrr.io/cran/pdfetch/
  #https://www.rdocumentation.org/packages/pdfetch/versions/0.2.4
library(pdfetch)
pdfetch_YAHOO("IBM")
pdfetch_BOE("XUDLJYD", "2019-11-20")
#pdfetch_BOE(identifiers, from, to = Sys.Date())
pdfetch_WB("NY.GDP.MKTP.KD.ZG")
pdfetch_ECB("EXR.M.USD.EUR.SP00.A") # USD.EUR
  #http://sdw.ecb.europa.eu/browse.do?node=bbn69
pdfetch_ECB("MNA.Q.N.I8.W2.S1.S1.B.B1GQ._Z._Z._Z.EUR.V.N") # Quarterly GDP of Euro19
  # http://sdw.ecb.europa.eu/browse.do?node=9691182 
  # by million local currency
  # 
pdfetch_ECB("IDCM.Q.N.JP.W2.S1.S1.B.B1GQ._Z._Z._Z.XDC.L.N") # Quarterly GDP of Japan
  x <- pdfetch_ECB("IDCM.Q.N.JP.W2.S1.S1.B.B1GQ._Z._Z._Z.XDC.L.N")
  xdf <- data.frame(x)
  n <- xdf[2:dim(xdf)[1],]
  n[length(n)+1] <- 1
  xdf$n <- n
  time <- rownames(xdf)
  rownames(xdf) <- 1:dim(xdf)[1]
  xdf$time <- time
  names(xdf) <- c("qgdp", "next_qgdp", "time")
  #mutate(xdf, growth=next_qgdp/qgdp)
  xdf$growth <- (xdf$next_qgdp/xdf$qgdp -1)*100
  xdf$time2 <- as.Date(xdf$time)
  with(xdf[1:dim(xdf)[1]-1,], plot(time2, growth, type='l'))
pdfetch_ECB("STS.M.I8.W.PROD.NS0020.4.000") 
  # Inductrial production in Eruo 19
  # Unit	2015=100
pdfetch_ECB("GFS.A.N.JP.W0.S13.S1.C.L.LE.GD.T._Z.XDC_R_B1GQ._T.F.V.N._T")
  # Government debt, Japan, as % of GDP
  # http://sdw.ecb.europa.eu/browse.do?node=9693772

# 2020.11.21 Sat

ibm <- pdfetch_YAHOO("IBM")
ibmdf <- data.frame(ibm)
ibmdf$dates <- as.Date(row.names(ibmdf))
plot(IBM.close~dates, ibmdf)

JPY <- data.frame(pdfetch_YAHOO("JPY=X"))
JPY$dates <- as.Date(row.names(JPY))
plot(JPY.X.close~dates, JPY)


GDP.JP <-pdfetch_WB("NY.GDP.MKTP.CD")

# ------------------------------------------------
# 2020.2.1 Sat
# Japanese book: Bayes statistics
# P.127
# ------------------------------------------------

x <- c(3060, 2840, 1780, 3280, 3550, 2450, 2200, 3070, 2100, 4100, 
       3630, 3060, 3280, 1870, 2980, 3120, 2150, 3830, 4300, 1880)

hist(x)
abline(v=2500)

mu <- mean(x)
t.test(x-2500)
t.test(x-3000)

# effect size of introducing Catalogue B
# Refer to Cohen's d
mu1 <- mean(x)
sd1 <- sd(x)
mu0 <- 2500
sd0 <- 0
es <- (mu1-mu0) / sqrt((sd1^2+sd0^2)/2)
  
y <- rep(2500, 20)
y2 <- rep(3000, 20)
effsize::cohen.d(y,x)
effsize::cohen.d(y2,x)

# ------------------------------------------------
# 2020.2.1 Sat
# Japanese book: Bayes statistics
# P.127
# This time, getting the same result using MCMC
# ------------------------------------------------

# Catalogue B's purchases price data  
# Refered to the code of 2020.1.9 Thu, which is on line 5407

library("rjags")

mod1_string = "model{
	for(i in 1:n) {
		y[i] ~ dnorm(mu[i], prec)	
		mu[i] = b
	}
	b ~ dnorm(0.0, 1.0/1.0e6)	# 1.0e6 is the variance
	prec ~ dgamma(n/2.0, n*2500/2.0)
	sig2 = 1/prec
	sig = sqrt(sig2)
}"

set.seed(201)

y = c(3060, 2840, 1780, 3280, 3550, 2450, 2200, 3070, 2100, 4100, 
      3630, 3060, 3280, 1870, 2980, 3120, 2150, 3830, 4300, 1880)
n = length(y)
data1_jags = list(y=y, n=n)
params1 = c("b", "sig")

inits1 = function() {
  inits = list("b"=rnorm(1, 0.0, 100.0), "prec"=rgamma(1, 1.0, 1.0))
}

mod1 = jags.model(textConnection(mod1_string), data=data1_jags, inits=inits1, n.chains=3)

update(mod1, 1000)
mod1_sim = coda.samples(model=mod1, variable.names=params1, n.iter=5e3)
mod1_csim = do.call(rbind, mod1_sim)
summary(mod1_sim)

library(coda)
plot(mod1_sim)  # no pattern observed on each trace, which is good.
gelman.diag(mod1_sim)  # Gelman and Rubin diagnostic
# the factors are very close to 1, indicatin g that we probably have converged

autocorr.diag(mod1_sim)
effectiveSize(mod1_sim)  # Out of 5000*3 samples, 12000 to 14000 samples are effective for analysis  
summary(mod1_sim)

# 1st result 
#       Mean    SD Naive SE Time-series SE
# b   2854.8 158.4   1.2936         1.3164
# sig  696.8 107.9   0.8812         0.9769

# 2nd result with using n instead of 5.0 on mod1_string
#       Mean     SD Naive SE Time-series SE
# b   2885.0 121.63   0.9931         0.9931
# sig  539.9  63.85   0.5214         0.5332

# 3rd result with using 2500 instead of 10 on mod1_string
#       Mean     SD Naive SE Time-series SE
# b   2885.1 121.79   0.9944         1.0051
# sig  540.9  63.13   0.5155         0.5348

# 4th result with using 2500 for prior mean and 10 for the prior guess on prec
#       Mean     SD Naive SE Time-series SE
# b   2918.0 120.79   0.9863         0.9766
# sig  539.4  62.87   0.5134         0.5086

hist(mod1_csim[,1])
hist(mod1_csim[,2])
lines(density(mod1_csim[,1]))
plot(density(mod1_csim[,1]))
x <- mod1_csim[,1]
quantile(x, c(0.025, 0.975))

# ------------------------------------------------
# 2020.2.1 Sat
# Coursera Bayesian statistics
# W4 Poisson regression
# ------------------------------------------------
install.packages("COUNT")
library("COUNT")
data("badhealth")
?badhealth
head(badhealth)
any(is.na(badhealth))

hist(badhealth$numvisit, breaks=20)
plot(jitter(log(numvisit))~ jitter(age), data=badhealth,
     subset=badh==0&numvisit>0, xlab="age", ylab="log(visits")
points(jitter(log(numvisit))~ jitter(age), data=badhealth,
     subset=badh==1&numvisit>0, xlab="age", ylab="log(visits", pch=19, col="red")
plot(lam_hat[which(badhealth$badh==0)], resid[which(badhealth$badh==0)], xlim=c(0, 8), ylim=range(resid))

mod_string = " model {
    for (i in 1:length(numvisit)) {
        numvisit[i] ~ dpois(lam[i])
        log(lam[i]) = int + b_badh*badh[i] + b_age*age[i] + b_intx*age[i]*badh[i]
    }
    
    int ~ dnorm(0.0, 1.0/1e6)
    b_badh ~ dnorm(0.0, 1.0/1e4)
    b_age ~ dnorm(0.0, 1.0/1e4)
    b_intx ~ dnorm(0.0, 1.0/1e4)
} "

set.seed(102)

data_jags = as.list(badhealth)

params = c("int", "b_badh", "b_age", "b_intx")

mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic1 = dic.samples(mod, n.iter=1e3)


## model without the interactive term
mod_string = " model {
    for (i in 1:length(numvisit)) {
        numvisit[i] ~ dpois(lam[i])
        log(lam[i]) = int + b_badh*badh[i] + b_age*age[i]
    }
    
    int ~ dnorm(0.0, 1.0/1e6)
    b_badh ~ dnorm(0.0, 1.0/1e4)
    b_age ~ dnorm(0.0, 1.0/1e4)
} "

set.seed(102)

data_jags = as.list(badhealth)

params = c("int", "b_badh", "b_age")

mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic2 = dic.samples(mod, n.iter=1e3)

dat = read.csv("callers.csv")

# ------------------------------------------------
# 2020.2.9 Sun
# Coursera Bayesian statistics
# Lesson 11 quiz
# ------------------------------------------------

x = 0:20;  pdf = dnorm(x)
plot(x, pdf, type="h", lwd=3, col="blue", 
     main="PDF of POIS(6) with Approximating Normal Density")
abline(h=0, col="green2")
curve(dnorm(x, 6, sqrt(6)), lwd=2, col="red", add=T) # 'x' mandatory arg

# ------------------------------------------------
library("MASS")
data("OME")

dat = subset(OME, OME != "N/A")
dat$OME = factor(dat$OME) # relabel OME
dat$ID = as.numeric(factor(dat$ID)) # relabel ID so there are no gaps in numbers (they now go from 1 to 63)

## Original reference model and covariate matrix
mod_glm = glm(Correct/Trials ~ Age + OME + Loud + Noise, data=dat, weights=Trials, family="binomial")
X = model.matrix(mod_glm)[,-1]

## Original model (that needs to be extended)
mod_string = " model {
	for (i in 1:length(y)) {
		y[i] ~ dbin(phi[i], n[i])
		logit(phi[i]) = b0 + b[1]*Age[i] + b[2]*OMElow[i] + b[3]*Loud[i] + b[4]*Noiseincoherent[i]
	}
	
	b0 ~ dnorm(0.0, 1.0/5.0^2)
	for (j in 1:4) {
		b[j] ~ dnorm(0.0, 1.0/4.0^2)
	}
	
} "

data_jags = as.list(as.data.frame(X))
data_jags$y = dat$Correct
data_jags$n = dat$Trials
data_jags$ID = dat$ID

params = c("b0", "b")

library("rjags")
mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=3e4)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim, ask=FALSE)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic1 = dic.samples(mod, n.iter=1e3)



# ------------------------------------------------
# 2020.2.11 Tue
# Coursera Bayesian statistics
# Lesson 11 Honor Quiz
# ------------------------------------------------
library("MASS")
data("OME")

dat = read.csv("callers.csv")

mod_string = "model{
	for (i in 1:length(calls)){
		calls[i]~dpois( days_active[i] * lam[i])
		log(lam[i]) = b0 + b[2]*age[i] + b[1]*isgroup2[i]
	}	
	b0 ~ dnorm(0.0, 1.0/10.0^2)
	for (j in 1:2){
		b[j] ~ dnorm(0.0, 1.0/10.0^2)
	}
}"

data_jags = as.list(dat)

params = c("b0", "b")

library("rjags")
mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod, variable.names=params, n.iter=1e4)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostic
plot(mod_sim, ask=TRUE)
gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

dic1 = dic.samples(mod, n.iter=1e3)

## Model checking
X = as.matrix(dat[,-c(1,2)])

pmed_coef = apply(mod_csim, 2, median)
llam_hat = pmed_coef["b0"] + X %*% pmed_coef[c("b[1]", "b[2]")]
lam_hat = exp(llam_hat)
hist(lam_hat)

resid = dat$calls/dat$days_active  - lam_hat
plot(resid)
plot(lam_hat, dat$calls/dat$days_active)

resid = dat$calls  - lam_hat*dat$days_active
plot(resid)
plot(lam_hat*dat$days_active, dat$calls)

## Prediction
## 30 days active, Group 2, 29 years old, 
dat1 = c(30, 1, 29)
head(mod_csim)
loglam1 = mod_csim[,"b0"] + mod_csim[,c(1,2)] %*% dat1[2:3]
lam1 = exp(loglam1)
(n_sim = length(lam1))
y1 = rpois(n=n_sim, lambda=lam1*30)
plot(table(factor(y1, levels=0:20))/n_sim, pch=2, ylab="posterior prob", xlab="calls")

x = table(factor(y1, levels=0:20))/n_sim
round(sum(x[4:20]), 2)

# ------------------------------------------------
# 2020.2.13 Thu
# Coursera Bayesian statistics
# Report: Covit19
# ------------------------------------------------

library(dplyr)
setwd("/Users/keijiharada/Downloads")
d <- read.csv("20200213-Covid19.csv")
d1 <- d[,c(1:2)]
d2 <- mutate(d1, Date = as.Date(d1$date, "%m/%d"))
d3 <- na.omit(d2)
plot(cases~Date, data=d3, type='l', main="Daily changes")
plot(cases~Date, data=d3[c(4:22),], type='l', main="Daily changes before the spike")
plot(deaths~Date, data=d3, type='l', col="red")
hist(d3$cases, breaks=10); mean(d3$cases)
hist(d3$deaths); mean(d3$deaths)
# histograms of cases and deaths are distributed like the one of Poisson.
# cases: lambda = 3028 per day
# deaths: lambda = 65 per day 
# if so, I think Gamma could be used for predicting the wait time as follows
# cases: alpha(shape) = 1million, for example, beta(rate) = 3028

d3$Date[dim(d3)[1]] - d3$Date[1]
hist(rgamma(1000, shape=100000, rate=3028))
d3$days <- as.numeric((d3$Date - d3$Date[dim(d3)[1]]) + 1) 

# remove the latest two data because the data are taken based on totally different method from other data.
d3 <- d3[4:dim(d3)[1],]
install.packages("DT")
DT::datatable(d3)


library("rjags")

mod_string = "model {
  for (i in 1:length(cases)) {
    cases[i] ~ dpois(lam[days[i]])
  }
  
  for (j in 1:max(days)) {
    lam[j] ~ dgamma(alpha, beta)
  }
  
  alpha = mu^2 / sig^2
  beta = mu / sig^2
  
  mu ~ dgamma(2.0, 1.0/5.0)
  sig ~ dexp(1.0)
}"

set.seed(113)
data_jags = as.list(d3)
params = c("lam", "mu", "sig")
mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

# convergence diagnostics
plot(mod_sim)
 
gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

dic = dic.samples(mod, n.iter=1e3)

# observation level residuals
(pm_params = colMeans(mod_csim))

yhat = rep(pm_params[1:5], each=30)
resid = d3$cases - yhat
plot(resid)
plot(jitter(yhat), resid)

var(resid[yhat<600])

# days level residuals
lam_resid = pm_params[1:5] - pm_params["mu"]
plot(lam_resid)
abline(h=0, lty=2)

summary(mod_sim)

(n_sim = nrow(mod_csim))
lam_pred = rgamma(n=n_sim, shape=mod_csim[,"mu"]^2/mod_csim[,"sig"]^2,
                  rate=mod_csim[,"mu"]/mod_csim[,"sig"]^2)
hist(lam_pred)

mean(lam_pred > 20)

y_pred = rpois(n=n_sim, lambda=lam_pred)
hist(y_pred)
mean(y_pred > 4)

hist(d3$cases)
y_pred1 = rpois(n=n_sim, lambda=mod_csim[,"lam[1]"])
hist(y_pred1)

### Using simple Poisson model
library("rjags")
mod_string = "model {
  for (i in 1:length(cases)) {
    cases[i] ~ dpois(lam[i])
    log(lam[i]) = int + b[1]*days[i] + b[2]*days[i]^2
  }

  int ~ dnorm(0.0, 1.0/1e6)  
  for (i in 1:2) {
    b[i] ~ dnorm(0.0, 1.0/1.0e6)
  }
}"

set.seed(102)

data_jags = as.list(d3)
params = c("int", "b")
mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=1e4)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

# convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_csim)
effectiveSize(mod_sim)

dic = dic.samples(mod, n.iter=1e4)

X = as.matrix(d3[-c(1:3)])
X = cbind(X, with(d3, days^2))
head(X)
(pmed_coef = apply(mod_csim, 2, median))
llam_hat = pmed_coef["int"] + X %*% pmed_coef[c("b[1]", "b[2]")]
lam_hat = exp(llam_hat)
hist(lam_hat)

resid = d3$cases - lam_hat
plot(resid)
plot(lam_hat, d3$cases)
abline(0.0, 1.0)

# Predictive distributions

x1 = c(23, 529)
x2 = c(24, 576)
x3 = c(50, 2500)
x4 = c(65, 4225)
x5 = c(75, 5625)
x6 = c(27, 729)
x7 = c(30, 900)
x8 = c(38, 1444)

loglam1 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x1
loglam2 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x2
loglam3 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x3
loglam4 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x4
loglam5 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x5
loglam6 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x6
loglam7 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x7
loglam8 = mod_csim[,"int"] + mod_csim[,c(1,2)] %*% x8

lam1 = exp(loglam1)
lam2 = exp(loglam2)
lam3 = exp(loglam3)
lam4 = exp(loglam4)
lam5 = exp(loglam5)
lam6 = exp(loglam6)
lam7 = exp(loglam7)
lam8 = exp(loglam8)

(n_sim = length(lam1))

y1 = rpois(n=n_sim, lambda=lam1)
y2 = rpois(n=n_sim, lambda=lam2)
y3 = rpois(n=n_sim, lambda=lam3)
y4 = rpois(n=n_sim, lambda=lam4)
y5 = rpois(n=n_sim, lambda=lam5)
y6 = rpois(n=n_sim, lambda=lam6)
y7 = rpois(n=n_sim, lambda=lam7)
y8 = rpois(n=n_sim, lambda=lam8)


plot(table(factor(y8, levels=0:200))/n_sim, pch=2, ylab="posterior prob.", xlab="Cases",
     ylim=c(0, 0.1))
points(table(factor(y5+0.1))/n_sim, col="red")
plot(table(factor(y5, levels=0:100))/n_sim, ylab="posterior prob", xlab="Cases", 
     main="Posteriro prob of cases on the 75th day")

mean(lam1)  # prediction for cases of the 23rd day is 5414
mean(lam2)  # prediction for cases of the 24th day is 5488
mean(lam3)  # prediction for cases of the 50rd day
mean(lam4)  # prediction for cases of the 65th day
mean(lam5)  # prediction for cases of the 75th day
mean(lam6)  # prediction for cases of the 27th day is 2279, which is Feb 19.
mean(lam7)  # prediction for cases of the 30th day is 1375, which is Feb 22.
mean(lam8)  # prediction for cases of the 38th day is 178, which is Feb 22.


d3$Date[22] + 50

age <- c(20, 30, 40, 50, 60, 70, 80, 90)
num <- c(14, 13, 16, 25, 52, 113, 50, 2)
plot(age, num, type='b')
barplot(num, age)

par(mfrow=c(2, 1))
plot(cases~Date, data=d3, type='l')
plot(deaths~Date, data=d3, type='l', col="red")

# ------------------------------------------------
# 2020.2.17 Thu
# ESD application, how to adjust cell height on datatable
# ------------------------------------------------

# https://stackoverflow.com/questions/42099418/how-can-i-reduce-row-height-in-dt-datatables
https://stackoverflow.com/questions/42418067/how-to-render-a-datatable-with-definite-row-height?rq=1
options(digits.secs=6)
library(data.table)
d = data.table(x = 1:10,time = as.POSIXct('2015-03-23 12:00:00.123'))
library(DT)
datatable(d)

library(DT)
datatable(d, options=list(
  pageLength = 3,
  #engthMenu = c(2, 12, 18),
  searching= FALSE))%>%
  formatStyle( 0, target= 'row', lineHeight='70%')  
#ormatStyle( 0, target= 'row',color = 'black', backgroundColor = 'yellow', fontWeight ='bold', lineHeight='70%')


# ------------------------------------------------
# 2020.2.27 Thu
# Viterbi and Baum-Welth HMM
# https://www.youtube.com/watch?v=j3r9a75zOvM
# ------------------------------------------------

# This source is shown at around 59:00
install.packages("quantmod")
library(quantmod)
getSymbols("^TWII", src="yahoo", from="1900-01-01", to="2012-12-31")

chartSeries(TWII, theme="black")

TWII_Subset <- window(TWII, start=as.Date("2013-01-01"), end=as.Date("2015-12-31"))
TWII_Train <- cbind(TWII_Subset$TWII.Close - TWII_Subset$TWII.Open)                       

# TWII is TSEC, Taiwan stock exchange, weighted index

#################################################
# Baum-Welth Algorithm --- coudn't install RHmm
#################################################

install.packages("RHmm")
install.packages("RHmm", repos="http://R-Forge.R-project.org")
install.packages("RHmm", repos=" https://CRAN.R-project.org/package=RHmm ")
#hm_model <- HMMFit(obs=TWII_Train, nStates=5)
library(RHmm)
#install.packages("/private/var/folders/z1/7c7h3z0d4lv3p94zdh6r0chh0000gn/T/RtmpLVKsQD/downloaded_packages", repos = NULL, type = "source")
install.packages("/Users/keijiharada/AI/Coursera/Data_Science/work/R-cran-RHmm-2.0.3_9/usr/local/lib/R/library/RHmm", repos = NULL, type = "source")
>* installing *binary* package ‘RHmm’ ...
>* DONE (RHmm)

install.packages("RHmm", repos="/Users/keijiharada/AI/Coursera/Data_Science/work/R-cran-RHmm-2.0.3_9")

hidden_markov_model <- depmix(TWII$TWII.Open ~ 1, 
                              family = gaussian(), 
                              nstates = 3, 
                              data = data.frame(TWII$TWII.Open))
model_fit <- fit(hidden_markov_model)


# ------------------------------------------------
# 2020.2.29 Sat
# Viterbi and Baum-Welth HMM
# https://blog.darwinex.com/hidden-markov-models-darwins-sp500/
# ------------------------------------------------
install.packages("quantmod")
install.packages("plotly")
install.packages("depmixS4")
library(quantmod)
library(plotly)
library(depmixS4)

getSymbols("^GSPC", from="2014-06-01", to="2017-03-31")
# GSPC is S&P500 index
sp500_temp = diff(log(Cl(GSPC)))
sp500_returns = as.numeric(sp500_temp)

plot_ly(x = index(GSPC), y = sp500_returns, type="scatter", mode="lines") %>%
  layout(xaxis = list(title="Date/Time (June 2014 to March 2017)"), yaxis = list(title="S&P500 Differenced Logarithmic Returns"))

hidden_markov_model <- depmix(sp500_returns ~ 1, family = gaussian(), nstates = 3, data = data.frame(sp500_returns=sp500_returns))
model_fit <- fit(hidden_markov_model)

posterior_probabilities <- posterior(model_fit)

sp500_gret = 1 + sp500_returns
sp500_gret <- sp500_gret[-1]
sp500_cret = cumprod(sp500_gret)
plot_ly(name="Unknown", x = index(TWII), y = posterior_probabilities$S1, type="scatter", mode="lines", line=list(color="grey")) %>%
  add_trace(name="Bullish", y = posterior_probabilities$S2, line=list(color="blue")) %>%
  add_trace(name="Bearish", y = posterior_probabilities$S3, line=list(color="red")) %>%
  add_trace(name="S&P500", y = c(rep(NA,1), sp500_cret-1), line=list(color="black"))


# ------------------------------------------------
# 2020.3.1 Sun
# HMM example in R
# https://www.datatechnotes.com/2017/12/hidden-markov-model-example-in-r.html
# ------------------------------------------------

install.packages("HMM")
library(HMM)

states <- c("Target", "Outlier")
targetProb <- c(0.4, 0.6)
outlierProb <- c(0.6, 0.4)

transProb <- matrix(c(targetProb, outlierProb), 2)
transProb

elements <- c("short", "normal", "long")
targetStateProb <- c(0.1, 0.3, 0.6)
outlierStateProb <- c(0.6, 0.3, 0.1)

emissProb <- matrix(c(targetStateProb, outlierStateProb), 2, byrow=T)
emissProb

hmm <- initHMM(States=states, 
               Symbols=elements,
               transProbs=transProb,
               emissionProbs=emissProb)

print(hmm)      

simhmm <- simHMM(hmm, 10)
simulated <- data.frame(state=simhmm$states, element=simhmm$observation)

print(simulated)

testElements <- c("long", "normal", "normal", "short", 
                  "normal", "normal", "short", "long")
stateViterbi <- viterbi(hmm, testElements)

predState <- data.frame(Element=testElements, State=stateViterbi)
print(predState)

# ------------------------------------------------
# 2020.3.1 Sun
# HMM example in R
# https://www.rdocumentation.org/packages/HMM/versions/1.0/topics/baumWelc
# ------------------------------------------------

hmm = initHMM(c("A","B"),c("L","R"),
              transProbs=matrix(c(.9,.1,.1,.9),2),
              emissionProbs=matrix(c(.5,.51,.5,.49),2))
print(hmm)
# Sequence of observation
a = sample(c(rep("L",100),rep("R",300)))
b = sample(c(rep("L",300),rep("R",100)))
observation = c(a,b)
# Baum-Welch
bw = baumWelch(hmm,observation,10)
print(bw$hmm)

# ------------------------------------------------
# 2020.3.1 Sun
# HMM example in R
# https://www.r-bloggers.com/hidden-markov-model-example-in-r-with-the-depmixs4-package/
# ------------------------------------------------


# ------------------------------------------------
# 2020.3.14 Sat
# analyse COVID19 latest data
# https://support.google.com/docs/thread/33032242?hl=en
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
library(data.table)
library(dplyr)
x <- read.csv("covid19-8.csv")
#x <- x[,c(1:dim(x)[2]-1)]  # remove NA data of 3/12
y <- transpose(x)

cnames <- names(x)
cnames1 <- gsub("X2020.0", "2020-0", cnames)
cnames2 <- gsub("-01.", "-01-", cnames1)
cnames3 <- gsub("-02.", "-02-", cnames2)
cnames4 <- gsub("-03.", "-03-", cnames3)  # length is 52
cnames5 <- cnames4[c(2:length(cnames4))]  # remove "Date", length is 51
cnames6 <- as.Date(cnames5, "%Y-%m-%d")

rnames <- as.character(y[1,]) # length is 406
rnames1 <- c("Date", rnames) # length is 407

y1 <- y[c(2:dim(y)[1]), ] # row is 51, col is 406
y2 <- data.frame(sapply(y1, as.numeric)) # row is 51, col is 406

#names(y2) <- rnames
#row.names(y2) <- cnames5

y3 <- cbind(cnames6, y2)  # 51 x 407
names(y3) <- rnames1
y3 <- na.omit(y3)  # Added this on March 18
flag <- apply(y3[,2:dim(y3)[2]], 2, sum) > 700  # states of more than 500 total cases
#y3[,2:dim(y3)[2]][,frag]
y4 <- cbind(y3$Date,y3[,2:dim(y3)[2]][,flag])
cnames <- names(y4)
cnames[1] <- "Date"
names(y4) <- cnames

library(tidyr)
y5 <- y4 %>% gather(states, cases, -Date)
plot(y5$Date, y5$cases, col=as.factor(y5$states))

library(plotly)
library(ggplot2)
g <- ggplot(y5, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
ggplotly(p)



#library(tidyverse)
# https://stackoverflow.com/questions/52436487/show-multiple-plots-from-ggplot-on-one-page-in-r
# create a list with a specific length 
#plot_lst <- vector("list", length = 4)

library(tidyr)
library(dplyr)
library(plotly)
library(ggplot2)
library(DT)
library(rvest) # You need this to use read_html
#x <- read_html("https://covid.ourworldindata.org/data/ecdc/new_deaths.csv")

#setwd("/Users/keijiharada/Downloads")

# News Cases
# https://ourworldindata.org/coronavirus-source-data
# https://covid.ourworldindata.org/data/ecdc/total_deaths.csv
x <- read.csv("https://covid.ourworldindata.org/data/ecdc/new_cases.csv")
flag <- apply(x[, 2:dim(x)[2]], 2, sum) > 100
flag[is.na(flag)] <- FALSE
x1 <- cbind(x$date, x[,2:dim(x)[2]][,flag])
names(x1)[1] <- "date"

x2 <- x1 %>% gather(states, cases, -date)
Date <- as.Date(x2$date, "%Y-%m-%d")
x3 <- cbind(x2, Date)
x4 <- subset(x3, states!="World"); nc <- x4
#names(x1) <- c("Date", "states", "cases")
g <- ggplot(x4, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + labs(title="COVID19 New cases up to April 16", y="Cases")
# p <- p + annotate("text", 
#                   x=as.Date("2020-02-01"), 
#                   y=max(x4$cases), 
#                   label="Source:April 8 from ourworldindata.org",
#                   size=3, color="grey")
# p <- p + labs(caption="Source: ourworldindata.org, April 8, 2020 (11:30, London time)")
# p <- p + labs(title="COVID19 New cases of April 8", y="Cases", tag="April 8")
ggplotly(p)


# Total Cases
# https://ourworldindata.org/coronavirus-source-data
# https://covid.ourworldindata.org/data/ecdc/total_deaths.csv
x <- read.csv("https://covid.ourworldindata.org/data/ecdc/total_cases.csv")
flag <- apply(x[, 2:dim(x)[2]], 2, sum) > 1000
flag[is.na(flag)] <- FALSE
x1 <- cbind(x$date, x[,2:dim(x)[2]][,flag])
names(x1)[1] <- "date"

x2 <- x1 %>% gather(states, cases, -date)
Date <- as.Date(x2$date, "%Y-%m-%d")
x3 <- cbind(x2, Date)
x4 <- subset(x3, states!="World"); tc <- x4
#names(x1) <- c("Date", "states", "cases")
g <- ggplot(x4, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + labs(title="COVID19 Total cases up to April 16", y="Cases") 
ggplotly(p)

# New Death
# https://ourworldindata.org/coronavirus-source-data
# https://covid.ourworldindata.org/data/ecdc/total_deaths.csv
x <- read.csv("https://covid.ourworldindata.org/data/ecdc/new_deaths.csv")
flag <- apply(x[, 2:dim(x)[2]], 2, sum) > 50
flag[is.na(flag)] <- FALSE
x1 <- cbind(x$date, x[,2:dim(x)[2]][,flag])
names(x1)[1] <- "date"

x2 <- x1 %>% gather(states, cases, -date)
Date <- as.Date(x2$date, "%Y-%m-%d")
x3 <- cbind(x2, Date)
x4 <- subset(x3, states!="World"); nd <- x4
#names(x1) <- c("Date", "states", "cases")
g <- ggplot(x4, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + labs(title="COVID19 New deaths up to April 16", y="Deaths") 
# p <- p + annotate("text", 
#                   x=as.Date("2020-02-01"), 
#                   y=max(x4$cases), 
#                   label="Source:April 8 from ourworldindata.org",
#                   size=3, color="grey")
#p <- p + labs(caption="Source: ourworldindata.org, April 8, 2020 (11:30, London time)")
ggplotly(p)


# Total Death
# https://ourworldindata.org/coronavirus-source-data
# https://covid.ourworldindata.org/data/ecdc/total_deaths.csv
x <- read.csv("https://covid.ourworldindata.org/data/ecdc/total_deaths.csv")
flag <- apply(x[, 2:dim(x)[2]], 2, sum) > 100
flag[is.na(flag)] <- FALSE
x1 <- cbind(x$date, x[,2:dim(x)[2]][,flag])
names(x1)[1] <- "date"

x2 <- x1 %>% gather(states, cases, -date)
Date <- as.Date(x2$date, "%Y-%m-%d")
x3 <- cbind(x2, Date)
x4 <- subset(x3, states!="World"); td <- x4
#names(x1) <- c("Date", "states", "cases")
g <- ggplot(x4, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + labs(title="COVID19 Total deaths up to April 16", y="Deaths") 
ggplotly(p)

## Gave up 'cause somehow data of some days on nc2 or tc2 were gone on the plot
# nc2 <- subset(nc, states==c("Japan", "Italy", "Spain", "United.Kindgom", "Germany", "United.States", "Southnc.Korea", "China"))
# tc2 <- subset(tc, states==c("Japan", "Italy", "Spain", "United.Kindgom", "Germany", "United.States", "Southnc.Korea", "China"))
# nc2$type <- "new" 
# tc2$type <- "total" 
# cases <- rbind(nc2, tc2)
# g <- ggplot(cases, aes(Date, cases))
# p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
# p <- p + facet_grid(type~.)
# p <- p + labs(title="COVID19 New and Total cases up to April 16", y="Cases") 
# ggplotly(p)
# 

nc$type <- "new" 
tc$type <- "total" 
cases <- rbind(nc, tc)
g <- ggplot(cases, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + facet_grid(type~.)
p <- p + labs(title="COVID19 New and Total cases up to April 16", y="Cases") 
ggplotly(p)

temp_nc <- nc
names(temp_nc) <- c("date", "states", "new", "Date")
temp_nc$total <- tc$cases
cases <- temp_nc  
cases$rate <- cases$new/cases$total
g <- ggplot(cases, aes(Date, rate))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + labs(title="COVID19 New case rate up to April 16", y="New case rate") 
ggplotly(p)

nc$type <- "cases" 
nd$type <- "deaths" 
cases <- rbind(nc, nd)
g <- ggplot(cases, aes(Date, cases))
p <- g + geom_line(size=2, alpha=1/2, aes(color=states))
p <- p + facet_grid(type~.)
p <- p + labs(title="COVID19 New cases and deaths up to April 16", y="Cases") 
ggplotly(p)


x <- read.csv("https://raw.githubusercontent.com/kaz-ogiwara/covid19/master/data/summary.csv")
x1 <- x[, c(1:5)]
names(x1) <- c("year", "month", "day", "cases", "pcr_total")
x1$Date <- as.POSIXct(paste(x1[,1], x1[,2], x1[,3], sep='-'))
x1$pcr_new <- c(x1$pcr_total[1], (tail(x1$pcr_total, -1) - head(x1$pcr_total, -1)) )
x1$cases_new <- c(x1$cases[1], (tail(x1$cases, -1) - head(x1$cases, -1)) )
g <- ggplot(x1)
#p <-g + geom_line(size=2, alpha=1/2, aes(Date, pcr_new, color="lightblue"))
#p <- p + geom_line(size=2, alpha=1/2, aes(Date, cases_new, color="red"))
p <-g + geom_line(size=1, alpha=1/2, aes(Date, pcr_new, color="PCR new"))
p <- p + geom_line(size=1, alpha=1/2, aes(Date, cases_new*10, color="cases*10"))
# <- p + geom_line(size=2, alpha=1/2, aes(Date, pcr_total, color="PCR total"))
#p <- p + facet_grid(type~.)
p <- p + labs(title="COVID19 PCR Test in Japan", y="PCR") 
ggplotly(p)




# ------------------------------------------------
# 2020.4.16 Thu
# Save code in a pdf file
# https://stackoverflow.com/questions/32789355/print-with-syntax-color-in-r-studio
# ------------------------------------------------

library(knitr) 
setwd("/Users/keijiharada/Downloads/useR2017-master-2")
stitch("presentation.Rmd")


# ------------------------------------------------
# 2020.4.16 Thu
# Ellipses
# https://rstudio.github.io/DT/options.html
# ------------------------------------------------


datatable(iris[c(1:20, 51:60, 101:120), ], options = list(columnDefs = list(list(
  targets = 5,
  render = JS(
    "function(data, type, row, meta) {",
    "return type === 'display' && data.length > 6 ?",
    "'<span title=\"' + data + '\">' + data.substr(0, 10) + '...</span>' : data;",
    "}")
))), callback = JS('table.page(3).draw(false);'))


# c.f. https://github.com/rstudio/DT/pull/606
data <- tibble::rownames_to_column(tibble::as_tibble(mtcars))
DT::datatable(
  data,
  options = list(
    columnDefs = list(list(
      targets = 2,   # Target column of the table
      render = DT::JS("$.fn.dataTable.render.ellipsis( 3)")))   # Number of characters to show
  ),
  plugins = "ellipsis")


DT::datatable(
  data,
  plugins = "ellipso")


))), callback = JS('table.page(3).draw(false);'))

# ------------------------------------------------
# 2020.4.18 Sat
# Confidence interval of population standard deviation
# https://rdrr.io/cran/asbio/man/ci.sigma.html
# ------------------------------------------------

#install.packages("asbio")
library(asbio)
ci.sigma(rnorm(39))
ci.sigma(rnorm(10000))

n=100 
x <- rnorm(n, mean=4, sd=0.3)
hist(x, xlim=c(1, 7))
# conf int of the population mean
abline(v = (mean(x) + qt(0.975, n-1)*sd(x)/sqrt(n)), col="red")
abline(v = (mean(x) - qt(0.975, n-1)*sd(x)/sqrt(n)), col="red")

# conf int of the population sigma
# s$ci[1]:mean, [2]:2.5%, [3]:97.5%
# The mean is practical but sometimes found samples that goes beyond 3*mean
# So might better to use 4 sigma rather than 3 or to use 95% CI.
s <- ci.sigma(x)
abline(v = (4 + 3*sqrt(s$ci[1])), col="blue", lty="dashed") 
abline(v = (4 - 4*sqrt(s$ci[1])), col="blue", lty="dashed") 

abline(v = (4 + 3*0.3))
abline(v = (4 - 3*0.3))

library("rjags")

mod_string = "model {
  for (i in 1:length(y)) {
    y[i] ~ dnorm(mu, prec)
  }
  
  mu ~ dnorm(0.0, 1.0/1.0e6)
  prec ~ dgamma(5/2.0, 5*1.0/2.0)
  sig = sqrt(1.0 / prec)
}"

data_jags = list(y=x)
params=c("mu", "sig")

inits = function() {
  inits = list("mu"=rnorm(1, 0.0, 100.0), "prec"=rgamma(1, 1.0, 1.0))
}

mod = jags.model(textConnection(mod_string), data=data_jags, inits=inits, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

# plot(mod_sim)
# 
# gelman.diag(mod_sim)
# autocorr.diag(mod_sim)
# effectiveSize(mod_sim)
# 
# (pm_params = colMeans(mod_csim))
# 
# yhat = pm_params[1:2][data_jags$y]
# resid = data_jags$y - yhat
# plot(resid)
# 
# plot(yhat, resid)
# 
# # Results
# summary(mod_sim)
# HPDinterval(mod_csim)

s_hatmin <- summary(mod_csim)$quantiles[2,1]
s_hatmax <- summary(mod_csim)$quantiles[2,5]
s_hat <- summary(mod_csim)$quantiles[2,3]

m_hatmin <- summary(mod_csim)$quantiles[1,1]
m_hatmax <- summary(mod_csim)$quantiles[1,5]
m_hat <- summary(mod_csim)$quantiles[1,3]

abline(v = (m_hat + 3*s_hat), col="blue") 
abline(v = (m_hat - 3*s_hat), col="blue") 


# ------------------------------------------------
# 2020.4.26 Sun
# Show time series data using histogram
# ------------------------------------------------
# bp$t <- as.POSIXct(strftime(paste(bp$DATE, bp$TIME), "%Y-%m-%d %H:%M"))
# bp$t <- as.POSIXct(paste0(bp$TIME, ":00"), format="%H:%M:%S")
x <- c("04-13 10:02",
       "04-14 13:38",
       "04-15 20:05",
       "04-16 16:45",
       "04-17 20:47",
       "04-18 21:49",
       "04-20 20:19",
       "04-21 20:44",
       "04-22 13:41",
       "04-23 20:55",
       "04-24 7:45",
       "04-25 15:49",
       "04-25 22:12",
       "04-26 19:33")
x1 <- as.POSIXct(strptime(x, "%m-%d %H:%M"))

#??? difference between strftime() and strptime()

#横に日付、縦に時間のプロット
# extract time and date data from x1 separately and plot

x2 <- as.POSIXlt(x1)

#https://stackoverflow.com/questions/9839343/extracting-time-from-posixct
#install.packages("data.table")
library(data.table)
x2$date <- as.IDate(x2)
x2$time <- as.ITime(x2)
x2$time2 <- as.POSIXct(strptime(x2$time, "%H:%M:%S"))
#par(mfrow=c(2,1))
plot(x2$date, x2$time2)
x2$week <- as.factor(weekdays(x2))
plot(x2$week, x2$time2)

#インターバルを見る
par(mfrow=c(1,1))
hist(as.numeric(tail(x2,-1) - head(x2, -1)))

gsub("04-13 10:02","",)

# 横軸を週にしてプロット



#------------------------------------------------
# 2020.5.5 Tue
# RL practice with 2x2 gridworld
# https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html
# ------------------------------------------------

#install.packages("MDPtoolbox")
library(MDPtoolbox)

up   <- matrix(c(  1,   0,   0,   0,
                 0.7, 0.2, 0.1,   0,
                   0, 0.1, 0.2, 0.7,
                   0,   0,   0,   1),
               nrow=4, ncol=4, byrow=TRUE)

left <- matrix(c(0.9, 0.1,   0,   0,
                 0.1, 0.9,   0,   0,
                   0, 0.7, 0.2, 0.1,
                   0,   0, 0.1, 0.9),
               nrow=4, ncol=4, byrow=TRUE)

down <- matrix(c(0.3, 0.7,   0,   0,
                 0, 0.9,   0.1,   0,
                 0, 0.1, 0.9, 0,
                 0,   0, 0.7, 0.3),
               nrow=4, ncol=4, byrow=TRUE)

right <- matrix(c(0.9, 0.1,   0,   0,
                 0.1, 0.2,   0.7,   0,
                 0, 0, 0.9, 0.1,
                 0,   0, 0.1, 0.9),
               nrow=4, ncol=4, byrow=TRUE)

T <- list(up=up, left=left, down=down, right=right)

R <- matrix(c(-1,-1,-1,-1,
              -1,-1,-1,-1,
              -1,-1,-1,-1,
              10,10,10,10),
            nrow=4, ncol=4, byrow=TRUE)

mdp_check(T, R)
m <- mdp_policy_iteration(P=T, R=R, discount=0.9)
m$policy
names(T)[m$policy]
m$V

# 2nd video
#install.packages("devtools")
devtools::install_github("nproellochs/ReinforcementLearning")
library(ReinforcementLearning)
?gridworldEnvironment

env <- gridworldEnvironment
print(env)

states <- c("s1", "s2", "s3", "s4")
actions <- c("up", "down", "left", "right")

?sampleExperience
data <- sampleExperience(N=1000,
                         env=env,
                         states=states,
                         actions=actions)  
  
control <- list(alpha = 0.1,
                gamma = 0.5,
                epsilon = 0.1)
  
model <- ReinforcementLearning(data,
                               s="State",
                               a ="Action",
                               r="Reward",
                               s_new="NextState",
                               control=control)
print(model)  
summary(model)

# Ecample data
data_unseen <- data.frame(State=c("s1", "s2", "s1"),
                           stringsAsFactors=FALSE)
# Pick optimal aciton
data_unseen$OptimalAction <- predict(model, data_unseen$State)

data_unseen

# Sample N=1000 sequences from the environment
# using e-greedy action selection
data_new <- sampleExperience(N=1000,
                             env=env,
                             states=states,
                             actions=actions,
                             actionSelection="epsilon-greedy",
                             model=model,
                             control=control) 
# Update the existing policy using new training data
model_new <- ReinforcementLearning(data_new,
                                   s="State",
                                   a="Action",
                                   r="Reward",
                                   s_new="NextState",
                                   control=control,
                                   model=model)
# Print result
print(model_new)

# Plot reinforcement learning curve
plot(model_new)

#------------------------------------------------
# 2020.5.6 Wed
# RL practice2 with Tic-Tac-Toe
# https://cran.r-project.org/web/packages/ReinforcementLearning/vignettes/ReinforcementLearning.html
# ------------------------------------------------

# Load dataset
data("tictactoe")

# Define reinforcement learning parameters
control <- list(alpha=0.5, gamma=0.2, epsilon=0.1)

# Perform reinforcement learning
model <- ReinforcementLearning(tictactoe, 
                               s="State", 
                               a="Action",
                               r="Reward",
                               s_new="NextState",
                               iter=1,
                               control=control)
# Calculate optimal policy
pol <- computePolicy(model)

# Print policy
head(pol)

#------------------------------------------------
# 2020.5.6 Wed
# Deep RL practice1
# https://github.com/smilesun/rlR
# ------------------------------------------------

devtools::install_github("smilesun/rlR")
library(rlR)
env = makeGymEnv("CartPole-v0")
env
install.packages("imager")
library(imager)

#------------------------------------------------
# 2020.5.11 Mon
# test timevis
# https://daattali.com/shiny/timevis-demo/
# ------------------------------------------------
install.packages("timevis")
library(timevis)

data <- data.frame(
  id      = 1:4,
  content = c("FTB", "ESD",
              "EMI", "朝会"),
  start   = c("2020-05-11", "2020-05-11",
              "2020-05-18", "2020-05-12 9:00:00"),
  end     = c("2020-05-15", "2020-05-15", "2020-05-22", NA)
)

timevis(data)


data <- data.frame(
  id      = 1:4,
  content = c("Item one", "Item two",
              "Ranged item", "Item four"),
  start   = c("2016-01-10", "2016-01-11",
              "2016-01-20", "2016-02-14 15:00:00"),
  end     = c(NA, NA, "2016-02-04", NA)
)

timevis(data)

#------------------------------------------------
# 2020.5.15 Fri
# Coursera Bayesian statistics 1, W1 Quiz
# ------------------------------------------------
x <- matrix(c(203,122,118,167,178,528,212,673), nrow=2)
x1 <- data.frame(x)
names(x1) <- c("1st", "2nd", "3rd", "Crew")
row.names(x1) <- c("survived", "dead")
rbind(x1, sapply(x1, sum))
x2 <- rbind(x1, sapply(x1, sum))
row.names(x2) <- c("survived", "dead", "sum")
rate <- round(x2[3,]/sum(x2[3,]), 2) # rate of class
drate <- round(x2[2,]/sum(x2[2,]), 2) # rate of death by class
srate <- round(x2[1,]/sum(x2[1,]), 2) # rate of survive by class
x3 <- rbind(x2, srate, drate, rate)
row.names(x3) <- c("survived", "dead", "sum", "srate", "drate", "rate")
x3
sum(x3[1,])/sum(x3[3,]) # rate of person survived
sum(x3[1,1])/sum(x3[3,1]) # rate of person in 1st class survived
  
sum(x3[1,])/sum(x3[3,]) # P(survived)
x3[3,1]/sum(x3[3,]) # P(1st)
x3[1,1]/sum(x3[1,]) # P(survived, 1st)


m <- mat("94, 20, 44; 40, 92, 51; 27, 69, 74")
argmax(m)

#------------------------------------------------
# 2020.6.8 Sun
# plotting with legend
# ------------------------------------------------
# Random data to plot:
A <- data.frame(x=rnorm(100, 20, 2), y=rnorm(100, 20, 2))
B <- data.frame(x=rnorm(100, 21, 1), y=rnorm(100, 21, 1))

# Add extra space to right of plot area; change clipping to figure
par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)

# Plot both groups
plot(y ~ x, A, ylim=range(c(A$y, B$y)), xlim=range(c(A$x, B$x)), pch=1,
     main="Scatter plot of two groups")
points(y ~ x, B, pch=3)

# Add legend to top right, outside plot region
legend("topright", inset=c(-0.2,0), legend=c("A","B"), pch=c(1,3), title="Group")

# ------------------------------------------------
par(oma=c(0, 0, 0, 5))
plot(1:3, rnorm(3), pch=1, lty=1, type="o", ylim=c(-2,2))
lines(1:3, rnorm(3), pch=2, lty=2, type="o")
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("group A", "group B"), pch=c(1, 2), lty=c(1,2))

#------------------------------------------------
# 2020.6.8 Sun
# shiny plotting with legend
# ------------------------------------------------

library(plotly)

ui <- fluidPage(
  fluidRow(
    column(2, 
           checkboxGroupInput("species", 
                              label = "Species", 
                              choices = unique(iris$Species))),
    column(10, 
           plotlyOutput('irisPlotly'))
  )
)

server <- function(input, output) {
  # Filter only selected species
  selectedData <- reactive({
    iris[iris$Species %in% input$species, ]
  })
  
  # Render plotly plot
  output$irisPlotly <- renderPlotly({
    plot_ly(selectedData(), 
            x = ~Sepal.Length, 
            y =~Sepal.Width,
            color = ~Species) %>%
      layout(showlegend = TRUE)
  })
}

shinyApp(ui = ui, server = server)


# Libraries
library(ggplot2)
library(dplyr)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 10), name="Population (M)")


https://www.r-graph-gallery.com/scatterplot.html


#------------------------------------------------
# 2020.6.13 Sat
# investigate packages installed and their version
# https://shiny.rstudio.com/articles/upgrade-R.html
# ------------------------------------------------

pkgs <- as.data.frame(installed.packages(), stringsAsFactors = FALSE, row.names = FALSE)
pkgs[, c("Package", "Version", "Built")]

update.packages(ask = FALSE, checkBuilt = TRUE)


#------------------------------------------------
# 2020.6.13 Sat
# inserting codes for debug on shiny program
# https://github.com/rstudio/shiny/issues/869
# ------------------------------------------------

shinyTest <- function() {
  library(shiny)
  testo <- runApp(shinyApp(
    ui = fluidPage(actionButton("do", "Click Me")),
    server = function(input, output) {
      observeEvent(input$do, {
        cat("Button clicked\n")
        stopApp("Return value")
      })
    }
  ))
  
  cat("Before sleep\n")
  print(testo)
  Sys.sleep(1)
  cat("After sleep\n")
  print(testo)
  
  testo
}

shinyTest()

#------------------------------------------------
# 2020.7.3 Fri
# Coursera Bayesian Statistics W4 Quiz 1
# -----------------------------------------------

theta <- seq(95, 102, by=0.05)
plot(theta, dnorm(theta, mean=96.17, sd=0.042), type='l', col="red")
lines(theta, dnorm(theta, mean=100, sd=0.25), type='l')
lines(theta, dnorm(theta, mean=96.17, sd=0.292), type='l', col="magenta")
lines(theta, dnorm(theta, mean=100, sd=0.5), type='l', col="gray")

#------------------------------------------------
# 2020.7.3 Fri
# Analyze emi6, the clustered EMI data for F64
# -----------------------------------------------

library(dplyr)
setwd("/Users/keijiharada/AI/Coursera/Data_Science/work/emiapp")
x <- read.csv("emi6.csv")
x1 <- filter(x, x$cluster==1)
x2 <- filter(x, x$cluster==2)
x3 <- filter(x, x$cluster==3)
x4 <- filter(x, x$cluster==4)
x5 <- filter(x, x$cluster==5)
x6 <- filter(x, x$cluster==6)
x7 <- filter(x, x$cluster==7)
par(mfrow=c(4,2))
hist(x1$Freq)
hist(x2$Freq)
hist(x3$Freq)
hist(x4$Freq)
hist(x5$Freq)
hist(x6$Freq)
hist(x7$Freq)

if(sd(data$Freq) < 1) {
  data$NType <- "narrow"
  data$NFreq <- round(mean(data$Freq), 0)
}
else {
  data$NType <- "broad"
  data$NFreq <- paste(min(x1$Freq), "~", max(x1$Freq))
}

analyze <- function(data){
  if(sd(data$Freq) < 1) {
    data$NType <- "narrow"
    data$NFreq <- round(mean(data$Freq), 0)
  }
  else {
    data$NType <- "broad"
    data$NFreq <- paste(min(data$Freq), "~", max(data$Freq))
  }
  data
}

test <- x7
test <- analyze(test)
head(test[, c(2, 50:52)])

#------------------------------------------------
# 2020.7.12 Sun
# Bayesian statistics of Coursera, W4
# -----------------------------------------------

oring =read.table("http://www.randomservices.org/random/data/Challenger2.txt", header=TRUE)
attach(oring)
with(oring, plot(T, I))
oring.lm=with(oring, lm(I~T))
summary(oring.lm)
with(oring, lines(T, fitted(oring.lm)))
# 95% posterior interval for the slope
-0.24337 - 0.06349*qt(0.975, df=21)
-0.24337 + 0.06349*qt(0.975, df=21)

#------------------------------------------------
# 2020.7.17 Fri
# Bayesian statistics of Coursera, W4 
# -----------------------------------------------

x <- read.table("pgalpga2008.dat.txt", header=TRUE)
cnames <- c("Dist", "Acc", "FW")
names(x) <- cnames
par(mfrow=c(2, 1))
x1 <- subset(x, FW=="1") # Female players
with(x1, plot(Dist, Acc, xlim=c(200, 350)))
with(x1, abline(lm(x1$Acc~x1$Dist), col="blue"))

x2 <- subset(x, FW=="2") # Male players
with(x2, plot(Dist, Acc, xlim=c(200, 350)))
with(x2, abline(lm(x2$Acc~x2$Dist), col="blue"))


x1.lm <- lm(Acc~Dist, x1)
predict(x1.lm, newdata=data.frame(Dist=260), interval="predict")
confint(x1.lm)

x1.lm <- lm(x1$Acc~x1$Dist)
p <- data.frame(predict(x1.lm, newdata=data.frame(Dist=260), interval="predict"))
par(mfrow=c(3, 1))
hist(p$fit, xlim=c(50, 85))
hist(p$lwr, xlim=c(50, 85))
hist(p$upr, xlim=c(50, 85))

x2$FW = x2$FW-2
x <- rbind(x1, x2)
x.lm <- lm(Acc~Dist+FW, x)
summary(x.lm)
plot(fitted(x.lm), residuals(x.lm))

#------------------------------------------------
# 2020.7.17 Fri
# Bayesian statistics of Coursera, W4 
# -----------------------------------------------

set.seed(678)
path <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/titanic_data.csv'
titanic <-read.csv(path)
head(titanic)

shuffle_index <- sample(1:nrow(titanic))
head(shuffle_index)

titanic <- titanic[shuffle_index, ]
head(titanic)

library(dplyr)
# Drop variables
clean_titanic <- titanic %>%
  select(-c(home.dest, cabin, name, x, ticket)) %>% 
  #Convert to factor level
  mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')),
         survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) %>%
  na.omit()
glimpse(clean_titanic)

create_train_test <- function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample <- 1:total_row
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
}

data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)

prop.table(table(data_train$survived))

library(rpart)
#install.packages("rpart.plot")
library(rpart.plot)
fit <- rpart(survived~., data=data_train, method='class')
rpart.plot(fit, extra=106)
#------------------------------------------------
# 2020.7.23 Thu
# Test MANIPULATE
# -----------------------------------------------
library(manipulate)
manipulate(
  plot(cars, xlim=c(0,x.max)),  
  x.max=slider(15,25))

library(shiny)
ui <- fluidPage(
  titlePanel("Shiny Test"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("x.max",
                  "Number of data:",
                  min = 15,
                  max = 25,
                  value = 10)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
server <- function(input, output) {
  output$distPlot <- renderPlot({
    plot(cars, xlim=c(0,input$x.max))
  })
}
shinyApp(ui = ui, server = server)


#------------------------------------------------
# 2020.7.23 Thu
# glm
# -----------------------------------------------
library(tidyr)
library(plotly)
library(htmlwidgets)
#install.packages("dygraphs")
library(dygraphs)
p <- plot_ly(mtcars, x = ~wt, y = ~mpg) %>%
  add_markers(
    text = rownames(mtcars),
    customdata = paste0("http://google.com/#q=", rownames(mtcars))
  )

onRender(
  p, "
  function(el) {
    el.on('plotly_click', function(d) {
      var url = d.points[0].customdata;
      window.open(url);
    });
  }
")

#------------------------------------------------
# 2020.7.23 Thu
# sharable "manipulate" plot
# -----------------------------------------------
# c.f. https://cran.r-project.org/web/packages/manipulateWidget/vignettes/manipulateWidgets.html
install.packages("manipulateWidget")
library(manipulateWidget)
mydata <- data.frame(
  timeId = 1:100,
  series1 = rnorm(100),
  series2 = rnorm(100),
  series3 = rnorm(100)
)
manipulateWidget(
  dygraph(mydata[range[1]:range[2], c("timeId", series)], main = title),
  range = mwSlider(1, 100, c(1, 100)),
  series = mwSelect(c("series1", "series2", "series3")),
  title = mwText(),
  .compare = list(
    title = list("First chart", "Second chart"),
    series = NULL
  )
)

# manipulate
# cf https://support.rstudio.com/hc/en-us/articles/200551906-Interactive-Plotting-with-Manipulate
manipulate(
  barplot(as.matrix(longley[,factor]), 
          beside = TRUE, main = factor),
  factor = picker("GNP", "Unemployed", "Employed"))

manipulate(
  boxplot(Freq ~ Class, data = Titanic, outline = outline),
  outline = checkbox(FALSE, "Show outliers"))

manipulate(
  plot(cars, xlim=c(0,x.max)),  
  x.max=slider(15,25))

par(mfrow=c(1,1))
manipulate(
  plot(cars, xlim = c(0, x.max), type = type, ann = label),
  x.max = slider(10, 25, step=5, initial = 25),
  type = picker("Points" = "p", "Line" = "l", "Step" = "s"),
  label = checkbox(TRUE, "Draw Labels"))

#c.f. https://plotly-r.com/client-side-linking.html
# about crosstalk https://rstudio.github.io/crosstalk/shiny.html
library(crosstalk)
tx <- highlight_key(txhousing)
widgets <- bscols(
  widths = c(12, 12, 12),
  filter_select("city", "Cities", tx, ~city),
  filter_slider("sales", "Sales", tx, ~sales),
  filter_checkbox("year", "Years", tx, ~year, inline = TRUE)
)
bscols(
  widths = c(4, 8), widgets, 
  plot_ly(tx, x = ~date, y = ~median, showlegend = FALSE) %>% 
    add_lines(color = ~city, colors = "black")
)

R <- 5
I <- seq(from=0, to=0.5, by=0.01)
V <- 5 - I*R
data <- data.frame(cbind(R, I, V))

library(shiny)
ui <- fluidPage(
  titlePanel("Shiny Test"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("R","Resistor value:",
                  min = 1,max = 10,value = 2)
    ),
    mainPanel(
      #plotlyOutput("plot3"),
      plotlyOutput("distPlot")
    )
  )
)
server <- function(input, output) {
  output$distPlot <- renderPlotly({
    I <- seq(from=0, to=0.5, by=0.01)
    V <- 5 - I*input$R
    data <- data.frame(cbind(input$R, I, V))
    g <- ggplot(data)
    p <- g + geom_point(aes(x=I, y=V))
    p <- p + xlim(0, 0.5) + ylim(0, 5)
    ggplotly(p)
  })
}
shinyApp(ui = ui, server = server)


#------------------------------------------------
# 2020.7.25 Fri
# The economist data visualization using plotly
# -----------------------------------------------
setwd("/Users/keijiharada/Downloads")
x3 <- read.csv("20200718-economist.csv", header=TRUE)
x3$DATE <- as.Date(as.character(x3$DATE), "%Y-%m-%d")
library(ggplot2)
library(plotly)
library(tidyr)
library(dplyr)
gdp <- x3[, c(1:8)]
names(gdp) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
gdp2 <- gdp %>% gather(NAME, GDP, -DATE)
p <- ggplot(gdp2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=GDP)) +
  geom_path(aes(x=DATE, y=GDP)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="GDP")
ggplotly(p)

cp <- x3[, c(1, 10:16)]
names(cp) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
cp2 <- cp %>% gather(NAME, CP, -DATE)
p <- ggplot(cp2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=CP)) +
  geom_path(aes(x=DATE, y=CP)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Consumer prices")
ggplotly(p)

uep <- x3[, c(1, 18:24)]
names(uep) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
uep2 <- uep %>% gather(NAME, UEP, -DATE)
p <- ggplot(uep2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=UEP)) +
  geom_path(aes(x=DATE, y=UEP)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Unemployment rate")
ggplotly(p)

cab <- x3[, c(1, 26:32)] 
names(cab) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
cab2 <- cab %>% gather(NAME, CAB, -DATE)
p <- ggplot(cab2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=CAB)) +
  geom_path(aes(x=DATE, y=CAB)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Current account banalce")
ggplotly(p)

bgb <- x3[, c(1, 34:40)] 
names(bgb) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
bgb2 <- bgb %>% gather(NAME, BGB, -DATE)
p <- ggplot(bgb2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=BGB)) +
  geom_path(aes(x=DATE, y=BGB)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Government budget banalce")
ggplotly(p)

ir <- x3[, c(1, 42:48)] 
names(ir) <- c("DATE", "US", "CN", "JP", "EU","IN", "SK", "TW")
ir2 <- ir %>% gather(NAME, IR, -DATE)
p <- ggplot(ir2, aes(color=NAME)) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=IR)) +
  geom_path(aes(x=DATE, y=IR)) +
  geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="10 year Interest rate")
ggplotly(p)

fx <- x3[, c(1, 50:55)] 
names(fx) <- c("DATE", "CN", "JP", "EU","IN", "SK", "TW")
fx2 <- fx %>% gather(NAME, FX, -DATE)
p1 <- ggplot(fx[,c(1,2)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=CN)) +
  geom_path(aes(x=DATE, y=CN)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=CN)) +
  geom_text(aes(x=mean(DATE), y=max(CN), label="CN")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p1)

p2 <- ggplot(fx[,c(1,3)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=JP)) +
  geom_path(aes(x=DATE, y=JP)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=JP)) +
  geom_text(aes(x=mean(DATE), y=max(JP), label="JP")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p2)

p3 <- ggplot(fx[,c(1,4)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=EU)) +
  geom_path(aes(x=DATE, y=EU)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=EU)) +
  geom_text(aes(x=mean(DATE), y=max(EU), label="EU")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p2)

p4 <- ggplot(fx[,c(1,5)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=IN)) +
  geom_path(aes(x=DATE, y=IN)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=IN)) +
  geom_text(aes(x=mean(DATE), y=max(IN), label="IN")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p2)

p5 <- ggplot(fx[,c(1,6)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=SK)) +
  geom_path(aes(x=DATE, y=SK)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=SK)) +
  geom_text(aes(x=mean(DATE), y=max(SK), label="SK")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p5)


p6 <- ggplot(fx[,c(1,7)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=TW)) +
  geom_path(aes(x=DATE, y=TW)) +
  geom_smooth(method="loess", se=FALSE, aes(x=DATE, y=TW)) +
  geom_text(aes(x=mean(DATE), y=max(TW), label="TW")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Foreign exchange rate")
#ggplotly(p6)

#install.packages("gridExtra")
#library(gridExtra)
#grid.arrange(p1, p2, nrow=1)
#https://stackoverflow.com/questions/32955163/multiple-ggplot2-plots-with-plotly
subplot(p1, p2, p3, p4, p5, p6, nrows=2)

stocks <- x3[, c(1, 57:64)] 
#names(stocks) <- c("DATE", "CN", "JP", "EU","IN", "SK", "TW")
#fx2 <- fx %>% gather(NAME, FX, -DATE)
p1 <- ggplot(stocks[,c(1,2)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=SP)) +
  geom_path(aes(x=DATE, y=SP)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=SP)) +
  geom_text(aes(x=mean(DATE), y=max(SP), label="S&P")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p1)

p2 <- ggplot(stocks[,c(1,3)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=NDQ)) +
  geom_path(aes(x=DATE, y=NDQ)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=NDQ)) +
  geom_text(aes(x=mean(DATE), y=max(NDQ), label="Nasdaq")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p2)

p3 <- ggplot(stocks[,c(1,4)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=SSE)) +
  geom_path(aes(x=DATE, y=SSE)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=SSE)) +
  geom_text(aes(x=mean(DATE), y=max(SSE), label="Shanghai")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p3)

p4 <- ggplot(stocks[,c(1,5)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=NK)) +
  geom_path(aes(x=DATE, y=NK)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=NK)) +
  geom_text(aes(x=mean(DATE), y=max(NK), label="Nikkei")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p4)

p5 <- ggplot(stocks[,c(1,6)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=DAX)) +
  geom_path(aes(x=DATE, y=DAX)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=DAX)) +
  geom_text(aes(x=mean(DATE), y=max(DAX), label="Deutsche")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p5)

p6 <- ggplot(stocks[,c(1,7)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=BSE)) +
  geom_path(aes(x=DATE, y=BSE)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=BSE)) +
  geom_text(aes(x=mean(DATE), y=max(BSE), label="Bovespa")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p6)

p7 <- ggplot(stocks[,c(1,8)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=KSP)) +
  geom_path(aes(x=DATE, y=KSP)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=KSP)) +
  geom_text(aes(x=mean(DATE), y=max(KSP), label="Korea")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p7)

p8 <- ggplot(stocks[,c(1,9)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=TWI)) +
  geom_path(aes(x=DATE, y=TWI)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=TWI)) +
  geom_text(aes(x=mean(DATE), y=max(TWI), label="Taiwan")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Stock prices")
ggplotly(p8)

subplot(p1, p2, p3, p4, p5, p6, p7, p8, nrows=2)

comms <- x3[, c(1, 68:72)] 
#names(stocks) <- c("DATE", "CN", "JP", "EU","IN", "SK", "TW")
#fx2 <- fx %>% gather(NAME, FX, -DATE)
p1 <- ggplot(comms[,c(1,2)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=ALL)) +
  geom_path(aes(x=DATE, y=ALL)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=ALL)) +
  geom_text(aes(x=mean(DATE), y=max(ALL), label="ALL")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Commodity prices")
ggplotly(p1)

p2 <- ggplot(comms[,c(1,3)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=FOOD)) +
  geom_path(aes(x=DATE, y=FOOD)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=FOOD)) +
  geom_text(aes(x=mean(DATE), y=max(FOOD), label="FOOD")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Commodity prices")
ggplotly(p2)

p3 <- ggplot(comms[,c(1,4)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=METAL)) +
  geom_path(aes(x=DATE, y=METAL)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=METAL)) +
  geom_text(aes(x=mean(DATE), y=max(METAL), label="METAL")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Commodity prices")
ggplotly(p3)

p4 <- ggplot(comms[,c(1,5)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=GOLD)) +
  geom_path(aes(x=DATE, y=GOLD)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=GOLD)) +
  geom_text(aes(x=mean(DATE), y=max(GOLD), label="GOLD")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Commodity prices")
ggplotly(p4)

p5 <- ggplot(comms[,c(1,6)]) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=Brent)) +
  geom_path(aes(x=DATE, y=Brent)) +
  geom_smooth(method="lm", se=FALSE, aes(x=DATE, y=Brent)) +
  geom_text(aes(x=mean(DATE), y=max(Brent), label="Brent")) +
  #facet_grid(.~NAME) +
  #geom_hline(yintercept=0, linetype="dotted", color="red") +
  labs(title="Commodity prices")
ggplotly(p5)

subplot(p1, p2, p3, p4, p5, nrows=2)


#------------------------------------------------
# 2020.7.26 Sun
# TEST
# -----------------------------------------------

CN <- x3[, c(1, 3, 11, 19, 27, 35, 43, 50, 59, 68:72)]
names(CN) <- c("DATE", "GDP", "CP", "UEP", "CAB", "BGB", "IR"
               , "FX", "SSE", "ALL", "FOOD", "METAL", "GOLD", "Brent")

#remotes::install_github("tylermorganwall/rayshader")
#library(rayshader)
#library(ggplot2)
#library(tidyverse)

#install.packages('gganimate')
#library(gganimate)
library(plotly)
library(ggplot2)
#theme_set(theme_bw())

p <- ggplot(CN) +
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=scale(-BGB))) +
  geom_path(aes(x=DATE, y=scale(-BGB))) +
  #geom_point(size=2, alpha=1/2, aes(x=DATE, y=scale(-SSE), color="darkmagenta")) +
  #geom_path(aes(x=DATE, y=scale(-SSE), color="darkmagenta"))
  geom_point(size=2, alpha=1/2, aes(x=DATE, y=scale(GOLD)), color="lightblue") +
  geom_path(aes(x=DATE, y=scale(GOLD)), color="lightblue")
ggplotly(p)

#p + transition_time(DATE) +labs(title="Date:{DATE}")

library("PerformanceAnalytics")
chart.Correlation(CN[, c(2:14)], histogram=TRUE, pch=19)

#install.packages("corrplot")
library(corrplot)
M <- cor(CN[, c(2:14)])
corrplot.mixed(M)
#------------------------------------------------
# 2020.7.26 Sun
# Reinforcement learning
# -----------------------------------------------
devtools::install_github("nproellochs/ReinforcementLearning")
library(ReinforcementLearning)

data("tictactoe")
head(tictactoe,10)

states <- c("s1", "s2", "s3", "s4")
actions <- c("up", "down", "left", "right")

env <- gridworldEnvironment
print(env)

data <- sampleExperience(N=1000, env=env, states=states, actions=actions)
head(data)
dim(data)

#------------------------------------------------
# 2020.8.1 Sat
# Inventing EMI analysis tools
# analyze EMI clusterd data
# -----------------------------------------------
setwd("/Users/keijiharada/Downloads")
x <- read.csv("emi6.csv")
x1 <- subset(x, cluster==1)
par(mfrow=c(3,2))
hist(x1$Freq, col="lightblue")
abline(v=quantile(x1$Freq)[2], lty="dashed")
abline(v=quantile(x1$Freq)[4], lty="dashed")
text(x=quantile(x1$Freq)[2], y=5.5, round(quantile(x1$Freq)[2], 0))
text(x=quantile(x1$Freq)[4], y=5.5, round(quantile(x1$Freq)[4], 0))
plot(x1$Freq, x1$Margin, pch=19, col=x1$Operation)
abline(v=quantile(x1$Freq)[2], lty="dashed")
abline(v=quantile(x1$Freq)[4], lty="dashed")
text(x=quantile(x1$Freq)[2], y=5.5, round(quantile(x1$Freq)[2], 0))
text(x=quantile(x1$Freq)[4], y=5.5, round(quantile(x1$Freq)[4], 0))
#legend("topleft", legend=x1$Operation,lty=1:2, cex=0.8, box.lty=0)
hist(x1$Height, col="lightblue")
plot(x1$Height, x1$Margin, pch=19, col=x1$Operation)
hist(x1$Angle, col="lightblue")
plot(x1$Angle, x1$Margin, pch=19, col=x1$Operation)


par(mfrow=c(3,1))
plot(density(x1$Freq))
hist(x1$Freq, col="lightblue")
abline(v=quantile(x1$Freq)[2], lty="dashed")
abline(v=quantile(x1$Freq)[4], lty="dashed")
text(x=quantile(x1$Freq)[2], y=5.5, round(quantile(x1$Freq)[2], 0))
text(x=quantile(x1$Freq)[4], y=5.5, round(quantile(x1$Freq)[4], 0))
plot(x1$Freq, x1$Margin, pch=19, col=x1$Operation)
abline(v=quantile(x1$Freq)[2], lty="dashed")
abline(v=quantile(x1$Freq)[4], lty="dashed")
text(x=quantile(x1$Freq)[2], y=5.5, round(quantile(x1$Freq)[2], 0))
text(x=quantile(x1$Freq)[4], y=5.5, round(quantile(x1$Freq)[4], 0))



par(mfrow=c(3, 1))
plot(x1$Operation, x1$Margin, pch=19, col=x1$Operation)

library(ggplot2)
ggplot(x1) +
  geom_point(aes(x=Operation, y=Margin), stat="identity")

# Operation, Margin, Frequency, Height and Angle

library(mclust)
fit <- Mclust(x1[,c(2,9)], 3)
x1$cluster2 <- fit$classification

library(plotly)
g <- ggplot(x1)
p <- g + geom_point(aes(x=Freq, y=Margin, color=as.factor(cluster2)))
#p <- p + facet_grid(Operation~HV)
p <- p + facet_grid(Operation~.)
ggplotly(p)

x2 <- subset(x1, cluster2==2)
fit <- Mclust(x2[,c(2,9)], 2)
x2$cluster3 <- fit$classification
g <- ggplot(x2)
p <- g + geom_point(aes(x=Freq, y=Margin, color=as.factor(cluster3)))
#p <- p + facet_grid(Operation~HV)
p <- p + facet_grid(Operation~.)
p <- p + xlim(0, 250)
ggplotly(p)




#install.packages("sfsmisc")
library(sfsmisc)


#------------------------------------------------
# 2020.8.1 Sat
# Getting data of the number of tests in a country
# -----------------------------------------------
x <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")
names(x)
x1 <- subset(x, iso_code=="JPN")
library(ggplot2)
ggplot(x1) + geom_point(aes(x=as.Date(date), y=new_tests))
ggplot(x, aes(color=continent)) + geom_point(aes(x=as.Date(date), y=new_tests_smoothed_per_thousand))

x2 <- subset(x, location==c("France", "Germany", "Sweden", "Spain", "Italy", "United Kingdom",
                           "Japan", "Taiwan", "South Korea", "China", "India",
                           "United States", "Brazil"))

library(ggplot2)
library(plotly)
g <- ggplot(x2, aes(x=as.Date(date), y=new_tests_smoothed_per_thousand, color=location)) 
p <- g + geom_point() + geom_line() 
#p <- p + geom_point(aes(x$new_cases))
ggplotly(p)

g <- ggplot(x2, aes(color=location)) 
p <- g + geom_point(aes(x=as.Date(date), y=new_tests_smoothed_per_thousand))
p <- p + geom_path(aes(x=as.Date(date), y=new_tests_smoothed_per_thousand)) 
p <- p + geom_bar(aes(x=as.Date(date), y=new_cases, fill=location), stat="identity")
#p <- p + geom_point(aes(x$new_cases))
ggplotly(p)

g <- ggplot(x2, aes(x=as.Date(date), y=new_cases, fill=location)) 
p <- g + geom_bar(stat="identity")
p <- g + geom_bar(stat="identity", position=position_dodge)
#p <- g + geom_bar(aes(y=new_cases), stat="bin", fill="white")
ggplotly(p)

# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
x2 <- subset(x, location==c("Japan", "Taiwan", "South Korea", "China"))

g1 <- ggplot(x2, aes(color=location)) 
p1 <- g1 + geom_point(aes(x=as.Date(date), y=new_tests_smoothed_per_thousand))
p1 <- p1 + geom_path(aes(x=as.Date(date), y=new_tests_smoothed_per_thousand)) 

#p1 <- p1 + labs(title="COVID19 test rate per 1,000", y="Test rate/1,000") 
#p1 <- p1 + ggtitle("COVID19 test rate per 1,000")
g2 <- ggplot(x2, aes(color=location)) 
p2 <- g2 + geom_bar(aes(x=as.Date(date), y=new_cases, fill=location), stat="identity")

#p2 <- p2 + labs(title="COVID19 cases", y="Cases") 
p2 <- p2 + ggtitle("Upper: Test rate per 1,000, Lower: Cases")
subplot(p1, p2, nrows=2)



#------------------------------------------------
# 2020.8.7 Fri
# How to add a link on a shiny app
# -----------------------------------------------
library(shiny)
runApp(
  list(ui = fluidPage(
    uiOutput("tab")
  ),
  server = function(input, output, session){
    url <- a("Google Homepage", href="https://www.google.com/")
    output$tab <- renderUI({
      tagList("URL link:", url)
    })
  })
)

w <- read.csv("temp.csv")

# ------------------------------------------------
# 2020.9.6 Sun How to use caret rf
# ------------------------------------------------

library(caret)
fit_rf <- train(mpg~., data=mtcars, method='rf')
pred <- predict(fit_rf, mtcars)
plot(mtcars$mpg , pred)

trellis.par.set(caretTheme())
plot(fit_rf)  

trellis.par.set(caretTheme())
densityplot(fit_rf, pch = "|")

library(e1071)
knnFit <- train(Species ~ ., data = iris, method = "knn", 
                trControl = trainControl(method = "cv"))

rdaFit <- train(Species ~ ., data = iris, method = "rda", 
                trControl = trainControl(method = "cv"))

predict(knnFit)
predict(knnFit, type = "prob")

bothModels <- list(knn = knnFit,
                   tree = rdaFit)

predict(bothModels)

extractPrediction(bothModels, testX = iris[1:10, -5])
extractProb(bothModels, testX = iris[1:10, -5])
# This is not about extracting coefficients calculated by the package but
# predictions and probabilities, as the names suggests...
## End(Not run)

# ------------------------------------------------
# 2020.9.6 3D plot
# ------------------------------------------------

# 3D surface
terrain2 <- matrix(sort(rnorm(100*100)), nrow=100, ncol=100)
plot_ly(z=terrain2, type="surface")


# 3D plotlibrary(plotly)
set.seed(2016-07-21)
temp <- rnorm(100, mean=30, sd=5)
pressure <- rnorm(100)
dtime <- 1:100
plot_ly(x=temp, y=pressure, z=dtime,
        type='scatter3d', mode="markers", color=temp)

# ------------------------------------------------
# 2020.9.12 Connecting a mysql server on mamp
# ------------------------------------------------
install.packages("RMySQL")
library(RMySQL)
# mydb = dbConnect(MySQL(), user='user', password='root', dbname='Bio', host='localhost')
# mydb = dbConnect(MySQL(), dbname='Bio', host='localhost')
# mydb = dbConnect(MySQL(), user = 'root', password = '', dbname='Bio', host='localhost', unix.socket="8889")
# mydb = dbConnect(MySQL(), user = 'root', password = '', dbname='Bio', host='localhost', port=8889)
mydb = dbConnect(MySQL(), user = 'root', password = 'root', dbname='Bio', host='localhost', unix.sock="/Applications/MAMP/tmp/mysql/mysql.sock")


dbListTables(mydb)
dbListFields(mydb, 'Cage')
result = dbSendQuery(mydb, "select * from Cage")
data = fetch(result, n=-1)
# https://stackoverflow.com/questions/40570804/cant-connect-to-local-mysql-server-in-r
# https://www.r-bloggers.com/accessing-mysql-through-r/


# ------------------------------------------------
# 2020.9.26 Review old commands
# ------------------------------------------------

# Points
# 1. using name "FX_COUNTRY"

x1 <- gather(fx, FX_COUNTRY, value) %>% 
  separate(FX_COUNTRY, c("FX", "COUNTRY")) %>% 
  group_by(COUNTRY) %>% 
  mutate(ave=mean(value), sigma=sd(value),  rate=sigma/ave) %>% 
  select(COUNTRY, ave, sigma, rate) %>% 
  unique

country   value
1     FX.CN    6.88
2     FX.CN    7.02
3     FX.CN    7.12
4     FX.CN    7.13

FX COUNTRY   value
1   FX      CN    6.88
2   FX      CN    7.02
3   FX      CN    7.12
4   FX      CN    7.13

FX    COUNTRY value   ave  sigma   rate
1 FX    CN       6.88  7.01 0.0802 0.0114
2 FX    CN       7.02  7.01 0.0802 0.0114
3 FX    CN       7.12  7.01 0.0802 0.0114
4 FX    CN       7.13  7.01 0.0802 0.0114

COUNTRY      ave   sigma    rate
1 CN         7.01   0.0802  0.0114
2 JP       108.     1.60    0.0149
3 EU         0.895  0.0257  0.0287
4 IN        73.5    2.12    0.0288
5 SK      1197.    22.9     0.0191
6 TW        30.0    0.502   0.0167
7 BZ        NA     NA      NA   


gdp <- select(x, contains("GDP"))
gdp <- select(gdp, -contains("BZ"))
x <- gdp %>% gather(gdp.country, value) %>% separate(gdp.country, c("gdp", "country"))
x %>% group_by(country) %>% mutate(ave=mean(value), sigma=sd(value), rate=sigma/ave)
x %>% group_by(country) %>% 
  mutate(ave=mean(value), sigma=sd(value), rate=sigma/ave) %>% 
  select(country, ave, sigma, rate) %>% 
  unique

# ------------------------------------------------
# 2020.10.25 Pie chart  
# ------------------------------------------------

#https://plotly.com/r/pie-charts/
library(plotly)

labels = c('Oxygen','Hydrogen','Carbon_Dioxide','Nitrogen')
values = c(4500, 2500, 1053, 500)

fig <- plot_ly(type='pie', labels=labels, values=values, 
               textinfo='label+percent',
               insidetextorientation='radial')
fig


#https://stackoverflow.com/questions/41453746/how-to-get-complete-rather-than-partial-pie-charts-using-gganimate
library(animation)
# Fake data
set.seed(40)
df = data.frame(Year = rep(2010:2015, 3), 
                disease = rep(c("Cardiovascular","Neoplasms","Others"), each=6),
                count=c(sapply(c(1,1.5,2), function(i) cumsum(c(1000*i, sample((-200*i):(200*i),5))))))

saveGIF({
  for (i in unique(df$Year)) {
    p = ggplot(df[df$Year==i,], aes(x="", y=count, fill=disease, frame=Year))+
      geom_bar(width = 1, stat = "identity") + 
      facet_grid(~Year) +
      coord_polar("y", start=0) 
    print(p)
  }
}, movie.name="test1.gif")


# ------------------------------------------------
# 2020.10.31 Mixture models W1-1
# ------------------------------------------------

# Generate n observations from a mixture of two Gaussian 
# distributions
n     = 50           # Size of the sample to be generated
w     = c(0.6, 0.4)  # Weights
mu    = c(0, 5)      # Means
sigma = c(1, 2)      # Standard deviations
cc    = sample(1:2, n, replace=T, prob=w)
x     = rnorm(n, mu[cc], sigma[cc])

# Plot f(x) along with the observations 
# just sampled
xx = seq(-5, 12, length=200)
yy = w[1]*dnorm(xx, mu[1], sigma[1]) + 
  w[2]*dnorm(xx, mu[2], sigma[2])
par(mar=c(4,4,1,1)+0.1)
plot(xx, yy, type="l", ylab="Density", xlab="x", las=1, lwd=2)
points(x, y=rep(0,n), pch=1)  


# Generate n observations from a mixture of two Gaussian 
# distributions
n     = 200           # Size of the sample to be generated
w     = c(0.7, 0.2, 0.1)  # Weights
lambda    = c(1, 2, 6)      # Means
#sigma = c(1, 2)      # Standard deviations
cc    = sample(1:3, n, replace=TRUE, prob=w)
x     = rpois(n, lambda[cc])

# Plot f(x) along with the observations 
# just sampled
xx = seq(-10, 100, length=10)
yy = w[1]*rpois(xx, lambda[1]) + 
  w[2]*rpois(xx, lambda[2]) + 
  w[3]*rpois(xx, lambda[3]) 

par(mar=c(4,4,1,1)+0.1)
barplot(xx, yy)

y1 = w[1]*rpois(xx, lambda[1]) 
y2 = w[2]*rpois(xx, lambda[2]) 
y3 = w[3]*rpois(xx, lambda[3]) 

par(mfrow=c(3, 1))
barplot(xx, y1)
barplot(xx, y2)
barplot(xx, y3)

empfreq = table(factor(x, levels=seq(0, max(x))))/n
empfreq = table(x)/n
barplot(empfreq)

table(x)
barplot(table(x)/n)


# ------------------------------------------------
# 2020.10.31 Mixture models W1-2
# ------------------------------------------------
# Generate n observations from a mixture of two Gaussian 
# distributions
n     = 100           # Size of the sample to be generated
w     = c(0.3, 0.25, 0.25, 0.2)  # Weights
mu    = c(1, 4, 7, 10)      # Means
sigma = c(1, 2)      # Standard deviations
cc    = sample(1:4, n, replace=TRUE, prob=w)
x     = rexp(n, rate=1/mu[cc])

# ------------------------------------------------
# 2020.10.31 Mixture models W2-1
# ------------------------------------------------

x <- rnorm(100, mean=0, sd=1)
y <- rnorm(100, mean=2, sd=3)

par(mfrow=c(1,1))
plot(y~x)
cor(x, y)
abline(lm(y~x))
fit <- (lm(y~x))

# ------------------------------------------------
# 2020.12.22 Mixture models W5 Quiz1
# ------------------------------------------------

library(mvtnorm)

mu1 = c(0, 0)
mu2 = c(1/3, 1/3)
mu3 = c(-2/3, 1/3)
x = c(31, -23)
Sigma = diag(1,2)

l1 = dmvnorm(x, mu1, Sigma, log=T)
l2 = dmvnorm(x, mu2, Sigma, log=T)
l3 = dmvnorm(x, mu3, Sigma, log=T)
l1;l2;l3
exp(l2 - max(l1,l2,l3))/(exp(l1 - max(l1,l2,l3)) + exp(l2 - max(l1,l2,l3)) + exp(l3 - max(l1,l2,l3)))
exp(l3 - max(l1,l2,l3))/(exp(l1 - max(l1,l2,l3)) + exp(l2 - max(l1,l2,l3)) + exp(l3 - max(l1,l2,l3)))
mu <- t(matrix(c(mu1, mu2, mu3), ncol=3, nrow=2))
plot(mu[,1], mu[,2], xlim=c(-2, 35), ylim=c(-30, 2))
points(x[1], x[2], col="red")

# ------------------------------------------------
# 2020.12.30 Mixture model W5 Quiz 1
# ------------------------------------------------

k.star.hat = 0
for(i in 1:400){
  k.star.hat = k.star.hat + 2/(1+i)
}
k.star.hat

k.star.hat = 0
for(i in 1:100){
  k.star.hat = k.star.hat + 2/(1+i)
}
k.star.hat

alpha = 2
n = 100
alpha * log((n + alpha -1)/alpha)

n = 200
ff = function(alpha) alpha * log((n + alpha -1)/alpha) - 2
alpha = uniroot(ff, c(0.01, 20))
alpha$root


# ------------------------------------------------
# 2021.1.14 Thu See past data using density
# ------------------------------------------------

plot(density(fx$JP[1:60]), col=heat.colors(6)[1], ylim=c(0, 0.5))
lines(density(fx$JP[11:20]), col=heat.colors(6)[2])
lines(density(fx$JP[21:30]), col=heat.colors(6)[3])
lines(density(fx$JP[31:40]), col=heat.colors(6)[4])
lines(density(fx$JP[41:50]), col=heat.colors(6)[5])
lines(density(fx$JP[51:60]), col=heat.colors(6)[6])

hist(fx$JP[1:60], col=heat.colors(6)[1])
hist(fx$JP[11:20], col=heat.colors(6)[2], add=TRUE)
hist(fx$JP[21:30], col=heat.colors(6)[3], add=TRUE)
hist(fx$JP[31:40], col=heat.colors(6)[4], add=TRUE)
hist(fx$JP[41:50], col=heat.colors(6)[5], add=TRUE)
hist(fx$JP[51:60] col=heat.colors(6)[6], add=TRUE)

plot(stocks$SP[1:60], col=topo.colors(6)[1], type='l')
hist(stocks$SP[1:60], col=topo.colors(6)[1])

plot(density(stocks$SP[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.01))
lines(density(stocks$SP[11:20]), col=topo.colors(6)[2])
lines(density(stocks$SP[21:30]), col=topo.colors(6)[3])
lines(density(stocks$SP[31:40]), col=topo.colors(6)[4])
lines(density(stocks$SP[41:50]), col=topo.colors(6)[5])
lines(density(stocks$SP[51:60]), col=topo.colors(6)[6])

plot(density(stocks$NDQ[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.002))
lines(density(stocks$NDQ[11:20]), col=topo.colors(6)[2])
lines(density(stocks$NDQ[21:30]), col=topo.colors(6)[3])
lines(density(stocks$NDQ[31:40]), col=topo.colors(6)[4])
lines(density(stocks$NDQ[41:50]), col=topo.colors(6)[5])
lines(density(stocks$NDQ[51:60]), col=topo.colors(6)[6])

plot(density(stocks$SSE[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.01))
lines(density(stocks$SSE[11:20]), col=topo.colors(6)[2])
lines(density(stocks$SSE[21:30]), col=topo.colors(6)[3])
lines(density(stocks$SSE[31:40]), col=topo.colors(6)[4])
lines(density(stocks$SSE[41:50]), col=topo.colors(6)[5])
lines(density(stocks$SSE[51:60]), col=topo.colors(6)[6])

plot(density(stocks$NK[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.001))
lines(density(stocks$NK[11:20]), col=topo.colors(6)[2])
lines(density(stocks$NK[21:30]), col=topo.colors(6)[3])
lines(density(stocks$NK[31:40]), col=topo.colors(6)[4])
lines(density(stocks$NK[41:50]), col=topo.colors(6)[5])
lines(density(stocks$NK[51:60]), col=topo.colors(6)[6])


par(mfrow=c(1, 1))
plot(stocks$DAX[1:60], col=topo.colors(6)[1], type='l')
hist(stocks$DAX[1:60], col=topo.colors(6)[1])

plot(density(stocks$DAX[1:60]), col=heat.colors(6)[1], ylim=c(0, 0.002))
lines(density(stocks$DAX[11:20]), col=heat.colors(6)[2])
lines(density(stocks$DAX[21:30]), col=heat.colors(6)[3])
lines(density(stocks$DAX[31:40]), col=heat.colors(6)[4])
lines(density(stocks$DAX[41:50]), col=heat.colors(6)[5])
lines(density(stocks$DAX[51:60]), col=heat.colors(6)[6])

plot(density(stocks$KSP[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.01))
lines(density(stocks$KSP[11:20]), col=topo.colors(6)[2])
lines(density(stocks$KSP[21:30]), col=topo.colors(6)[3])
lines(density(stocks$KSP[31:40]), col=topo.colors(6)[4])
lines(density(stocks$KSP[41:50]), col=topo.colors(6)[5])
lines(density(stocks$KSP[51:60]), col=topo.colors(6)[6])

plot(density(stocks$TWI[1:60]), col=topo.colors(6)[1], ylim=c(0, 0.002))
lines(density(stocks$TWI[11:20]), col=topo.colors(6)[2])
lines(density(stocks$TWI[21:30]), col=topo.colors(6)[3])
lines(density(stocks$TWI[31:40]), col=topo.colors(6)[4])
lines(density(stocks$TWI[41:50]), col=topo.colors(6)[5])
lines(density(stocks$TWI[51:60]), col=topo.colors(6)[6])

# ------------------------------------------------
# 2021.2.1 CouchDB
# ------------------------------------------------

devtools::install_github("FvD/RcouchDB")
myConn <- couch_http_connection("localhost")


library("RCurl")
library(R4CouchDB)
cdb <- cdbIni()
cdb <- cdbIni(uname="admin", pwd="cage32044%")

cdb$serverName
opts = curlOptions(userpwd = "admin:cage32044%") 
dfc <- fromJSON(getURL("http://localhost:5984/my_healthdata",.opts=opts))
dfc

dfc <- fromJSON(getURL("http://localhost:5984/my_healthdata"))

dfc <- fromJSON(getURL("http://localhost:5984/my_healthdata/_design/all_data/_view/all",.opts=opts))

install.packages('devtools')
devtools::install_github("ropensci/sofa")
library(sofa)

library("rjson")  #https://www.tutorialspoint.com/r/r_json_files.htm
x <- Cushion$new(user = "admin", pwd = "cage32044%", host = "localhost", port=5984)
db_list(x)
db_alldocs(x, "my_healthdata2")
db_alldocs(x, dbname="my_healthdata2", as='json')
y <- fromJSON(db_alldocs(x, dbname="my_healthdata2", as='json'))

URL <- "http://localhost:5984/my_healthdata/_design/all_data/_view/all"
URL <- "http://admin:cage32044%@localhost:5984/my_healthdata/_design/all_data/_view/all"
getURL(URL, userpwd="admin:cage32044%")

opts = curlOptions(header=TRUE, userpwd = "admin:cage32044%", netrc=TRUE) 
getURL(URL, userpwd="admin:cage32044%", verbose=TRUE, .opts=opts)

#https://discuss.ropensci.org/t/basic-authentication-with-the-crul-r-package/642
library(crul)
res <- HttpClient$new(
  url = "http://localhost:5984/my_healthdata/_design/all_data/_view/all",
  auth = auth(user = "admin", pwd = "cage32044%")
)
res$auth
x <- res$get()
jsonlite::fromJSON(x$parse("UTF-8"))
test <- jsonlite::fromJSON(x$parse("UTF-8"))
times <- test$rows$value$defacation
dates <- test$rows$value$date

x <- paste(dates, times)
strptime(x, "%Y-%m-%d %H:%M")  # use "y" in the case of 21 or 20 for 2021 or 2020.

#dates <- c("02-27-1992", "02-27-1992", "01-14-1992", "02-28-1992", "02-01-1992")
#times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
#x <- paste(dates, times)
#strptime(x, "%m-%d-%Y %H:%M:%S")

data = list(
  date = '2020-2-6',
  defacation = '11:23'
)
response <- jsonlite::fromJSON(getURL(
  'http://localhost:5984/my_healthdata/',
  customrequest='POST',
  httpheader=c('Content-Type'='application/json'),
  postfields=toJSON(data),
  userpwd="admin:cage32044%", 
  httpauth = 1L
))

getURL('http://localhost:5984/my_healthdata/', userpwd="admin:cage32044%", httpauth = 1L)

vignette("tibble", package = "tibble").


# ------------------------------------------------
# 2021.2.11 Coursera
# ------------------------------------------------
install.packages('janitor')
library(janitor)

install.packages('skimr')
library(skimr)
library(dplyr)
library(tidyr)

# ------------------------------------------------
# 2021.2.13 Print out
# ------------------------------------------------
https://stackoverflow.com/questions/32789355/print-with-syntax-color-in-r-studio
library(knitr) 
stitch("file_name.R")
stitch(script="file_name.R", system.file("misc", "knitr-template.Rhtml", package="knitr"))

setwd("/Users/keijiharada/AI/Coursera/Data_Science/work/timevis-master/inst/example/")
stitch(script="server.R", system.file("misc", "knitr-template.Rhtml", package="knitr"))

# ------------------------------------------------
# 2021.3.13 timevis test
# http://uribo.github.io/rpkg_showcase/graphics/timevis.html
# ------------------------------------------------
#install.packages("timevis")
library(timevis)
timevis() %>% 
  addItems(data.frame(start = c(Sys.Date(), Sys.Date() - 1), 
  content = c("Today", "Yesterday"))),
  addItem(list(start = Sys.Date(), content = "Today"))

timevis(data = data.frame(
    start = c(Sys.Date(), Sys.Date(), Sys.Date() + 1, Sys.Date() + 2),
    content = c("one", "two", "three", "four"),
    group = c(1, 2, 1, 2)),
    groups = data.frame(id = 1:2, content = c("G1", "G2"))
  ) %>%
    setGroups(data.frame(id = 1:2, content = c("Group 1", "Group 2")))


timevis(data = data.frame(
  start = c(Sys.Date(),     Sys.Date(),    Sys.Date() + 1, Sys.Date() + 2,
            Sys.Date() + 3, Sys.Date()+ 4, Sys.Date() + 5, Sys.Date() + 6,
            Sys.Date() + 7, Sys.Date()+ 8, Sys.Date() + 9, Sys.Date() + 10
            ),
  content = content,
  group = c(1:12)),
  groups = data.frame(id = 1:12, content =content)
) %>%
  setGroups(data.frame(id = 1:2, content = content))


timevis(data = data.frame(
  start = c(Sys.Date(), Sys.Date(), Sys.Date(), Sys.Date(), Sys.Date(), 
            Sys.Date(), Sys.Date(), Sys.Date(), Sys.Date(), Sys.Date() +10,
            Sys.Date(), Sys.Date(), Sys.Date(), Sys.Date() ),
  content = c("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
              "eleven", "twelve", "thirteen", "fourteen"),
  group = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)),
  #groups = data.frame(id = 1:14, content = c("G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10",
  #                                           "G11", "G12", "G13", "G14"), order = 1:14),
  groups = data.frame(id = 1:14, content = c(paste0(rep("G_"),1:14)), order = 1:14),
  options = list(stack = TRUE)
) %>%
  setGroups(data.frame(id = 1:14, content = c("Group 1", "Group 2", "Group 3", "Group 4", "Group 5",
                                             "Group 6", "Group 7", "Group 8", "Group 9", "Group 10",
                                             "Group 11", "Group 12", "Group 13", "Group 14")))

groups = data.frame(id = 1:12, content = c(paste0(rep("G_"),1:12)), order = 1:12)

# ------------------------------------------------
# 2021.3.19 CLT test
# ------------------------------------------------

p <- rnorm(10000, 0, 1)
xp <- sample(1:10000, 10000, replace=TRUE)
x <- matrix(1:10000, nrow=1000)
s <- 1:1000
m <- 1:1000
for(i in 1:1000) {
  x[i,] <- sample(p, 10, replace=TRUE)
  s[i] <- sd(x[i,])
  m[i] <- mean(x[i,])
}

# ------------------------------------------------
# 2021.4.1 cumsum test
# ------------------------------------------------

cumsum(1:10)
cumsum(1:10)/(1:10)

sample(0:1, 10, replace=TRUE, prob=c(0.1, 0.9))

rbinom(10, 5, 0.5)
hist(rbinom(10000, 5, 0.5))
x <- (rbinom(10000, 5, 0.5))

s <- rep(0, 1000)
for(i in 1:1000) {
  s[i] <- sd(sample(x, 10, replace=TRUE))
}
hist(s)
abline(v=sd(x))
abline(v=mean(s)+sd(s), lty=2, col='red')


# ------------------------------------------------
# 2021.4.2 Power consumption simulation 
# ------------------------------------------------

mu <- 0.28
sig <- 0.01
p <- rnorm(10000, mean=mu, sd=sig)
hist(p)

abline(v=mu, col='red')
abline(v=mu-2*sig, col='red', lty=2)
abline(v=mu+2*sig, col='red', lty=2)

x <- sample(p, 5)
temp <- t.test(x)
mn <- mean(x)
sd <- sd(x)
min <- temp$conf.int[1]
max <- temp$conf.int[2]
abline(v=mn, col='blue')  
abline(v=min, col='blue', lty=2)
abline(v=max, col='blue', lty=2)

#abline(v=mn, col='green')  
#abline(v=mn-sd, col='green', lty=2)
#abline(v=mn+sd, col='green', lty=2)

# ssd: sample standard deviations
ssd <- 1:1000
for (i in 1:1000) {
  ssd[i] <- sd(sample(p, 5))  
}

hist(ssd, xlim=c(-0.01, 0.03))
ssd1 <- sample(ssd, 1)
temp <- t.test(ssd2, conf.level=0.95)
mn <- mean(ssd2)
sd <- sd(ssd2)
#min <- temp$conf.int[1]
#max <- temp$conf.int[2]
min <- temp$conf.int[1]
max <- temp$conf.int[2]

abline(v=mn, col='blue')  
abline(v=min, col='blue', lty=2)
abline(v=max, col='blue', lty=2)


#https://faculty.elgin.edu/dkernler/statistics/ch09/9-3.html
#http://ianmadd.github.io/pages/Confidence_Intervals_Part4.html

mu <- 0.28
sig <- 0.005
p <- rnorm(10000, mean=mu, sd=sig)
hist(p, xlim=c(0.2, 0.35))

x <- sample(p, 5)
mn <- mean(x)
ssd <- sd(x)
ssdmin <- sqrt(((5-1)*sd(x)^2)/qchisq(c(.025),df=4, lower.tail=FALSE))
ssdmax <- sqrt(((5-1)*sd(x)^2)/qchisq(c(.975),df=4, lower.tail=FALSE))
#abline(v=mn, col='blue')  
abline(v=mu+sig, col='blue')
abline(v=mu-sig, col='blue')
abline(v=mn-ssdmin, col='green', lty=2)
abline(v=mn+ssdmin, col='green', lty=2)
abline(v=mn-ssdmax, col='red', lty=2)
abline(v=mn+ssdmax, col='red', lty=2)


c(
  sqrt(((30-1)*12.2^2)/qchisq(c(.05),df=29, lower.tail=FALSE)),
  sqrt(((30-1)*12.2^2)/qchisq(c(.95),df=29, lower.tail=FALSE))
)

In the end, I can guess the population distribution from 5 samples as follows.

samples 0.2772259 0.2764031 0.2855117 0.2639254 0.2955608

population mean would be between 0.2651501 and 0.2943006
polulation sd would be between 0.007032906 and 0.03373114



# ------------------------------------------------
# 2021.4.14 t.test
# ------------------------------------------------

a <- rnorm(4, mean=0.5, sd=0.1)
b <- rnorm(8, mean=0.8, sd=0.3)
t.test(b, a)


a_pop <- rnorm(1000, 0.5, 0.1)
b_pop <- rnorm(1000, 0.8, 0.3)
hist(b_pop)
hist(a_pop, add=TRUE, col="red")
hist(b_pop-a_pop, add=TRUE, col="grey")
hist(b_pop)
hist(a_pop, add=TRUE, col="red")
hist(b_pop-a_pop, add=TRUE, col="grey", alpha=0.3)
hist(b_pop-a_pop, col="grey", alpha=0.3)

# ------------------------------------------------
# 2021.4.16 plot
# ------------------------------------------------
plot(x, col=rgb(0,1,1,0.5),type="b", lty=3, pch=19)
plot(x, col=rgb(0,1,1,0.5),type="b", lty=1, pch=19)
x <- rnorm(1000)
plot(x, col=rgb(0,1,1,0.5),type="b", lty=1, pch=19)
x1 <- rnorm(1000, sd=0.2)
points(x1, col=rgb(1, 1, 0, 0.2), type="b", lty=1, pch=17)


# ------------------------------------------------
# 2021.4.17 Sat put 2 ggplotly parallel
# ------------------------------------------------
library(ggplot2)
library(plotly)

df1 <-data.frame(x=1:10, y=1:10)
df2 <- data.frame(x=10:1, y=1:10)

p1<-ggplot(df1, aes(x, y)) +geom_point()
fig1<-ggplotly(p1)

p2<-ggplot(df2, aes(x, y)) +geom_line()
fig2<-ggplotly(p2)

subplot(fig1, fig2, nrows=2)

# ------------------------------------------------
# 2021.4.17 Sat t.test 
# ------------------------------------------------
hist(father.son$sheight, col=rgb(0, 1, 0, 0.5), xlab="son", ylab="father", main="son-father")
hist(father.son$fheight+10, col=rgb(0, 1, 1, 0.5), add=TRUE)

library(UsingR); data(father.son)

# ------------------------------------------------
# 2021.4.19 Mon two group testing
# ------------------------------------------------
https://github.com/bcaffo/courses/blob/master/06_StatisticalInference/09_HT/index.Rmd

library(datasets); data(ChickWeight); library(reshape2)
##define weight gain or loss
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")
library(dplyr)
wideCW <- mutate(wideCW,gain = time21 - time0)

wideCW14 <- subset(wideCW, Diet %in% c(1, 4))
t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)

a <- subset(wideCW14$Diet, Diet==1)
b <- subset(wideCW14$Diet, Diet==4)
t.test(a$gain, b$gain, paired=FALSE, var.equal=TRUE)
t.test(a$gain, b$gain, paired=FALSE, var.equal=FALSE)

# ------------------------------------------------
# 2021.4.21 spread()
# ------------------------------------------------
library(reshape2)
library(tidyr)

patient <- rep(c("A", "B"), 4)
cell_population <- rep(c("T", "NK"), each  = 4)
receptor <- rep(c("PD-1", "Fas"), each = 2, times = 2)
value <- runif(8)
df <- data.frame(patient, cell_population, receptor, value)
df %>% spread(cell_population, value)

# ------------------------------------------------
# 2021.4.21 change only one bar in ggplot
# ------------------------------------------------

library(ggplot2)
area <- c("Północ", "Południe", "Wschód", "Zachód")
sale <- c(16.5, 13.5, 14, 13)
df.sale <- data.frame(area, sale)
colnames(df.sale) <- c("Obszar sprzedaży", "Liczba sprzedanych produktów (w tys.)")

area.color <- c(NA, "withcolor", NA, NA)
plot.sale.bad <- ggplot(data=df.sale, aes(x=area, y=sale, fill=area.color)) +
  geom_bar(stat="identity") +
  xlab(colnames(df.sale)[1]) +
  ylab(colnames(df.sale)[2]) +
  ggtitle("Porównanie sprzedaży") 
plot.sale.bad

# ------------------------------------------------
# 2021.4.25 connecting to mongoDB
# https://jeroen.github.io/mongolite/connecting-to-mongodb.html
# ------------------------------------------------

library(mongolite)

m <- mongo("SpiralNotebib", url = "mongodb://localhost:27017/practice")
m$count('{}')
alldata <- m$find('{}')
DT::datatable(
  alldata,
  options = list(
    columnDefs = list(list(
      targets = 2,   # Target column of the table
      render = DT::JS("$.fn.dataTable.render.ellipsis( 3)")))   # Number of characters to show
  ),
  plugins = "ellipsis")

DT::datatable(
  alldata,
  options = list(
    columnDefs = list(list(
      targets = 4,   # Target column of the table
      render = DT::JS("$.fn.dataTable.render.ellipsis( 3)")))   # Number of characters to show
  ),
  plugins = "ellipsis")


DT::datatable(
  alldata)


# ------------------------------------------------
# 2021.4.25 bar chart
# ------------------------------------------------

set.seed(5)
x <- cumsum(rnorm(50))

## Create a vector of colors selected based on whether x is <0 or >0  
## (FALSE + 1 -> 1 -> "blue";    TRUE + 1 -> 2 -> "red")
cols <- c("blue", "red")[(x > 0) + 1]  

## Pass the colors in to barplot()   
barplot(x, col = cols)


library(ggplot2)
ggplot(data.frame(x), aes(x= seq_along(x), y = x)) + 
  geom_bar(stat = 'identity', aes(fill = x>0), position = 'dodge', col = 'transparent') + 
  theme_bw() + scale_fill_discrete(guide = 'none') + 
  labs(x = '', y = 'NAO Index')


library(ggplot2)
ggplot(data.frame(x), aes(x= seq_along(x), y = x)) + 
  geom_bar(stat = 'identity', aes(fill = ifelse(x==x[46], "black", "red") ), position = 'dodge', col = 'transparent') + 
  theme_bw() + scale_fill_discrete(guide = 'none') + 
  labs(x = '', y = 'NAO Index') 

library(ggplot2)

ggplot(data.frame(x), aes(x= seq_along(x), y = x)) + 
  geom_bar(stat = 'identity', aes(fill=as.character(x)), position = 'dodge', col = 'transparent') + 
  theme_bw() +
  labs(x = '', y = 'NAO Index') +
  scale_fill_manual(values=ifelse(x==x[46], "red", "lightpink")) +
  theme(legend.position = "none")
  
  

# ------------------------------------------------
# 2021.5.3 Monday Visjs Network for R
# https://datastorm-open.github.io/visNetwork/
# ------------------------------------------------
install.packages("visNetwork")
require(visNetwork, quietly = TRUE)
# minimal example
nodes <- data.frame(id=1:3, 
                    label=c("Apple", "Banana", "Orange"), 
                    #value=c(10, 10, 10), 
                    shape=c("circle", "database", "box"),
                    color=c("lightgrey", "lightgrey", "skyblue"),
                    group=c("A", "A", "B"),
                    title=c("Node1", "<b>Node2</b>", "Node3"),
                    shadow=c("TRUE", "FALSE", "TRUE"))

edges <- data.frame(from = c(1,2), to = c(1,3), 
                    label=c("Idle", "Transition"),
                    arrows='to, from')
visNetwork(nodes, edges, width = "100%")


nodes <- data.frame(id = 1:10,
                    
                    # add labels on nodes
                    label = paste("Node", 1:10),
                    
                    # add groups on nodes 
                    group = c("GrA", "GrB"),
                    
                    # size adding value
                    value = 1:10,          
                    
                    # control shape of nodes
                    shape = c("square", "triangle", "box", "circle", "dot", "star",
                              "ellipse", "database", "text", "diamond"),
                    
                    # tooltip (html or character), when the mouse is above
                    title = paste0("<p><b>", 1:10,"</b><br>Node !</p>"),
                    
                    # color
                    color = c("darkred", "grey", "orange", "darkblue", "purple"),
                    
                    # shadow
                    shadow = c(FALSE, TRUE, FALSE, TRUE, TRUE))             
head(nodes)
edges <- data.frame(from = c(1,2,5,7,8,10), to = c(9,3,1,6,4,7))
visNetwork(nodes, edges, height = "500px", width = "100%")

nodes <- data.frame(id=1:3, 
                     label=c("Apple", "Banana", "Orange"), 
                     #value=c(10, 10, 10), 
                     shape=c("circle", "database", "box"),
                     color=c("lightgrey", "lightgrey", "skyblue"),
                     group=c("A", "A", "B"),
                     title=c("Node1", "<b>Node2</b>", "Node3"),
                     shadow=c("TRUE", "FALSE", "TRUE"))

edges <- data.frame(from = c(1,2), to = c(1,3), 
                    label=c("Idle", "Transition"),
                    arrows='to, from')
visNetwork(nodes, edges, width = "100%")


nodes <- data.frame(id = 1:27,
            label = c("LoginModal.js", "Logout.js", "RegisterModal.js", 
                      "AppNavbar.js", "ItemModal.js", "ShoppingList.js", 
                      "authActions.js", "errorActions.js", "itemActions.js", "types.js", 
                      "authReducer.js", "errorReducer.js", "itemReducer.js", "index.js",
                      "store.js",
                      "App.js", "index.js", "index.html", "App.css",
                      "react", "react-transition-group", 
                      "redux", "redux-thunk", "reducers",
                      "prop-types", "Navlink", "axios"),
            color = c("lightgrey", "lightgrey", "lightgrey", 
                      "lightgrey", "lightgrey", "lightgrey", 
                      "grey", "grey", "grey", "grey", 
                      "grey", "grey", "grey", "grey", 
                      "grey", 
                      "white", "white","white","white",
                      "skyblue", "skyblue", 
                      "skyblue", "skyblue", "skyblue", 
                      "skyblue", "skyblue", "skyblue"),
            shape = c(rep("circle", 18), rep("box", 9)))
edges <- data.frame(from=c(1,2,3,4,5,6,7,7,7,7,8,8,8,9,9,10,10,10,10,10,11,12,13,16,17,19,20,20,20,20,20,20,20,20,22,22,22,22,22,22,22,22,22,23,24,25,25,25,25,25,25,21), 
                    to=c(4,4,4,16,16,16,1,2,3,16,7,9,1,5,6,9,8,11,12,13,14,14,14,17,18,16,1,2,3,4,5,6,16,17,1,2,3,4,5,6,14,15,16,15,15,1,2,3,4,5,6,6),
                    arrows='to',
                    length=(rep(300, 52)))
visNetwork(nodes, edges, width = "100%")


# ------------------------------------------------
# 2021.5.3 Monday adding another y axis on a ggplot
# https://ggplot2.tidyverse.org/reference/sec_axis.html
# ------------------------------------------------

p + scale_y_continuous(sec.axis = sec_axis(~ . + 10)) # add 10 on the left hand scale.


# ------------------------------------------------
# 2021.5.3 Monday CO2 emission estimation of an inkjet printer per year
# ------------------------------------------------

# cf. https://www.epa.gov/energy/greenhouse-gases-equivalencies-calculator-calculations-and-references
pc_print = 230pc_sleep = 15pc_off = 0.33
t_print = 5/(24*60)   # minutes to print per day
t_sleep = 60/(24*60)  # minutes to sleep per day
t_off = 1-(t_print+t_sleep) # minutes to off per day
print(round(c(t_print, t_sleep, t_off),3) * 100)

pc_day = pc_print*t_print + pc_sleep*t_sleep + pc_off*t_off  # power consumption per day
cat("Power consumption rate per day : (print, sleep, off) = ", 
    round(pc_print*t_print/pc_day, 2), 
    round(pc_sleep*t_sleep/pc_day, 2), 
    round(pc_off*t_off/pc_day,2) )
pc_year = 365 * pc_day
CO2 = pc_year * 0.42
#print(round(CO2, 2))
#cat("Power consumption per printer: ", pc_year, "[W]", sep="")
#cat("CO2 emission per printer is about ", CO2, "[kg]", sep="")

# EPA says you can calculate CO2 from power consumptions by the following formula
# 7.09 × 10-4 metric tons CO2/kWh, 

CO2 = 7.09E-4 * (pc_year*10E-3)  # unit is tons
T_CO2 = 7.09E-4 * (pc_year*10E-3) * 15000000
cat("CO2 emission of all our printer is about ", T_CO2, "[tons/year]", sep="")

# EPA also says a passenger car spew 4.60 metric tons CO2E/vehicle /year
car = 4.6 # [tons/year/car]
cat("Our CO2 emission is equivalent to the following number of cars: ", round(T_CO2/car,0), "[cars/year]", sep="")


cat("If we decrease off power by 1/3, that would be equivalent to the following number of cars: ", round(T_CO2/car * pc_off*t_off/pc_day * 1/3, 0),  "[cars/year]", sep="")
 ------------------------------------------------
# 2021.5.14 Coursera Statistical Inference W4 13 02 Bootstrapping example
# 1'58" 
# ------------------------------------------------
library(UsingR)
data("father.son")
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x, n * B, replace=TRUE), B, n)
resampleMedians <- apply(resamples, 1, median)

# ------------------------------------------------
# 2021.5.14 Book, an introduction of the Bootstrap
# P.11
# ------------------------------------------------

x <- c(94,197,16,38,99,141,23)
y <- c(52,104,146,10,51,30,40,27,46)

t.test(x, y)

# ------------------------------------------------
# 2021.5.15 Coursera Statistical inference, Week4, 13 04 Permutation tests
# ------------------------------------------------

subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"), ]
y <- subdata$count
group <- as.character((subdata$spray))
testStat <- function(w, g) {mean(w[g=="B"]) - mean(w[g=="C"])}
observedStat <- testStat(y, group)
permutations <- sapply(1:10000, function(i) testStat(y, sample(group)))
observedStat

# ------------------------------------------------
# 2021.5.22 Test tidyjson
# ------------------------------------------------

#install.packages("tidyjson")
library(tidyjson)
library(dplyr)

# Define a simple people JSON collection
people <- c('{"age": 32, "name": {"first": "Bob",   "last": "Smith"}}',
            '{"age": 54, "name": {"first": "Susan", "last": "Doe"}}',
            '{"age": 18, "name": {"first": "Ann",   "last": "Jones"}}')

# Tidy the JSON data
people %>% spread_all

worldbank %>% str
worldbank %>% spread_all
worldbank %>% enter_object(majorsector_percent) %>% gather_array %>% spread_all

library(mongolite)

m <- mongo("IT", url = "mongodb://localhost:27017/practice")
m$count('{}')
alldata <- m$find('{}')
DT::datatable(
  alldata)

x <- m$export()
x %>% spread_all

write.csv(alldata, "alldata.csv", fileEncoding = "UTF-8")

# c.f. https://github.com/rstudio/DT/pull/606
# data <- tibble::rownames_to_column(tibble::as_tibble(mtcars))

# https://community.rstudio.com/t/centering-columns-and-removing-some-columns-simultaneously-in-dt-shiny-r/23673/2
# https://rstudio.github.io/DT/functions.html

#---------- bwords ---------- 
DT::datatable(
  alldata,
  escape=FALSE,
  filter='top',
  extensions = c('Select', 'Buttons'),
  fillContainer = TRUE,
  style='default',
  options = list(
    select = list(style='os', items='row'),
    dom = 'Blfrtip',
    rowID=0,
    buttons = c('selectAll', 'selectNone', 'selectRows', 'selectColumns', 'selectCells'),
    autoWidth=TRUE,
    pageLength=50,
    cautoFill=TRUE,
    scrollX=TRUE,
    scrollY=TRUE,
    scrollCollapse=TRUE,
    columnDefs = list(
      list(targets=2, width='200px')
      #list(targets=c(2,4), width='500px')
    ),
    filter='top',
    caption = 'xxx'
  )
#) %>% DT::formatStyle(columns = colnames(.), fontSize = '50%')
#) %>% DT::formatStyle(columns = c(1:6), fontSize = '80%', fontWeight='bold')
#) %>% DT::formatStyle(columns = 4, fontSize ='120%', fontWeight='bold')
) %>% DT::formatStyle('remember', fontSize ='100%', fontWeight='bold')
#) %>% DT::formatStyle('data', fontSize ='100%', fontWeight='bold')
# 妙に短くなってしまうところだけを幅指定する　例）日付、本のタイトル 


m = matrix(c(
  '<b>Bold</b>', '<em>Emphasize</em>', '<a href="http://rstudio.com">RStudio</a>',
  '<a href="#" onclick="alert(\'Hello World\');">Hello</a>'
), 2)
colnames(m) = c('<span style="color:red">Column 1</span>', '<em>Column 2</em>')
datatable(m)  # escape = TRUE by default
DT::datatable(alldata, escape = TRUE)
シングルクォーテーションで囲んで上でescape=TRUEとする

# ------------------------------------------------
# 2021.6.15 Vaccine adverse effects data by CDC
# ------------------------------------------------

setwd("/Users/keijiharada/Downloads")

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
v <- read.csv("adverseEffect-jp.csv",fileEncoding = "utf-8")
vp <- v[49:304,]
vm <- v[305:dim(v)[1], ]
#sort_severity_vp <- c("lightr", "pink", "red", "darkred");
sort_severity_vp <- c("#FFCCFF", "#FF99FF", "#FF33FF", "#FF00FF");
sort_severity_vm <- c("#FFCCFF", "#FF99FF", "#FF33FF");
#http://www.sthda.com/english/wiki/colors-in-r
vp1 <- mutate(vp, rate = round(persons/N*100, 1))
vm1 <- mutate(vm, rate = round(persons/N*100, 1))
theme_set(theme_classic(base_size = 18, base_family = "HiraKakuProN-W3"))
theme_replace(panel.grid.minor = element_line(colour = "black"))
#https://github.com/slowkow/ggrepel/issues/87
#http://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles
g <- ggplot(vp1, aes(x=symptons, y=rate, fill=as.factor(severity)))
#p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(vaccine~age.group)
p <- p + xlab("症状") + ylab("割合") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vp) 
#https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/
p <- p + labs(title = "副作用の発生割合", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
p

vp1_1 <- subset(vp1, dose==1)
g <- ggplot(vp1_1, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(age.group~vaccine)
p <- p + xlab("症状") + ylab("%(約1,800人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity) 
p <- p + theme(legend.position = "left")
#https://www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/
# p <- p + theme(
#   #panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1", = 2, linetype = "solid"),
#   panel.grid.major = element_line(size = 0.5, linetype = 'dot',colour = "lightgrey") 
#   #panel.grid.minor = element_line(size = 0.25, linetype = 'dot',colour = "black")
# )
# #https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/
p <- p + labs(title = "副作用の発生割合(接種1回目、米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
#ggplotly(p, dynamicTicks = TRUE)
#ggplotly(p, dynamicTicks = FALSE) %>% layout(legend = list(orientation = "h"))
p

vp1_2 <- subset(vp1, dose==2)
g <- ggplot(vp1_2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(age.group~vaccine)
p <- p + xlab("症状") + ylab("%(約1,800人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity) 
p <- p + theme(legend.position = "left")
#https://www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/
# p <- p + theme(
#   #panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1", = 2, linetype = "solid"),
#   panel.grid.major = element_line(size = 0.5, linetype = 'dot',colour = "lightgrey") 
#   #panel.grid.minor = element_line(size = 0.25, linetype = 'dot',colour = "black")
# )
# #https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/
p <- p + labs(title = "副作用の発生割合(接種2回目、米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
#ggplotly(p, dynamicTicks = TRUE)
#ggplotly(p, dynamicTicks = FALSE) %>% layout(legend = list(orientation = "h"))



vp2 <- subset(vp1, vaccine=="ファイザー")
g <- ggplot(vp2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(dose~age.group)
p <- p + xlab("症状") + ylab("発生割合(約1,800人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vp) 
p <- p + theme(legend.position = "left")
#https://www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/
p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "lightgrey")) 
# #https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/
p <- p + labs(title = "副作用の発生割合(米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
#ggplotly(p, dynamicTicks = TRUE)
#ggplotly(p, dynamicTicks = FALSE) %>% layout(legend = list(orientation = "h"))
p


vm2 <- subset(vm1, vaccine=="モデルナ")
g <- ggplot(vm2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(dose~age.group)
p <- p + xlab("症状") + ylab("発生割合(約10,000人中)") 
#p <- p + ylim(0, 100)
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vm) 
p <- p + theme(legend.position = "left")
#               panel.grid.minor = element_line(colour="lightgrey",size=0.5))
p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "black"))
p <- p + theme(panel.grid.minor = element_line(size = 0.5, linetype =1,colour = "lightgrey"))
#https://www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/
#p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "lightgrey")) 
#p <- p + scale_y_continuous(minor_breaks = seq(0, 100, 20), limits=c(0, 100))
#https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/
#p <- ylim(0, 100)
p <- p + labs(title = "副作用の発生割合(米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
#ggplotly(p, dynamicTicks = TRUE)
#ggplotly(p, dynamicTicks = FALSE) %>% layout(legend = list(orientation = "h"))
p

# ------------------------------------------------
# 2021.6.25 Vaccine adverse effects data by CDC
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
v <- read.csv("adverseEffect-jp.csv",fileEncoding = "utf-8")
vp <- v[49:304,]
#vp <- v[c(49:304, 437:500),]
vm <- v[305:dim(v)[1], ]
sort_severity_vp <- c("#FFCCFF", "#FF99FF", "#FF33FF", "#FF00FF");
sort_severity_vm <- c("#FFCCFF", "#FF99FF", "#FF33FF");
vp1 <- mutate(vp, rate = round(persons/N*100, 1))
vm1 <- mutate(vm, rate = round(persons/N*100, 1))
theme_set(theme_classic(base_size = 18, base_family = "HiraKakuProN-W3"))
theme_replace(panel.grid.minor = element_line(colour = "black"))




vp2 <- subset(vp1, vaccine=="ファイザー")
g <- ggplot(vp2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(dose~age.group)
p <- p + xlab("症状") + ylab("発生割合(約1,800人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vp) 
p <- p + theme(legend.position = "left")
p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "black"))
p <- p + theme(panel.grid.minor = element_line(size = 0.5, linetype =1,colour = "lightgrey"))
p <- p + scale_y_continuous(breaks = seq(0, 100, 20), limits=c(0, 100))
p <- p + labs(title = "副作用の発生割合(米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
p

vm2 <- subset(vm1, vaccine=="モデルナ")
g <- ggplot(vm2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(dose~age.group)
p <- p + xlab("症状") + ylab("発生割合(約10,000人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vm) 
p <- p + theme(legend.position = "left")
p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "black"))
p <- p + theme(panel.grid.minor = element_line(size = 0.5, linetype =1,colour = "lightgrey"))
p <- p + scale_y_continuous(breaks = seq(0, 100, 20), limits=c(0, 100))
p <- p + labs(title = "副作用の発生割合(米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/moderna/reactogenicity.html")
p


# 2021.8.4 子供のデータ追加
# setwd("/Users/keijiharada/Downloads")
# vp_child <- v[437:dim(v)[1], ]
# vp3 <- rbind(vp, vp_child)
# sort_severity_vp <- c("#FFCCFF", "#FF99FF", "#FF33FF", "#FF00FF");
# sort_severity_vm <- c("#FFCCFF", "#FF99FF", "#FF33FF");
# vp4 <- mutate(vp3, rate = round(persons/N*100, 1))
# theme_set(theme_classic(base_size = 18, base_family = "HiraKakuProN-W3"))
# theme_replace(panel.grid.minor = element_line(colour = "black"))

vp <- v[c(49:304, 437:500),]
vp1 <- mutate(vp, rate = round(persons/N*100, 1))

vp2 <- subset(vp1, vaccine=="ファイザー")
g <- ggplot(vp2, aes(x=symptons, y=rate, fill=as.factor(severity)))
p <- g + geom_bar(stat="identity", position=position_dodge())
p <- g + geom_bar(stat="identity")
p <- p + facet_grid(dose~age.group)
p <- p + xlab("症状") + ylab("発生割合(1100-1800人中)") 
p <- p + labs(fill="程度")
p <- p + scale_fill_manual(values=sort_severity_vp) 
p <- p + theme(legend.position = "left")
p <- p + theme(panel.grid.major = element_line(size = 0.5, linetype =1,colour = "black"))
p <- p + theme(panel.grid.minor = element_line(size = 0.5, linetype =1,colour = "lightgrey"))
p <- p + scale_y_continuous(breaks = seq(0, 100, 20), limits=c(0, 100))
p <- p + theme(axis.text.x = element_text(angle = 45, hjust=1, size=10))
p <- p + labs(title = "副作用の発生割合(米CDC調査)", 
              subtitle="データ：米CDC(疾病対策予防センター)",
              caption = "https://www.cdc.gov/vaccines/covid-19/info-by-product/pfizer/reactogenicity.html")
p


# ------------------------------------------------
# 2021.7.3 Play with InsectSprays
# ------------------------------------------------

boxplot(count~spray, x)

as.Date("1968.9.4", "%Y.%m.%d")
dob <- as.POSIXct("1968-9-4")
as.POSIXct(strptime("2011-03-27 01:30:00", "%Y-%m-%d %H:%M:%S"))
# First, there are two internal implementations of date/time: POSIXct , which stores seconds since UNIX epoch (+some other data), and POSIXlt , which stores a list of day, month, year, hour, minute, second, etc. strptime is a function to directly convert character vectors (of a variety of formats) to POSIXlt format.

# ------------------------------------------------
# 2021.7.22 QCIII
# ------------------------------------------------
# P.73
# F分布
a <- c(42,44.4,41.8,43.2,41.7,42.5,43,41.1, 40.9, 43.6,42.1)
b <- c(43,41.8,40.5,42.2,42.6,40.8,41.3,43.1,41.4,43.7,43.3)
n <- length(a)
var(a)
var(b)
pf(var(b)/var(a), n-1, n-1)
hist(rf(10000, 10, 10), xlim=c(0, 5), breaks=100)
abline(v=var(b)/var(a), col="red", lty=3)

# P.77
# 等分散　分散には違いはないが平均値に違いがあるケース
# 平均値としては、t=2.33であり同じ分布からとったサンプルにおいて
# 平均値にこれほどの差が生じる確率は3.4%しかない
a <- c(12.4, 12.3, 11.8, 12.1, 12.2, 12.1, 11.9, 12.5, 12.4)
b <- c(11.9, 12, 11.8, 11.8, 12, 12.3, 11.7, 12.2, 11.9, 12)
par(mfrow=c(1,2))
boxplot(a, b)
m = length(a)
n = length(b)
t.test(a, b) # t値と信頼区間を見る
mean(a) - mean(b)
var(a)
var(b)
pf(var(a)/var(b), m-1, n-1) # 0.025以下もしくは0.975以上の場合は標準偏差に有意差有りと判断
hist(rf(10000, m-1, n-1), xlim=c(0, 5), breaks=100)
abline(v=var(a)/var(b), col="red", lty=3)

# P.80
# 母平均の差
a <- c(8,4.6,8.5,2.8,3.2,1.8,2.4,3.6,.7,2.8)
b <- c(3.7,1.5,2.1,.6,2,.8,.3,4.2,1.3,1.6)
par(mfrow=c(1,2))
boxplot(a, b)
m = length(a)
n = length(b)
t.test(a, b, paired=TRUE) # t値と信頼区間を見る
mean(a) - mean(b)
var(a)
var(b)
pf(var(a)/var(b), m-1, n-1) # 0.025以下もしくは0.975以上の場合は標準偏差に有意差有りと判断
hist(rf(10000, m-1, n-1), xlim=c(0, 5), breaks=100)
abline(v=var(a)/var(b), col="red", lty=3)

# P.89
# はんだ付け強度
a <- c(3.66, 2.28, 2.84,3.76,2.52, 3.54, 2.16, 2.54, 3.28, 3.52)
b <- c(4.48, 2.76, 3.44,4.34,2.36, 4.28, 2.72, 3.24, 3.06, 4.26)
par(mfrow=c(1,2))
boxplot(a, b)
m = length(a)
n = length(b)
t.test(a, b, paired=TRUE) # t値と信頼区間を見る
mean(a) - mean(b)
var(a)
var(b)
pf(var(b)/var(a), n-1, m-1) # 0.025以下もしくは0.975以上の場合は標準偏差に有意差有りと判断
hist(rf(10000, n-1, m-1), xlim=c(0, 5), breaks=100)
abline(v=var(b)/var(a), col="red", lty=3)
par(mfrow=c(1,1))
plot(a, ylim=c(0, 7), pch=19, col=rgb(1,0,0,0.15), type="b")
points(b, pch=19, col=rgb(0,1,0,0.15), type="b")
#legend(x=8.5,y=6.5, legend="b", col=rgb(0,1,0), lty=1)
#legend(x=8.5,y=5.5, legend="a", col=rgb(1,0,0), lty=1)
#legend("topright", inset=c(-0.2,0), legend=c("a","b"), pch=c(19,19), title="fillet lengths")
legend("topright", legend=c("a","b"), pch=c(19,19), col=c(rgb(1,0,0,0.15), rgb(0,1,0,0.15)), title="fillet lengths")

# P.92
# 鋼材の引張強度に関する検定、推定
ma = 53
mb = 50
sa = 5
sb = 8
na = 10
nb = 10

sim_a <- rnorm(1000, mean=ma, sd=sa)
sim_b <- rnorm(1000, mean=mb, sd=sb)

t.test(sim_a, sim_b)
sim_var_rate <- rf(1000, nb-1, na-1)
pf(sb^2/sa^2, nb-1, na-1)

par(mfrow=c(2, 1))
hist(sim_a, col=rgb(1,0,0,1), breaks=100)
hist(sim_b, col=rgb(0,1,0,1), add=TRUE, breaks=100)

hist(sim_var_rate, breaks=100, main="F distribution")
abline(v=sb^2/sa^2, col="red", lty=3)
legend("topright", legend="df1=9, df2=9")

# サンプルを母集団と仮定して計算してしまったのが間違い。
# ではどうすればよかったか？
# データはないが、ｎと統計値（平均、標準偏差）だけある場合のサンプル
# に対する検定と推定

# P.97
# サンプル中に含まれる不良数が５以上であれば正規分布に近似して良い

par(mfrow=c(1,3))
hist(rbinom(10000, 10, 0.2), main="NG=2")
hist(rbinom(10000, 10, 0.5), main="NG=5")
hist(rbinom(10000, 10, 0.7), main="NG=7")

par(mfrow=c(1,1))
hist(rbinom(10000, 10, 0.5), main="NG=5")
abline(v=10*0.5, col=rgb(1,0,0,1), lty=3)
abline(v=10*0.5 - 3*sqrt(10*0.5*0.5), col=rgb(0,1,0,1), lty=3)
abline(v=10*0.5 + 3*sqrt(10*0.5*0.5), col=rgb(0,1,0,1), lty=3)


# 不良数は二項分布、欠点数はポワソン。ただし、5以上ならば正規分布に近似してよい

par(mfrow=c(1,3))
hist(rpois(10000, 2), main="NG=2")
hist(rpois(10000, 5), main="NG=5")
hist(rpois(10000, 7), main="NG=7")

par(mfrow=c(1,1))
hist(rpois(10000, 5), main="NG=5")
abline(v=10*0.5, col=rgb(1,0,0,1), lty=3)
abline(v=10*0.5 - 3*sqrt(10*0.5*0.5), col=rgb(0,1,0,1), lty=3)
abline(v=10*0.5 + 3*sqrt(10*0.5*0.5), col=rgb(0,1,0,1), lty=3)

# P.98
# 母不良率に関する検定、推定
p = 0.05
n = 300
lambda = p*n
hist(rpois(1000, lambda))
abline(v=6, col="red")
ppois(6, lambda)

hist(rbinom(1000, n, p))
abline(v=6, col="blue")
pbinom(6, n, p)

p2 = 6/300
var = p2 * (1 - p2)
se = sqrt(var/n)
mn = p2

ci = mn + c(-1, 1)*1.96*se
ci

# P.102
# 母不良率の差に関する検定、推定

sa = 300
na = 7
pa = 7/300
va = pa * (1-pa) * sa
la = pa * 100
a = rpois(1000, la)

sb = 400
nb = 23
pb = 23/400
vb = pb * (1-pb) * sb
lb = pb * 100
b = rpois(1000, lb)

# F分布は正規分布ではないので適用できない？
par(mfrow=c(1,1))
x <- rf(1000, 399, 299)
hist(x, col=rgb(0,0,1,0.15), breaks=10, xlim=c(0, 3))
pf(vb/va, sb-1, sa-1)

# Poisson分布
par(mfrow=c(2,1))

hist(a, col=rgb(1,0,0,0.15), breaks=10, xlim=c(0, 15))
abline(v=lb, lty=3, col="red")
ppois(lb, la)

hist(b, col=rgb(0,1,0,0.15), breaks=10, xlim=c(0, 15))
abline(v=la, lty=3, col="red")
ppois(la, lb)

# Binomil、二項分布 
par(mfrow=c(2,1))

set.seed(20210728)

# N=300
mina = qbinom(0.025, 300, pa)
maxa = qbinom(0.975, 300, pa)
a = rbinom(1000, sa, pa)
hist(a, col=rgb(1,0,0,0.15), breaks=10, xlim=c(0, 50), ylim=c(0,400), main="N=300")
abline(v=mina, lty=3, col="red");text(x=mina, y=200, label=mina, cex=0.7)
abline(v=maxa, lty=3, col="red");text(x=maxa, y=200, label=maxa, cex=0.7)

minb = qbinom(0.025, 300, pb)
maxb = qbinom(0.975, 300, pb)
b = rbinom(1000, sa, pb)
hist(b, col=rgb(0,0,1,0.15), breaks=10, xlim=c(0, 50), ylim=c(0,400), add=TRUE)
abline(v=minb, lty=3, col="blue");text(x=minb, y=200, label=minb, cex=0.7)
abline(v=maxb, lty=3, col="blue");text(x=maxb, y=200, label=maxb, cex=0.7)

# N=400
mina = qbinom(0.025, 400, pa)
maxa = qbinom(0.975, 400, pa)
a = rbinom(1000, sb, pa)
hist(a, col=rgb(1,0,0,0.15), breaks=10, xlim=c(0, 50), ylim=c(0,400), main="N=400")
abline(v=mina, lty=3, col="red");text(x=mina, y=200, label=mina, cex=0.7)
abline(v=maxa, lty=3, col="red");text(x=maxa, y=200, label=maxa, cex=0.7)

minb = qbinom(0.025, 400, pb)
maxb = qbinom(0.975, 400, pb)
b = rbinom(1000, sb, pb)
hist(b, col=rgb(0,0,1,0.15), breaks=10, xlim=c(0, 50), ylim=c(0,400), add=TRUE)
abline(v=minb, lty=3, col="blue");text(x=minb, y=200, label=minb, cex=0.7)
abline(v=maxb, lty=3, col="blue");text(x=maxb, y=200, label=maxb, cex=0.7)

# 差の区間推定として考える

# P.106
# 母欠点数に関する検定・推定
# 母集団の欠点数と比べてこれと異なると言えるかどうか

set.seed(20210729)
lambda = 7.6
hist(rpois(10000, lambda))
abline(v=3)
ppois(3, 7.6)

lambda = 7.6 * 3
hist(rpois(10000, lambda))
abline(v=9)
ppois(9, 7.6 * 3)

lambda = 9/3
hist(rpois(10000, lambda))
abline(v = qpois(0.025, 9/3))
abline(v = qpois(0.975, 9/3))

# P.109
# 母欠点数の差に関する検定、推定

la = 38
lb = 22

hist(rpois(10000, la), xlim=c(5, 60), ylim=c(0, 4000))
abline(v = qpois(0.025, la), col="red")
text(x=qpois(0.025, la), y=1500, label=qpois(0.025, la), cex=0.7)
hist(rpois(10000, lb), xlim=c(5, 60), ylim=c(0, 4000))
abline(v = qpois(0.975, lb), col="blue")
text(x=qpois(0.975, lb), y=1500, label=qpois(0.975, lb), cex=0.7)

hist(rpois(10000, la-lb), xlim=c(5, 60), ylim=c(0, 4000))
abline(v = qpois(0.025, la-lb))
abline(v = qpois(0.975, la-lb))
text(x=qpois(0.025, la-lb), y=1500, label=qpois(0.025, la-lb), cex=0.7)
text(x=qpois(0.975, la-lb), y=1500, label=qpois(0.975, la-lb), cex=0.7)


x <- rbinom(10000, 100, 0.02)
hist(x)
hist(x, breaks=seq(0, 8, length.out=10))
seq(0, 8, length.out=10)
abline(v = qbinom(0.025, 100, 0.02))
abline(v = qbinom(0.975, 100, 0.02))


# p.117
# 二項確率紙による母不良率に関する検定
# ポワソン分布
hist(rpois(1000, 10))
lb = 80*0.05  # 4個
ppois(lb, 10)   
  # 平均10個に対して4個になる確率
  # 0.029 --> 2.9%、有意差なし
abline(v=lb, col="red")

qbinom(0.025, 80, 0.125) 
qbinom(0.975, 80, 0.125)
  # サンプル80個の中から10個の不良が発生する場合、
  # 信頼区間95%では5 ~ 16個の不良が発生する
　# 80で割ると6.25%〜20%になる
  # 5%はこれよりも低いため、5%とは異なると言える


# p.120
# 二組の不良率の差の検定

sa = 50; pa = 41; fa = 9; 
sb = 60; pb = 57; fb = 3;

mina <- qbinom(0.025, sa, fa/sa)
maxa <- qbinom(0.975, sa, fa/sa)
cia <- c(mina, maxa)
cia; cia/sa
# [1]  4 15
# [1] 0.08 0.30
minb <- qbinom(0.025, sb, fb/sb)
maxb <- qbinom(0.975, sb, fb/sb)
cib <- c(minb, maxb)
cib; cib/sb
# [1] 0 7
# [1] 0.0000000 0.1166667

# つまり95%信頼区間においてAは8~30%、Bは0~12%の不良率を持っている
# したがって、重なる部分があるため有意差があるとは言えない。

# p.122
# みかんの等級の割合に差があるかどうか
a1=95; a2=63; a3=42; a = a1+a2+a3
b1=64; b2=46; b3=40; b = b1+b2+b3
c1=21; c2=38; c3=61; c = c1+c2+c3

p1 <- matrix(1:6, nrow=3)
p1[1,]<- c(qbinom(0.025,a,a1/a)/a, qbinom(0.975,a,a1/a)/a)
p1[2,]<- c(qbinom(0.025,b,b1/b)/b, qbinom(0.975,b,b1/b)/b)
p1[3,]<- c(qbinom(0.025,c,c1/c)/c, qbinom(0.975,c,c1/c)/c)
p1

p2 <- matrix(1:6, nrow=3)
p2[1,]<- c(qbinom(0.025,a,a2/a)/a, qbinom(0.975,a,a2/a)/a)
p2[2,]<- c(qbinom(0.025,b,b2/b)/b, qbinom(0.975,b,b2/b)/b)
p2[3,]<- c(qbinom(0.025,c,c2/c)/c, qbinom(0.975,c,c2/c)/c)
p2

p3 <- matrix(1:6, nrow=3)
p3[1,]<- c(qbinom(0.025,a,a3/a)/a, qbinom(0.975,a,a3/a)/a)
p3[2,]<- c(qbinom(0.025,b,b3/b)/b, qbinom(0.975,b,b3/b)/b)
p3[3,]<- c(qbinom(0.025,c,c3/c)/c, qbinom(0.975,c,c3/c)/c)
p3

round(p1, 2)
round(p2, 2)
round(p3, 2)


n1 <- matrix(1:6, nrow=3)
n1[1,]<- c(qbinom(0.025,a,a1/a), qbinom(0.975,a,a1/a))
n1[2,]<- c(qbinom(0.025,b,b1/b), qbinom(0.975,b,b1/b))
n1[3,]<- c(qbinom(0.025,c,c1/c), qbinom(0.975,c,c1/c))
n1

n2 <- matrix(1:6, nrow=3)
n2[1,]<- c(qbinom(0.025,a,a2/a), qbinom(0.975,a,a2/a))
n2[2,]<- c(qbinom(0.025,b,b2/b), qbinom(0.975,b,b2/b))
n2[3,]<- c(qbinom(0.025,c,c2/c), qbinom(0.975,c,c2/c))
n2

n3 <- matrix(1:6, nrow=3)
n3[1,]<- c(qbinom(0.025,a,a3/a), qbinom(0.975,a,a3/a))
n3[2,]<- c(qbinom(0.025,b,b3/b), qbinom(0.975,b,b3/b))
n3[3,]<- c(qbinom(0.025,c,c3/c), qbinom(0.975,c,c3/c))
n3

a <- c(95, 63, 42)
b <- c(64, 46, 40)
c <- c(21, 38, 61)
ct <- data.frame(rbind(a, b, c))
ct2 <- t(ct)

r1 = sum(ct2[1,])/sum(ct2)
r2 = sum(ct2[2,])/sum(ct2)
r3 = sum(ct2[3,])/sum(ct2)

ex <- matrix(1:9, 3)
ex[1,1] = sum(a)*r1
ex[1,2] = sum(a)*r2
ex[1,3] = sum(a)*r3
ex[2,1] = sum(b)*r1
ex[2,2] = sum(b)*r2
ex[2,3] = sum(b)*r3
ex[3,1] = sum(c)*r1
ex[3,2] = sum(c)*r2
ex[3,3] = sum(c)*r3

ex2 <- data.frame(round(ex, 1))
names(ex2) <- c("a", "b", "c")
ex2
ct2

chisq.test(ct2)
chisq.test(ct2)$expected

ct3 <- stack(ct)
anova <- aov(values~ind, ct3)
summary(anova)

# p.127
# 担当者のミスの傾向を分割表により調べ、指導に活用した事例
# contingency table

# 過去一ヶ月のミスは伝票起票時の93件、全127件の73.2%
# 1) 起票時のミスの推定
qpois(0.025, lambda=93)
qpois(0.975, lambda=93)

# 2) 改めて３ヶ月間の起票時ミスに関するデータをとり、
#    分割表による検定を行う
#    飛び抜けて多い場合はカイ二乗値が高くなるため、
#　　棄却域は95%以上の上側検定とする

bcode <- c(6,8,14,5,13,12,9)
summ <- c(5,8,4,3,2,5,4)
item <- c(5,6,8,7,6,8,5)
other <- c(3,2,3,5,2,3,3)
data <- data.frame(rbind(bcode, summ, item, other))
names(data) <- c("A","B","C","D","E","F","G")

ex_data <- round(chisq.test(data)$expected, 1)
#         A   B    C   D   E    F   G
# bcode 7.8 9.8 11.8 8.2 9.4 11.4 8.6
# summ  3.6 4.5  5.5 3.8 4.3  5.3 4.0
# item  5.2 6.6  8.0 5.5 6.3  7.7 5.8
# other 2.4 3.1  3.7 2.6 2.9  3.6 2.7

chisq <- round((data - ex_data)^2/ex_data, 1)
#         A   B   C   D   E   F   G
# bcode 0.4 0.3 0.4 1.2 1.4 0.0 0.0
# summ  0.5 2.7 0.4 0.2 1.2 0.0 0.0
# item  0.0 0.1 0.0 0.4 0.0 0.0 0.1
# other 0.2 0.4 0.1 2.2 0.3 0.1 0.0

chisq.test(data)
# data:  data
# X-squared = 12.835, df = 18, p-value = 0.8013

# 3) ミスが164から112件に減少。改善効果を検定する

ppois(112, 164)
# 1.060872e-05 


# ------------------------------------------------
# 2021.8.3 Coursera Bayesian Statistics Week2 Lesson 4.1
# -----------------------------------------------

hist(rbinom(10000, 100, 0.44))
min = qbinom(0.025, 100, 0.44)
max = qbinom(0.975, 100, 0.44)
abline(v = c(min, max), col="red", lty=2)
text(x=c(min, max), y=1000, label=c(min, max), cex=0.7)

xmin = 30
xmax = 40
pxmin <- pbinom(xmin, 100, 0.44)
pxmax <- pbinom(xmax, 100, 0.44)
abline(v = c(xmin, xmax), col="blue", lty=2)
text(x=c(xmin, xmax), y=1000, label=c(xmin, xmax), cex=0.7)
pxmin
pxmax


# ------------------------------------------------
# 2021.8.5 Coursera Regression Models W4 Logistic Regression part I
# -----------------------------------------------


# download.file("https://dl.dropboxusercontent.com/u/7710864/data/ravensData.rda", destfile="./data/ravensData.rda", method="curl")
# This file downloaded from the above server doesn't work so I directly search the file usin Google 
# and got another ravensData.rda from GitHub.
load("./data/ravensData.rda")
head(ravensData)
rd <- ravensData

# Linear regression
fit <- lm(rd$ravenWinNum ~ ra$ravenScore)
summary(fit)$coef
plot(ra$ravenWinNum~ra$ravenScore, ra, col=ra$ravenWin, xlim=c(0, 50))
predict <- fit$coefficients[1] + fit$coefficients[2] * ra$ravenScore
lines(predict~ra$ravenScore)

# GLM
fit2 <- glm(ra$ravenWinNum ~ ra$ravenScore, family="binomial")
#summary(fit2)
odds <- exp(fit2$coefficients[1] + fit2$coefficients[2] * ra$ravenScore)
prob <- odds/(1+odds)
points(fit2$fitted.values~ra$ravenScore, col="green")
points(prob~ra$ravenScore, col="green", pch=19)

exp(fit2$coeff)
exp(confint(fit2))

# ANOVA 
anova(fit2, test="Chisq")

fit1 <- lm(Fertility~Agriculture, data=swiss)
fit3 <- update(fit1, Fertility~Agriculture+Examination+Education)
fit5 <- update(fit1, Fertility~Agriculture+Examination+Education+Catholic+Infant.Mortality)

anova(fit1, fit3, fit5)



# ------------------------------------------------
# 2021.8.7 Coursera Bayesian I W2 Lesson 4.4
# -----------------------------------------------

# Uniform destribution and the density

hist(runif(1000), breaks=seq(0, 1, by=0.1))
plot(density(runif(10000)))

# -------------------------------------------------------------
# 2021.8.７ Coursera Regression Models W4 Poisson Regression I
# -------------------------------------------------------------
download.file("https://dl.dropboxusercontent.com/u/7710864/data/gaData.rda", destfile="./data/gaData.rda", method="curl")
# This file downloaded from the above server doesn't work so I directly search the file usin Google 
# and got another ravensData.rda from GitHub.

load("./data/gaData.rda")
gaData$julian <- julian(gaData$date)
x <- gaData
plot(x$julian, x$visits, pch=19, xlab="jurian", ylab="visits", col="darkgrey")
lm1 <- lm(x$visits~x$julian)
abline(lm1, col="red", lwd=3)

x$date2 <- as.Date(x$date)
lm2 <- lm(x$visits~x$date2)
plot(visits~date2, x, pch=19, col="lightpink")
abline(lm2, col="black", lwd=3)

# Fitting counts in R
glm1 <- glm(x$visits~x$date2, family="poisson")
lines(glm1$fitted~x$date2, col="red", lwd=3)

# looking at the gap between lm and glm
g <- glm1$fitted - lm2$fitted
plot(g)
plot(g~x$date2)

# Fitting rates in R
par(mfrow=c(2,1))
glm2 <- glm(simplystats~date2, offset=log(visits+1), family="poisson", data=x)
plot(glm2$fitted~x$date2, col="blue", pch=19, xlab="Date", ylab="Fitted counts")
points(glm1$fitted~x$date2, col="red", pch=19)
points(simplystats~date2, col="grey", pch=19, data=x)

plot(simplystats/(visits+1)~date2, data=x, pch=19, col="grey", xlab="date", ylab="fitted rates")
lines(glm2$fitted/(x$visits+1)~x$date2, col="blue", lwd=3)

# -------------------------------------------------------------
# 2021.8.7 Coursera Bayesian I W2 Plotting the likelihood in R
# -------------------------------------------------------------

# 400 heart attacked patients, 72 died in a period in a hospital.

par(mfrow=c(2,1))
likelihood=function(n,y,theta){return(theta^y*(1-theta)^(n-y))}
pdf=function(n,x,theta){return((theta^x*(1-theta)^(n-x))*choose(n,x))}
theta = seq(0.01, 0.99, by=0.01)
x = seq(0, 400, by=1)
plot(theta, likelihood(400, 72, theta), type="l", xlab="theta", ylab="likelihood")
plot(x, pdf(400,x,0.18), type="l", xlab="x", ylab="pdf")

loglike = function(n,y,theta){return(y*log(theta)+(n-y)*log(1-theta))}
plot(theta, loglike(400, 72, theta), type="l", xlab="theta", ylab="log-likelihood")

# fair or loaded coin?
# Tested 5 times and you got 2 heads

par(mfrow=c(2,1))
#par(mfrow=c(2,1))
pdf = function(n, x, theta){return(theta^x*(1-theta)^(n-x)*choose(n,x))}
theta_f = 0.5 # fair coin
theta_l = 0.7 # loaded coin
n = 5
x <- 1:5
plot(x, pdf(n,x,theta_f), type="b", main="Probability of getting X counts of head", xlab="counts of head", ylab="prob density", ylim=c(0, 0.5))
points(x, pdf(n,x,theta_l), type="b",col="red")
legend("topright", legend=c("fair:0.5", "loaded:0.7"), pch=c(1, 1), col=c("black", "red"))

likelihood = function(n, x, theta){return(theta^x*(1-theta)^(n-x)*choose(n,x))}
theta <- seq(0, 1, by=0.1)
x = 2
plot(theta, pdf(n, x, theta), type="b", main="likelihood of theta when getting 2 counts of head", ylab="likelihood")


# ------------------------------------------------
# 2021.8.7 EMI data
# ------------------------------------------------

# 20 * log(v1/v0)

v <- seq(1:1000)
db <- 20*log(v, base=10)
data <- data.frame(cbind(v, db))

g <- ggplot(data)
p <- g + geom_point(aes(x=v, y=db))
p <- p + ylim(35, 45) + xlim(100, 110)
ggplotly(p, dynamicTicks = TRUE)

20*log(110, 10) - 20*log(100, 10)

g <- ggplot(data)
p <- g + geom_point(aes(x=db, y=v))
#p <- p + ylim(35, 45) + xlim(100, 110)
ggplotly(p, dynamicTicks = TRUE)

db2 <- seq(0:60)
v2 <- 10^(db2/20)
data2 <- data.frame(cbind(v2, db2))

g <- ggplot(data2)
p <- g + geom_point(aes(x=db2, y=v2))
#p <- p + ylim(35, 45) + xlim(100, 110)
ggplotly(p, dynamicTicks = TRUE)


# ------------------------------------------------
# 2021.8.13 Fri Voting simulation 
# -----------------------------------------------

# 出口調査結果、400人中56%がAに投票すると回答。候補者が二人のみであるとして
# Aは当選するだろうか？

par(mfrow=c(2,1))

n=30
min_rate <- qbinom(0.025, n, 0.56)/n
max_rate <- qbinom(0.975, n, 0.56)/n
c(min_rate, max_rate)

hist(rbinom(10000, n, 0.56), col=rgb(0,0,1,0.15))
abline(v=204)
abline(v=243)
text(x=204, y=1000, label=204/n)
text(x=243, y=1000, label=242/n)

# 95%信頼区間が0.51~0.605であり, 
# 半分以上取れると予想できるのでAは当選する



# --------------------------------------------------------------------
# 2021.8.14 Sat,  Distribution and PDF of theta as the prob you get head
# when you flip a fair or loaded coin
# --------------------------------------------------------------------

# distribution is theta ~ U(0, 1)
# probability density is f(theta) = I{0<theta<1}
par(mfrow=c(2,1))
hist(runif(1000,0,1))
plot(density(runif(1000,0,1)))

# --------------------------------------------------------------------
# 2021.8.14 Sat, pdf of score of test where you need to answer 100
# questions eac one of that you randomly choose one out of 5 options
# --------------------------------------------------------------------

hist(rbinom(10000, 100, 0.2))
#   95% CI is 12 ~ 28
qbinom(0.025, 100, 0.2) # minimum of 95% CI is 12
qbinom(0.975, 100, 0.2) # maximum of 95% CI is 28
abline(v = qbinom(0.025, 100, 0.2) )
abline(v = qbinom(0.975, 100, 0.2) )
text(x=qbinom(0.025, 100, 0.2), y=1000,label=qbinom(0.025, 100, 0.2))
text(x=qbinom(0.975, 100, 0.2), y=1000,label=qbinom(0.975, 100, 0.2))

# --------------------------------------------------------------------
# 2021.8.14 Sat, 品質改善後のロット不良率
# --------------------------------------------------------------------

old_p = 0.05  # prior failure rate
s = 200   # number of samples
n = 4     # number of failed parts

# HYPOTHESIS TEST 
# alpha:5%, one side test
pbinom(4, 200, 0.05)  
# 2.6% < 5% --> Ho rejected. 

# INFERENCE NEW FAILURE RATE

new_p_min = qbinom(0.025, 200, 4/200)/200  
new_p_max = qbinom(0.975, 200, 4/200)/200
c(new_p_min, new_p_max)  # 0.5% ~ 4.0%

# --------------------------------------------------------------------
# 2021.8.14 Sat, 分割表による検定
# --------------------------------------------------------------------

n1 <- c(80,50,70)
n2 <- c(30,40,30)
n <- data.frame(rbind(n1, n2))
chisq.test(n)$expected
chisq.test(n)

# --------------------------------------------------------------------
# 2021.8.22 Sun, dbinom, dnorm
# --------------------------------------------------------------------

par(mfrow=c(1,1))
plot(seq(-4, 4,0.5), dnorm(seq(-4, 4,0.5)), pch=19, col=rgb(1,0,0,0.15), typ='b')
plot(0:10, dbinom(0:10,10,0.2), typ='b', col=rgb(1,0,0,0.15), pch=19,frame=FALSE)
x=c(4, 4:10)
y=c(0, dbinom(4:10,10,0.2))
polygon(x,y,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))

# --------------------------------------------------------------------
# 2021.8.22 Sun, 検査精度
# --------------------------------------------------------------------
a_pos = 0.95  # p(hiv|+), prob of getting it when judged as positive
a_neg = 0.95  # p(no hiv|-), prob of not getting it when judged as negative
p = 0.008    # p(hiv), prob of getting it
p_pos = a_pos * p /(a_pos * p + (1-a_neg) * (1-p))
cat("prob when positive", p_pos)


# --------------------------------------------------------------------
# 2021.8.24 Tue
# --------------------------------------------------------------------

# p.26 QCIII

pbinom(0,30,0.02)
hist(rbinom(1000,30,0.2),col=rgb(1,0,0,0.15))
abline(v=1, lty=3)
pbinom(1,30,0.02) - pbinom(0,30,0.02)
rbinom(100, 30, 0.2)

# --------------------------------------------------------------------
# 2021.8.25 Wed
# --------------------------------------------------------------------

set.seed(20210825)
x = rbinom(10, 10, 0.3)
hist(x, xlim=c(0, 10), col=rgb(1,0,0,0.15), breaks=seq(0, 10, length.out=11))
cat("x is: ", x)

set.seed(20210825)
hist(rnorm(1000), xlim=c(-8, 8), col=rgb(1,0,1,0.15))
x = rnorm(30)
hist(x, col=rgb(1,0,1,0.25), breaks=seq(-4, 4, length.out=9), add=TRUE)
abline(v = t.test(x)$conf.int[1], col="red", lty=3)
abline(v = mean(x), col="red", lty=1)
abline(v = t.test(x)$conf.int[2], col="red", lty=3)

chisq_min = qchisq(0.05, df=length(x)-1)
chisq_max = qchisq(0.95, df=length(x)-1)
sig_min = sqrt((length(x)-1)*sd(x)^2/chisq_max)
sig_max = sqrt((length(x)-1)*sd(x)^2/chisq_min)

abline(v = t.test(x)$conf.int[1] - 3*sig_max, col="blue")
abline(v = t.test(x)$conf.int[2] + 3*sig_max, col="blue")

abline(v = -3, col="black")
abline(v = 3, col="black")
cat("sig_min ~ sigmax: ", sig_min,"~", sig_max)


# --------------------------------------------------------------------
# 2021.8.28 Sat plotting a density function
# --------------------------------------------------------------------

par(mfrow=c(1,1))
bernoulli = function(y,theta){return(theta^y*(1-theta)^(1-y))}
#theta <- seq(0, 1, by=0.1)
theta <- 0.2
y = 1
plot(theta, bernoulli(y, theta), pch=19, col=rgb(0,0,1,0.15), frame=FLASE, typ="b")
plot(1:100, dbinom(seq(0,1,length.out=100),1,0.2), typ="h")


# --------------------------------------------------------------------
# 2021.8.29 Sun Polygon
# --------------------------------------------------------------------

set.seed(20210829)
x = rnorm(1000)
x = rbinom(10, 10, 0.7)
hist(x, breaks = seq(0, 10, lelength.out = 10))
table(x)

d <- density(x)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")

# --------------------------------------------------------------------
# 2021.9.1 Wed Coursera Regression Model W4, Hodgepodge at 3:28 of 18:51
# --------------------------------------------------------------------

x <- 500
x <- seq(0, 4 * pi, length=n)
y <- sin(x) + rnorm(n, sd=0.3)
knots <- seq(0, 8*pi, length=20)
splineTerms <- sapply(knots, function(knot){(x > knot) * (x - knot)})
xMat <- cbind(1, x, splineTerms)
yhat1 <- predict(lm(y~xMat-1))
yhat2 <- predict(lm(y~xMat))
#plot(x, y, frame=FALSE, pch=21, bg="lightblue", cex=2)
plot(x, y, frame=FALSE, pch=21, bg=rgb(0,0,1, 0.15), cex=2)
lines(x, yhat1, col="red", lwd=2)
lines(x, yhat2, col="blue", lwd=2, lty=3)


# --------------------------------------------------------------------
# 2021.9.3 Fri Ellipses
# --------------------------------------------------------------------           

library(mixtools)
mu <- c(1, 3)
sigma <- matrix(c(1, .3, .3, 1.5), 2, 2)

ellipse(mu, sigma, npoints = 200, newplot = TRUE)


if(!require("mixtools")) { install.packages("mixtools");  require("mixtools") }
data_f <- faithful
plot(data_f$waiting, data_f$eruptions)
data_f.k2 = mvnormalmixEM(as.matrix(data_f), k=2, maxit=100, epsilon=0.01) 
data_f.k2$mu # estimated mean coordinates for the 2 multivariate Gaussians
data_f.k2$sigma # estimated covariance matrix 

plot( data_f$eruptions,data_f$waiting)
for (i in 1: length(data_f.k2$mu))  ellipse(data_f.k2$mu[[i]],data_f.k2$sigma[[i]])

# group data for coloring
data_f$group <- factor(apply(data_f.k2$posterior, 1, which.max))
# plotting
plot(data_f$eruptions, data_f$waiting, col = data_f$group)
for (i in 1: length(data_f.k2$mu))  ellipse(data_f.k2$mu[[i]],data_f.k2$sigma[[i]], col=i)


# needs ggplot2 package
require("ggplot2")
# ellipsis data 
ell <- cbind(data.frame(group=factor(rep(1:length(data_f.k2$mu), each=250))), 
             do.call(rbind, mapply(ellipse, data_f.k2$mu, data_f.k2$sigma, 
                                   npoints=250, SIMPLIFY=FALSE)))

# plotting command
p <- ggplot(data_f, aes(color=group)) + 
  geom_point(aes(waiting, eruptions)) +
  geom_path(data=ell, aes(x=`2`, y=`1`)) +
  theme_bw(base_size=16)
print(p)

library(plotly)
ggplotly(p)

plot(ell$`1`, ell$`2`)

# --------------------------------------------------------------------
# 2021.9.7 Beta distribution
# --------------------------------------------------------------------           
x <- rbeta(1000, 3,2)
plot(density(x))
polygon(density(x), col=rgb(1,0,0,0.15))

x <- rbeta(1000, 0.1, 1)
hist(x, density=TRUE)

# --------------------------------------------------------------------
# 2021.9.18 Gamma distribution
# --------------------------------------------------------------------           
x <- rgamma(1000,8,1)  # not a vague prior
plot(density(x), ylim=c(0, 0.4))
polygon(density(x), col=rgb(1,0,0, 0.15))

y <- rgamma(1000,67,6)
lines(density(y), lty=3)
polygon(density(y), col=rgb(0,1,0,0.15))

theta_x <- rbeta(1000,5.3, 6.9)
theta_y <- rbeta(1000,5.2, 5.9)

plot(density(theta_x))
polygon(density(theta_x), col=rgb(1,0,0,0.15))
lines(density(theta_y))
polygon(density(theta_y), col=rgb(0,0,1,0.15))


x <- rgamma(10000, 50, 6*0.8)
plot(density(x))
polygon(density(x), col=rgb(1,0,0,0.15))
ave <- 50/(6*0.8)
cat("average is ", ave)
qgamma(0.95, 50, 4.8)

# ------------------------------------------------
# 2021.9.23 Play with stock data
# ------------------------------------------------

library(quantmod)
library(ggplot2)
library(magrittr)
library(broom)
library(plotly)
library(ggplot2)

getSymbols(c("SHOP", "TWLO", "U", "COIN","PYPL","TWTR", "FB", "SE", "PTON", "ZM", "MPNGF"), src = "yahoo", from = start, to = end)
getSymbols(c("SHOP"), src = "yahoo", from = start, to = end)
SHOP_df <- data.frame(SHOP)
g <- ggplot(SHOP_df, aes(y=SHOP.Adjusted, x=as.Date(row.names(SHOP_df))))
p <- g + geom_point(color=rgb(0,0,1, 0.15))
p <- p + geom_line(color=rgb(0,0,1, 0.15))
#p <- p + geom_smooth()
#p <- p + geom_smooth(method="lm", se=TRUE, color=rgb(0,0,0,0.15))
p <- p + geom_smooth(method="loess", se=FALSE, color=rgb(0,0,0,0.15))
p <- p + ylim(0, max(SHOP_df$SHOP.Adjusted)+100)
p <- p + labs(title = "Shopify")
ggplotly(p)

getplot = function(data, name) {
  df <- data.frame(data[,6])
  names(df) <- c("adjusted")
  g <- ggplot(df)
  p <- g + geom_point(aes(y=adjusted, as.Date(row.names(df))),color=rgb(1,0,1, 0.15))
  p <- p + geom_line(aes(y=adjusted, as.Date(row.names(df))), color=rgb(1,0,1, 0.15))
  p <- p + geom_text(aes(y=max(adjusted)+max(adjusted)*0.01, x=mean(as.Date(row.names(df)))),label=name, size=4, color=rgb(0,0,1, 0.15))
  p <- p + ylim(0, max(df$adjusted)+max(df$adjusted)*0.3)
  p <- p + geom_vline(aes(xintercept=as.numeric(as.Date("2021-09-10"))), color=rgb(1,0,1, 0.15))
  p <- p + labs(x="Date", y="stock price")
  ggplotly(p)
}

start = as.Date("2021-08-01") 
end = as.Date("2021-09-20")

getSymbols(c("SHOP", "TWLO", "U", "COIN","PYPL","TWTR", "FB", "SE", "PTON", "ZM", "MPNGF"), src = "yahoo", from = start, to = end)
p1 <- getplot(SHOP, "Shopify")
p2 <- getplot(TWLO, "Twilio")
p3 <- getplot(U, "Unity")
p4 <- getplot(COIN, "Coinbase")
p5 <- getplot(PYPL, "Paypal")
p6 <- getplot(TWTR, "Twitter")
p7 <- getplot(FB, "Facebook")
p8 <- getplot(SE, "Sea")
p9 <- getplot(PTON, "Peloton")
p10 <- getplot(ZM, "Zoom")
p11 <- getplot(MPNGF, "Meituan")

subplot(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10,p11, nrows=3)

#getSymbols(c("SSNLF"), src = "yahoo", from = start, to = end)
invisible(getSymbols(c("CRWD"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("MSFT"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("GOOG"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("OKTA"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("AMZN"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("CSCO"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("FTNT"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("EPAM"), src = "yahoo", from = start, to = end))

p1 <- getplot(CRWD, "SrowdStrike")
p2 <- getplot(MSFT, "Microsoft")
p3 <- getplot(GOOG, "Alphabet")
p4 <- getplot(OKTA, "Okta")
p5 <- getplot(AMZN, "Amazon")
p6 <- getplot(CSCO, "Cisco")
p7 <- getplot(FTNT, "Fortinet")
p8 <- getplot(EPAM, "EPAM")

subplot(p1, p2, p3, p4, p5, p6, p7, p8, nrows=3)


invisible(getSymbols(c("MSFT"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("TMO"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("APD"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("TRMB"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("ASML"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("DKILY"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("WM"), src = "yahoo", from = start, to = end))

p1 <- getplot(MSFT, "Microsoft")
p2 <- getplot(TMO, "Thermo Fisher")
p3 <- getplot(APD, "Air Products")
p4 <- getplot(TRMB, "Trimble Navigation")
p5 <- getplot(ASML, "ASML")
p6 <- getplot(DKILY, "Daikin")
p7 <- getplot(WM, "Waste Management")

subplot(p1, p2, p3, p4, p5, p6, p7, nrows=3)


# ------------------------------------------------
# 2021.9.25 Play with stock data
# ------------------------------------------------

start = as.Date("2021-08-01") 
end = as.Date("2021-09-25")

#getSymbols(c("SSNLF"), src = "yahoo", from = start, to = end)
invisible(getSymbols(c("CRWD"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("MSFT"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("GOOG"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("OKTA"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("AMZN"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("CSCO"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("FTNT"), src = "yahoo", from = start, to = end))
invisible(getSymbols(c("EPAM"), src = "yahoo", from = start, to = end))

x <- data.frame(EPAM$EPAM.Adjusted)
names(x) <- "price"
#hist(x$price)
#x[-1,]
#row.names(x)
#diff(x$price, lag=1)
x2 <- mutate(x, diff = c(0, diff(x$price, lag=1)), rate=round(diff/price,3)*100)
head(x2)
par(mfrow=c(3,1))
hist(x2$rate, main="% from the day before", col=rgb(0,0,1,0.15))
text(x=1, y=4, labels=paste("mean=", round(mean(x2$rate),2), "%", sep=""))
plot(as.Date(row.names(x2)), x2$rate, typ='b', pch=21, bg=ifelse(x2$rate >= 0, "black", "red"))
  #   bg=rgb(0,0,1, 0.15), ylab="% from the day before")
abline(h=0, lty=3)
#fit <- lm(x2$rate~as.Date(row.names(x2)))
#abline(fit, col="red")
plot(as.Date(row.names(x2)), x2$price, typ='b', pch=21, bg=rgb(0,0,1, 0.15), ylab="US$")

# ------------------------------------------------
# 2021.9.25 ベイズ統計学 P.65 
# 波平さんの釣果、船さんが夕飯のおかずを買わなければならない確率
# まず船さんの主観で事前分布の平均と標準偏差を決める
# それらからガンマ分布のアルファとベータを求める mean=a1/b1, sd=sqrt(a1)/b1
# 次にデータから事後分布のアルファとベータを求める a2=a1+y, b2=b1+n
# 事後分布の平均をラムダlambda,とするポワソン分布において0の確率を求める
# つまり、ppois(0, lambda)
# ------------------------------------------------

par(mfrow=c(1,1))
ppois(1, 0.6)
x <- rpois(1000, 0.6)
hist(x, breaks=seq(0,5))
sum(x==0)/1000

set.seed(20210925)
x <- dgamma(0:50,10,1)
plot(x, typ="l", lty=3)
polygon(x, col=rgb(0,1,0,0.15))

a1 = 4/0.64
b1 = 2/0.64
x = seq(0, 10, length.out=100)
prior = dgamma(x,a1, b1)
plot(x=x, y=prior, typ="l", lty=3, ylim=c(0, 2))
#polygon(prior, col=rgb(0,1,0,0.15))

n = 10
y = 5
a2 = a1 + y
b2 = b1 + n
posterior = dgamma(x,a2, b2)
lines(x=x, y=posterior, typ="l", lty=3, add=TRUE)
#polygon(posterior, col=rgb(1,0,0,0.15))
text(x=x[which(prior==max(prior))], y=0.6, labels=round(x[which(prior==max(prior))],2))
text(x=x[which(posterior==max(posterior))], y=1.7, labels=round(x[which(posterior==max(posterior))],2))

cat("Lamda ~ Beta(", a1, ",", b1, ")", sep="")
cat("Lamda|Y ~ Beta(", a2, ",", b2, ")", sep="")
cat("number of fishing = ",n, ", number of fishes = ",y, sep="")
cat("In prior, mean is ", a1/b1, ", sigma = ", sqrt(a1)/b1, sep="")
cat("In posterior, mean is ", a2/b2, ", sigma = ", sqrt(a2)/b2, sep="")


# ------------------------------------------------
# 2021.9.25 QCIII P.40
# F分布
# おなじ母集団から採取したデータの分散の比はF分布になる
# 分散の比を取ったときにF分布の95%に入らない場合は別の母集団
# ということになる、あるいはおなじ母集団の可能性は低い
# カイ二乗分布との違い
# 
# ------------------------------------------------

x <- df(1:10, 10, 14)
hist(x)

qf(0.025, 10, 13)
qf(0.975, 10, 13)

# ------------------------------------------------
# 2021.10.19 QCIII P.49
# 次に示すデータが従来の平均209.3kgより増えたかどうか？
# ------------------------------------------------

x = c(219,207,211,220,214,215,212,210,219,223)
res <- t.test(x-209.3)

cat("With 95% CI, the new average is greater than the old one by from ", 
    round(res$conf.int[1],1), "kg to ", round(res$conf.int[2],1), "kg", sep="")

cat(", that is following. ", 
    round(res$conf.int[1] + 209.3,1),"kg to ", round(res$conf.int[2] + 209.3,1), "kg", sep="")

# ------------------------------------------------
# 2021.10.19 curve(), quantile()
# ------------------------------------------------

x <- rnorm(10000)
hist(x, freq=FALSE)
curve(dnorm(x), add=TRUE)
abline(v=quantile(x, probs=0.95), lty=3)



# ------------------------------------------------
# 2021.10.19 ベイズ統計学
# P.73 Problem #9
# ------------------------------------------------

# 一週間に３個の売上
# お守りを買ったら８個になった

lambda = 3
ppois(7, lambda, lower.tail=FALSE)

# ------------------------------------------------
# 2021.10.23 Sat BayesII W1
# Computing Monte Carlo error
# ------------------------------------------------
m
# 1. Monte Carlo estimation of a simple distribution -------------------
set.seed(32)

m = 10000
a = 2.0
b = 1.0/3.0

theta = rgamma(n=m, shape=a, rate=b)  # theta is 10,000 samples taken out from Gamma

se = sd(theta)/sqrt(m)  # compute the standard error of the sample
cat("se: ", se)

mean(theta) - 2.0*se  # lower end of mean of the Gamma
mean(theta) + 2.0*se  # upper end of mean of the Gamma
quantile(theta, probs=0.5)
hist(theta, freq=FALSE)

### Monte Carlo estimation using the sample
## possibility of the population being less than 5
ind = theta < 5 # indicator of theta being less than 5
mean(ind)       # possibility of theta being less than 5
pgamma(5.0, shape=a, rate=b)  # possibility of the population being less than 5

se2 = sd(ind)/sqrt(m) # the standard error of the estimation
cat("se: ", se)

# 2. Monte Carlo estimation of hierachical distribution -------------------
m = 1e5
y = numeric(m)
phi = numeric(m)

for (i in 1:m) {
  phi[i] = rbeta(1, shape1=2.0, shape2=2.0)
  y[i] = rbinom(1, size=10, prob=phi[i])
}

hist(phi, freq=FALSE)
lines(density(phi), add=TRUE)


phi = rbeta(m, shape1=2.0, shape2=2.0)
y = rbinom(m, size=10, prob=phi)

table(y)/m
plot(table(y)/m)  


# ------------------------------------------------
# 2021.11.3 Wed Histogram with dots on the x axis
# ------------------------------------------------

par(mfrow=c(2,1))
x = rnorm(10)
plot(x, typ='b')
y = rnorm(10)
points(y, typ='b', col="red")

hist(x)
points(x, rep(0, length(x)))

# ------------------------------------------------
# 2021.11.20 gamma distribution
# ------------------------------------------------

par(mfrow=c(2,1))
x <- rgamma(100,2,0.5)
#hist(x, breaks=seq(0, 10, length.out=10))
hist(x, main="shape=2, rate=0.5", xlim=c(0, 22), ylim=c(0, 40))
points(x=x, y=rep(0, length(x)), col=rgb(1,0,0,0.2), pch=19)
abline(v=mean(x))
#abline(v=median(x))

x <- rgamma(100,4,0.5)
#hist(x, breaks=seq(0, 10, length.out=10))
hist(x, main="shape=4, rate=0.5", xlim=c(0, 22), ylim=c(0, 40))
points(x=x, y=rep(0, length(x)), col=rgb(1,0,0,0.2), pch=19)
abline(v=mean(x))
#abline(v=median(x))


# ------------------------------------------------
# 2021.11.23 QC P.50
# ------------------------------------------------

x = c(16.3, 15,16.3,15.8,16.3,16.2,15.7,16.3,15.8,16.3)
length(x)
mean(x)
t.test(x)
hist(x, freq = FALSE, col=rgb(0,0,1,0.15))
points(x, rep(0, length(x)), pch=21, bg=rgb(0,0,1, 0.15), cex=2)

# ------------------------------------------------
# 2021.12.4 Sat FX analysis
# ------------------------------------------------

setwd("/Users/keijiharada/Downloads")
x3$DATE <- as.Date(as.character(x3$DATE), "%Y-%m-%d")
fx <- x3[, c(1, 50:55)] 
names(fx) <- c("DATE", "CN", "JP", "EU","IN", "SK", "TW")

# EURO  ...........................................

par(mfrow=c(2,2))

eu <- fx$EU

plot(date, eu, typ='l', main='euro')
hist(eu, main="euro")
points(x=eu, y=rep(0, length(eu)), col=rgb(0,0,0,0.15))
abline(v=mean(eu))
text(x=mean(eu), y=10, label=round(mean(eu), 2))

hist(eu[-1] - eu[-length(eu)], main="one week difference", xlab="diff[€]")
points(eu[-1] - eu[-length(eu)], y=rep(0, length(eu[-length(eu)] - eu[-1]), col=rgb(0,0,0,0,15)))


date <- fx$DATE
diff <- eu[-1] - eu[-length(eu)]
plot(date[-1], diff, typ='l', col=rgb(0,0,0,0.4), main='one week difference', ylab="diff[€]")
#polygon(date[-1], diff ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))
diff2 <- c(0, diff[-1])
diff3 <- c(diff2[-length(diff2)], 0)
polygon(date[-1], diff3 ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))


# Chinese Yuan  ...........................................
par(mfrow=c(2,2))

cny <- fx$CN

plot(date, cny, typ='l', main='CNY')
hist(cny, main="CNY")
points(x=cny, y=rep(0, length(cny)), col=rgb(0,0,0,0.15))
abline(v=mean(cny))
text(x=mean(cny), y=10, label=round(mean(cny), 2))

hist(cny[-1] - cny[-length(cny)], main="one week difference", xlab="diff[CNY]")
points(cny[-1] - cny[-length(cny)], y=rep(0, length(cny[-length(cny)] - cny[-1]), col=rgb(0,0,0,0,15)))

date <- fx$DATE
diff <- cny[-1] - cny[-length(cny)]
plot(date[-1], diff, typ='l', col=rgb(0,0,0,0.4), main='one week difference', ylab="diff[€]")
#polygon(date[-1], diff ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))
diff2 <- c(0, diff[-1]);diff2
diff3 <- c(diff2[-length(diff2)], 0);diff3
polygon(date[-1], diff3 ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))

# Yen  ...........................................
par(mfrow=c(2,2))

jpy <- fx$JP

plot(date, jpy, typ='l', main='JPY')
habline(h=mean(jpy))
ist(jpy, main="JPY")
points(x=jpy, y=rep(0, length(jpy)), col=rgb(0,0,0,0.15))
abline(v=mean(jpy))
text(x=mean(jpy), y=10, label=round(mean(jpy), 2))

hist(jpy[-1] - jpy[-length(jpy)], main="one week difference", xlab="diff[JPY]")
points(jpy[-1] - jpy[-length(jpy)], y=rep(0, length(jpy[-length(jpy)] - jpy[-1]), col=rgb(0,0,0,0,15)))
abline(v=mean(diff))

date <- fx$DATE
diff <- jpy[-1] - jpy[-length(jpy)]
plot(date[-1], diff, typ='l', col=rgb(0,0,0,0.4), main='one week difference', ylab="diff[¥]")
#polygon(date[-1], diff ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))
diff2 <- c(0, diff[-1]);diff2
diff3 <- c(diff2[-length(diff2)], 0);diff3
polygon(date[-1], diff3 ,col=rgb(1,0,0,0.15), border=rgb(1,0,0,0.15))




# ------------------------------------------------
# 2021.12.18 がん検診リスト
# ------------------------------------------------
setwd("/Users/keijiharada/Downloads")
alldata <- read.csv("kenshinkikan_2021.csv")

#---------- bwords ---------- 
DT::datatable(
  alldata,
  escape=FALSE,
  filter='top',
  extensions = c('Select', 'Buttons'),
  fillContainer = TRUE,
  style='default',
  options = list(
    select = list(style='os', items='row'),
    dom = 'Blfrtip',
    rowID=0,
    buttons = c('selectAll', 'selectNone', 'selectRows', 'selectColumns', 'selectCells'),
    autoWidth=TRUE,
    pageLength=50,
    cautoFill=TRUE,
    scrollX=TRUE,
    scrollY=TRUE,
    scrollCollapse=TRUE,
    columnDefs = list(
      list(targets=2, width='200px')
      #list(targets=c(2,4), width='500px')
    ),
    filter='top',
    caption = 'xxx'
  )
) 

datatable(alldata, filter = 'top', options = list(
  pageLength = 5, autoWidth = TRUE
))

# ------------------------------------------------
# 2021.12.22 血液検査、アレルギー
# ------------------------------------------------

library(ggplot2)
library(plotly)
#setwd(paste(getwd(), "/Downloads", sep=""))
temp <- read.csv("20211222-BloodTest.csv", header=TRUE)
blood <- temp[, c(1:27)]
rate <- round(((blood[3,] - blood[1,] )/(blood[2,] - blood[1,]) * 100), 2)
data <- data.frame(t(rate))
data$name <- row.names(data)
row.names(data) <- 1:dim(data)[1]
names(data) <- c("measures", "item")

g <- ggplot(data)
p <- g + geom_point(aes(y=measures, x=item, color=item))
p <- p + labs(x="Tes Items", y="Percent[%]", title="Blood Test 2021.11" )
p <- p + geom_hline(aes(yintercept=100))
#p <- p + geom_text(aes(y=105, x="ALB"),label="100", size=3)
p <- p + scale_y_continuous(breaks = seq(0, 600, 100), limits=c(0, 600))
ggplotly(p)

# ------------------------------------------------
# 2022.5.8 Show Kirks 
# ------------------------------------------------

temp <- jsonlite::fromJSON("/Users/keijiharada/AI/Coursera/json-server/db.json")
alldata <- temp$kirks
DT::datatable(alldata)


# ------------------------------------------------
# 2022.7.2 Show Kirks 
# ------------------------------------------------
library(dplyr)
library(mongolite)
library(tidyr)
m <- mongo("kirks", url = "mongodb://localhost:27017/conFusion")
m$count('{}')
alldata <- m$find('{}')
alldata <- select(alldata, -c('createdAt', 'updatedAt', '__v', 'work', 'buy', 'utilities', 'symptoms', 'events', 'health', 'foods', 'invests'))
DT::datatable(
  alldata,
  #escape=FALSE,
  filter='top',
  extensions = c('Select', 'Buttons'),
  #fillContainer = TRUE,
  style='default',
  options = list(
    select = list(style='os', items='row'),
    dom = 'Blfrtip',
    rowID=0,
    buttons = c('selectAll', 'selectNone', 'selectRows', 'selectColumns', 'selectCells'),
    pageLength=50,
    cautoFill=TRUE,
    scrollX=TRUE,
    scrollY=TRUE,
    scrollCollapse=TRUE,
    autoWidth = TRUE,
    columnDefs = list(list(width = '100', visible=TRUE, targets = c(1)), 
                      list(width = '10', visible=TRUE, targets = 2),
                      list(className = 'dt-left', targets="_all")
    ),
    filter='top',
    caption = 'xxx'
  )
  #) %>% DT::formatStyle(columns = colnames(.), fontSize = '50%')
  #) %>% DT::formatStyle(columns = c(1:6), fontSize = '80%', fontWeight='bold')
  #) %>% DT::formatStyle(columns = 4, fontSize ='120%', fontWeight='bold')
) %>% DT::formatStyle('subject', fontSize ='100%', fontWeight='bold')
#) %>% DT::formatStyle('data', fontSize ='100%', fontWeight='bold')
# 妙に短くなってしまうところだけを幅指定する　例）日付、本のタイトル 

# ------------------------------------------------
# 2022.10.26 Money accumulation history 
# ------------------------------------------------

x <- read.csv("money.csv")
x1 <- data.frame(t(x))
row.names(x1) <- 1:dim(x1)[1]
names(x1) <- c("date", "amount")
x2 = x1
x2$amount = as.numeric(gsub(",", "", x1$amount))
x2$date = as.Date(gsub("\\.", "-", x1$date))
plot(x2$date, x2$amount, pch=19, ylim=c(0, 100000000), typ='l')



# ------------------------------------------------
# 2022.11.13 献血血液検査
# ------------------------------------------------

library(ggplot2)
library(plotly)
library(tidyr)
#setwd(paste(getwd(), "/Downloads", sep=""))
temp <- read.csv("20221025-BloodTest.csv", header=TRUE)
temp2 <- as.matrix(temp[c(1:5), c(2:15)])
row.names(temp2) <- temp2[c(1:5),1]
blood <- apply(temp2, 2, as.numeric)
rate1 <- round(((blood[1,] - blood[4,] )/(blood[5,] - blood[4,]) * 100), 2)
rate2 <- round(((blood[2,] - blood[4,] )/(blood[5,] - blood[4,]) * 100), 2)
rate3 <- round(((blood[3,] - blood[4,] )/(blood[5,] - blood[4,]) * 100), 2)
blood_rate <- data.frame(rbind(rate1, rate2, rate3))
blood_rate$date <- as.Date(temp[1:3, 1])
#blood_rate$remarks <- temp[6,2:15]
#row.names(blood_rate) <- as.Date(temp[1:3, 1])
blood_rate2 <- gather(blood_rate, name, data, -date)

#write.csv(blood_rate2,'20221025-BloodTest2.csv')
temp3 <- read.csv("20221025-BloodTest2.csv", header=TRUE)
blood_rate2$rep <- temp3[,5] 
g <- ggplot(blood_rate2)
#p <- g + geom_point(aes(y=data, x=date, color=name))
#p <- g + geom_line(aes(y=data, x=date, color=temp3[,5]))
p <- g + geom_line(aes(y=data, x=date, color=rep))
p <- p + labs(y="Percent[%]", title="Blood Test Results" )
p <- p + geom_hline(aes(yintercept=100))
#p <- p + geom_text(aes(y=105, x="ALB"),label="100", size=3)
#p <- p + scale_y_continuous(breaks = seq(0, 600, 100), limits=c(0, 600))
ggplotly(p)


library(DT)
library(ggplot2)
library(plotly)
#setwd(paste(getwd(), "/Downloads", sep=""))
temp <- read.csv("20221025-BloodTest.csv", header=TRUE)
temp <- read.csv("20200921-BP2.csv", header=TRUE)
datatable(temp)

datatable(mtcars, options = list(search = list(regex = TRUE)), filter = list(position = "top"))
datatable(temp, options = list(dom = 'ft'))

library(DT)
mtcars2 = mtcars[, c(1:5, 9)]
mtcars2$am = factor(mtcars$am, c(0, 1), c('automatic', 'manual'))
datatable(
  mtcars2, colnames = c('model' = 1),
  filter = list(position = 'top', clear = FALSE),
  options = list(
    search = list(regex = TRUE, caseInsensitive = FALSE, search = 'M[ae]'),
    pageLength = 5
  )
)

# ------------------------------------------------
# 2022.12.30 Download directly from Atlas 
# ------------------------------------------------
library(dplyr)
library(mongolite)
library(tidyr)
library(ggplot2)
library(plotly)
m <- mongo("inputs", url = "mongodb+srv://cage:cage32044@cluster0.5iz8q.gcp.mongodb.net/conFusion")
m$count('{}')
alldata <- m$find('{}')
rohmcombo <- subset(alldata, user=="63acc4e1c5ab6d00164a4dc3")
rohm <- rohmcombo[, c(4:5,7:8)]
rohm <- rohmcombo[, c(4:8)]


mch = subset(rohm, subject=="出力電圧M" & unit=="Vrms")
mch$reason = as.numeric(gsub("A$", "", mch$reason))
mch$data <- as.numeric(mch$data)
mch$VM <- c(32,32,32,32,32,7,7,7,7,7,7)
g <- ggplot(mch, aes(x=reason, y=data, color=factor(VM))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: M" )
p <- p + ylim(0, 6)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(5*0.97, 5*1.03), linetype="dotted", color="red")
p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(VM~.)
ggplotly(p)

ach = subset(rohm, subject=="出力電圧A" & unit=="Vrms")
ach$reason = as.numeric(gsub("A$", "", ach$reason))
ach$data <- as.numeric(ach$data)
ach$VM <- c(32,32,32,32,7,7,7,7,7)
g <- ggplot(ach, aes(x=reason, y=data, color=factor(VM)))
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: A" )
p <- p + ylim(0, 1.0)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(0.9*0.97, 0.9*1.03), linetype="dotted", color="red")
p <- p + geom_vline(xintercept=1.5, linetype="dotted", color="red")
p <- p + facet_grid(VM~.)
ggplotly(p)

bch = subset(rohm, subject=="出力電圧B" & unit=="Vrms")
bch$reason = as.numeric(gsub("A$", "", bch$reason))
bch$data <- as.numeric(bch$data)
bch$VM <- c(32,32,32,32,7,7,7,7)
bch <- bch[-c(5, 7),]
g <- ggplot(bch, aes(x=reason, y=data, color=factor(VM)))
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: B" )
p <- p + ylim(0, 4.0)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(3.3*0.97, 3.3*1.03), linetype="dotted", color="red")
p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(VM~.)
ggplotly(p)

ldo = subset(rohm, subject=="出力電圧LDO" & unit=="Vrms")
ldo$reason = as.numeric(gsub("A$", "", ldo$reason))
ldo$data <- as.numeric(ldo$data)
ldo$VM <- c(32,32,7,7)
ldo <- ldo[-c(5, 7),]
g <- ggplot(ldo, aes(x=reason, y=data, color=factor(VM)))
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: B" )
p <- p + ylim(0, 2.0)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(1.5*0.97, 1.5*1.03), linetype="dotted", color="red")
p <- p + geom_vline(xintercept=0.5, linetype="dotted", color="red")
p <- p + facet_grid(VM~.)
ggplotly(p)

reg <- rbind(mch, ach, bch, ldo)
g <- ggplot(reg, aes(x=reason, y=data, color=factor(subject)))
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation" )
p <- p + ylim(0, 6.0)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(5.0*0.97, 5.0*1.03), linetype="dotted", color="grey")
p <- p + geom_hline(yintercept=c(0.9*0.97, 0.9*1.03), linetype="dotted", color="grey")
p <- p + geom_hline(yintercept=c(3.3*0.97, 3.3*1.03), linetype="dotted", color="grey")
p <- p + geom_hline(yintercept=c(1.5*0.97, 1.5*1.03), linetype="dotted", color="grey")
p <- p + geom_vline(xintercept=0.5, linetype="dotted", color="grey")
p <- p + geom_vline(xintercept=1.5, linetype="dotted", color="grey")
p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="grey")
p <- p + facet_grid(VM~subject)
ggplotly(p)


# ------------------------------------------------
# 2023.5 Analyze BM data on Kirk 
# ------------------------------------------------

library(stringr)
library(lubridate)

setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("generatedBy_react-csv.csv", header=TRUE)

x1 = x[, c(2,3, 6)]
x2 <- x1[-c(1:21, 31, 304, 325), ]

# Use parse_datetime of tidyverse
# Ref: https://readr.tidyverse.org/reference/parse_datetime.html
# You need to install the latest version of R and RStudio before installing the package

date2 = 1:1:dim(x2)[1]
for (i in 1:dim(x2)[1]) {
 temp <- unlist(strsplit(x2$date[i], " "))[c(1,3)]
 date2[i] <- paste(temp[1], temp[2])
}

x2$date3 <- ymd_hm(date2, tz=Sys.timezone())
# refer to https://stackoverflow.com/questions/25960517/how-to-convert-date-and-time-from-character-to-datetime-type

len = length(x2$date3)
iv <- as.numeric((x2$date3[-1] - x2$date3[1:len-1])/3600)
hist(iv)
mean(iv, na.rm=TRUE)
median(iv, na.rm=TRUE)


# ------------------------------------------------
# 2023.6.12 Plot humid data on Kirk
# ------------------------------------------------


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
plot(x1$date3, x1$data, typ="b", frame=FALSE, ylim=c(0, 80))

# Temp data
t <- read.csv("generatedBy_react-csv (3).csv", header=TRUE)

t1 = t[,c(2,8,9)]

date2 = 1:1:dim(t1)[1]
for (i in 1:dim(t1)[1]) {
  temp <- unlist(strsplit(t1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

t1$date3 <- ymd_hm(date2, tz=Sys.timezone())
lines(t1$date3, t1$data, typ="b", col="grey")


# ------------------------------------------------
# 2023.6.1 Create a code for EMI data
# ------------------------------------------------


x <- read.csv("emi.csv", header=TRUE)
x1 <- x[4,c(2:9)]
x1
x2 <- unlist(strsplit(as.character(x1[6]), ", "))
cnames1 <- c("place", "engineer", "product", "phase", "AC", "unit")

temp <- t(x2)
colnames(temp) <- cnames1
x3 <- data.frame(temp)

x4 <- x1[, -6]
cnames2 <- c("date", "freq", "polarization", "operation", "cause", "margin", "angle")
colnames(x4) <- cnames2

x5 <- cbind(x4, x3)
x5


# ------------------------------------------------
# 2023.6.13 Plot alcohol data on Kirk
# ------------------------------------------------


library(stringr)
library(lubridate)

setwd(paste(getwd(), "/Downloads", sep=""))

# Alcohol data
# Search with "alcohol ml" on Kirk
# x <- read.csv("generatedBy_react-csv (10).csv", header=TRUE)
x <- read.csv("generatedBy_react-csv-7.csv", header=TRUE)


x1 = x[,c(2,5,8,9)]
x2 <- x1[!is.na(x1$data), ] # remove NA on data

date2 = 1:1:dim(x2)[1]  
# remove week data from date
for (i in 1:dim(x2)[1]) {
  temp <- unlist(strsplit(x2$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x2$date2 <- ymd_hm(date2, tz=Sys.timezone()) # convert date into POSIX format
x3 <- x2[!is.na(x2$date2), ] # remove NA, this time on date.

x4 <- subset(x3, data < 100) # remove data that is not amount of alcohol but the amount of the drink itself
plot(x4$date2, x4$data, typ="b", pch=19, col=rgb(0,0,0,0.15), frame=FALSE)

library(ggplot2)
library(plotly)
g <- ggplot(x4, aes(x=date2, y=data, color=factor(subject)))
#g <- ggplot(x4, aes(x=date2, y=data))
#p <- g + geom_point()
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation" )
ggplotly(p)


# 頭痛 data
h <- read.csv("generatedBy_react-csv (5).csv", header=TRUE)
h1 = h[-2,c(2, 5, 8)] # remove えつこdata

h2 = h1[-c(4,6,9,11,24:27,38),]

data2 <- c(5,3,1,1,1,3,3,3,1,3,1,1,3,1,1,1,1,1,1,1,1,5,3,1,5,3,3,3,3)
h2$data2 <- data2 * 10

date2 = 1:1:dim(h2)[1]  # remove week data from date
for (i in 1:dim(h2)[1]) {
  temp <- unlist(strsplit(h2$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

h2$date2 <- ymd_hm(date2, tz=Sys.timezone()) # convert date into POSIX format
h3 <- h2[!is.na(h2$date2), ] # remove NA, this time on date.
#lines(h3$date2, h3$data2, col=rgb(1,1,0))
points(h3$date2, h3$data2, pch=19, col=rgb(0,1,0,0.5))


# ------------------------------------------------
# 2023.6.24 Sat Financial Risk Management
# ------------------------------------------------

# Week1 
# Exercise 3 Retrieving Data from FRED
# install.packages("quantmod")
library(quantmod)
#install.packages("moments")
library(moments)
#install.packages("metRology")
library(metRology)
#install.packages("rugarch")
library("rugarch")

wilsh <- getSymbols("WILL5000IND", src="FRED", auto.assign=FALSE)
wilsh <- na.omit(wilsh)
wilsh <- wilsh["1979-12-31/2017-12-31"]
names(wilsh) <- "TR"

logret <- diff(log(wilsh$TR))[-1]
head(logret, 3)


 
logret <- diff(log(wilsh$TR))[-1]
round(head(logret, 3), 6)

ret <- exp(logret) - 1
round(head(ret, 3), 6)

logret.w <- apply.weekly(logret, sum)
logret.m <- apply.monthly(logret, sum)
logret.q <- apply.quarterly(logret, sum)
logret.y <- apply.yearly(logret, sum)

ret.w <- exp(logret.w) - 1
ret.m <- exp(logret.m) - 1
ret.q <- exp(logret.q) - 1
ret.y <- exp(logret.y) - 1

par(mfrow=c(4,1))
plot(logret)
plot(logret.m)
plot(logret.q)
plot(logret.y)

plot(ret)
plot(ret.m)
plot(ret.q)
plot(ret.y)

# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret) 
round(skewness(rvec),2) # -0.91, -0.9135648
round(kurtosis(rvec),2) # 21.8
jarque.test(rvec) # JB = 142514, p-value < 2.2e-16

# Serial Correlation, Volatility Clustering, GARCH
acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))

set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])


# Exercise 4 Longer horizon returns of Gold  -----------------------------
# Download the file "FRED_gold.rda" from the course

#setwd("/Users/keijiharada/Downloads") +++++++++++++++++++++++++++++++++++++++++++++++
load('FRED_gold.rda') # the name of data is "gold"
gold <- gold["1979-12-31/2017-12-31"] # you need quantmod to do this

logret <- diff(log(gold$TR))[-1]
#logret <- round(logret, 6)
ret <- round(exp(logret) - 1, 6) # because the first data of logret is NA

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret)
sig <- sd(logret)
VaR <- qnorm(0.05, mu, sig)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.05, 0, 1), 0, 1)/0.05
HF_ES <- 1000 * (exp(ES) - 1)

# Sim1
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])

# Sim2
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace=TRUE)
VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])

# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret)
round(skewness(rvec),2) # -0.09, -0.08928404
round(kurtosis(rvec),2) # 15.43
jarque.test(rvec) # JB = 61330, p-value < 2.2e-16

# Student T Distribution
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

alpha <- 0.05
set.seed(123789) 
library(metRology)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

# VaR and ES at 10-day horizon
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

# Sim1 at 10-day horizon
alpha <- 0.05
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim2 at 10-day horizon
alpha <- 0.05
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + sample(as.vector(logret), 100000, replace=TRUE)
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim3 at 10-day horizon
alpha <- 0.05
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from=1, to=length(rdat)-9, by=1)
rpos <- sample(posn, 100000, replace=TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1  
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)


# Serial Correlation, Volatility Clustering, GARCH
acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

gold <- gold["1979-12-31/2008-09-15"] # you must add 0 before the 9. also gold must have more data than you choose.
tail(gold)
logret <- diff(log(gold$TR))[-1]

gold <- gold["1979-12-31/1987-10-19"] # you must add 0 before the 9, also gold must have more data than you choose.
tail(gold)
logret <- diff(log(gold$TR))[-1]


# Graded Quiz 1-v1 Returns on Japanese Yen +++++++++++++++++++++++++++++++++++++++++++++++

# Quiz 1-v1: Yen v Dollar  
yen <- getSymbols("DEXJPUS", src="FRED", auto.assign=FALSE)
yen <- na.omit(yen)
#yen <- yen["1979-12-31/2017-12-31"]
#yen <- yen["2012-01-03/2023-06-30"]
yeninv <- 1/yen

logret <- diff(log(yeninv$DEXJPUS))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)

# Sim1
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

# Sim2
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace=TRUE)
VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

HF_ES <- 1000 * (exp(ES) - 1)
round(HF_ES, 2)

# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret)
round(skewness(rvec),2) # -0.09, -0.08928404
round(kurtosis(rvec),2) # 15.43
jarque.test(rvec) # JB = 61330, p-value < 2.2e-16

hist(rvec,  col=rgb(1,0,0,1), breaks=100)

# Student T Distribution
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

alpha <- 0.01
set.seed(123789) 
library(metRology)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

# VaR and ES at 10-day horizon
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

# Sim1 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim2 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + sample(as.vector(logret), 100000, replace=TRUE)
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim3 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from=1, to=length(rdat)-9, by=1)
rpos <- sample(posn, 100000, replace=TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1  
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)


# Serial Correlation, Volatility Clustering, GARCH

acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)


# Quiz 1-v2: Pound v Dollar +++++++++++++++++++++++++++++++++++++++++++++++
pound <- getSymbols("DEXUSUK", src="FRED", auto.assign=FALSE)
pound <- na.omit(pound)
pound <- pound["1979-12-31/2017-12-31"]

logret <- diff(log(pound$DEXUSUK))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)

# Sim1
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

# Sim2
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace=TRUE)
VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

HF_ES <- 1000 * (exp(ES) - 1)
round(HF_ES, 2)

# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret)
round(skewness(rvec),2) # -0.09, -0.08928404
round(kurtosis(rvec),2) # 15.43
jarque.test(rvec) # JB = 61330, p-value < 2.2e-16

# Student T Distribution
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

alpha <- 0.01
set.seed(123789) 
library(metRology)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

# VaR and ES at 10-day horizon
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

# Sim1 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim2 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + sample(as.vector(logret), 100000, replace=TRUE)
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim3 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from=1, to=length(rdat)-9, by=1)
rpos <- sample(posn, 100000, replace=TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1  
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)


# Serial Correlation, Volatility Clustering, GARCH

acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)


# Quiz 1-v3: Swiss Franc v Dollarv +++++++++++++++++++++++++++++++++++++++++++++++
franc <- getSymbols("DEXSZUS", src="FRED", auto.assign=FALSE)
franc <- na.omit(franc)
franc <- franc["1979-12-31/2017-12-31"]
francinv <- 1/franc

logret <- diff(log(francinv$DEXSZUS))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)

# Sim1
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

# Sim2
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace=TRUE)
VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

HF_ES <- 1000 * (exp(ES) - 1)
round(HF_ES, 2)


# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret)
round(skewness(rvec),2) # -0.09, -0.08928404
round(kurtosis(rvec),2) # 15.43
jarque.test(rvec) # JB = 61330, p-value < 2.2e-16

# Student T Distribution
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

alpha <- 0.01
set.seed(123789) 
library(metRology)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

# VaR and ES at 10-day horizon
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

# Sim1 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim2 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + sample(as.vector(logret), 100000, replace=TRUE)
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim3 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from=1, to=length(rdat)-9, by=1)
rpos <- sample(posn, 100000, replace=TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1  
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Serial Correlation, Volatility Clustering, GARCH

acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)


# Quiz 1-v4: Australian Dollar v Dollar +++++++++++++++++++++++++++++++++++++++++++++++
aud <- getSymbols("DEXUSAL", src="FRED", auto.assign=FALSE)
aud <- na.omit(aud)
aud <- aud["1979-12-31/2017-12-31"]

logret <- diff(log(aud$DEXUSAL))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)

# Sim1
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

# Sim2
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace=TRUE)
VaR <- round(quantile(rvec, 0.01), 6); round(VaR, 6)
ES <- round(mean(rvec[rvec < VaR]), 6); round(ES, 6)

HF_ES <- 1000 * (exp(ES) - 1)
round(HF_ES, 2)


# Skewness, Kurtosis, Jarque-Bera test
library(moments)
rvec <- as.vector(logret)
round(skewness(rvec),2) # -0.09, -0.08928404
round(kurtosis(rvec),2) # 15.43
jarque.test(rvec) # JB = 61330, p-value < 2.2e-16

# Student T Distribution
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

alpha <- 0.01
set.seed(123789) 
library(metRology)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

# VaR and ES at 10-day horizon
library(MASS)
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t")
round(t.fit$estimate, 6)

# Sim1 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim2 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec + sample(as.vector(logret), 100000, replace=TRUE)
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Sim3 at 10-day horizon
alpha <- 0.01
RNGkind(sample.kind="Rounding")
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from=1, to=length(rdat)-9, by=1)
rpos <- sample(posn, 100000, replace=TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1  
}
VaR <- quantile(rvec, alpha); round(VaR, 6)
ES <- mean(rvec[rvec < VaR]); round(ES, 6)

# Serial Correlation, Volatility Clustering, GARCH

acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)



#-------------------------------------------------
# 2023.7.8 Sat DX Fund risk management
#-------------------------------------------------

library(quantmod)
library(moments)
library(metRology)
library(rugarch)
library(xts)

# https://site0.sbisec.co.jp/marble/fund/detail/achievement.do?Param6=102311207
# zoo objects
# xts is an extensible time series

library(dplyr)
#setwd(paste(getwd(), "/Downloads", sep=""))
#x <- read.csv("dx.csv", row.names=1)
x <- read.csv("dx.csv")
price <- x$price
dates <- as.Date(x$date)
x1 <- xts(price, order.by=dates)
names(x1) <- "price"
#x1 <- na.omit(x1)
#x1 <- x1["2020-08-03/2022-08-01"]
plot(x1)

logret <- diff(log(x1$price))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)


acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)

#-------------------------------------------------
# 2023.7.8 Sat CX Fund risk management
#-------------------------------------------------

# https://site0.sbisec.co.jp/marble/fund/detail/achievement.do?Param6=203315177
# zoo objects
# xts is an extensible time series

library(dplyr)
#setwd(paste(getwd(), "/Downloads", sep=""))
#x <- read.csv("cx.csv", row.names=1)
x <- read.csv("cx.csv")
price <- x$price
dates <- as.Date(x$date)
x1 <- xts(price, order.by=dates)
names(x1) <- "price"
#x1 <- na.omit(x1)
#x1 <- x1["2020-08-03/2022-08-01"]
plot(x1)

logret <- diff(log(x1$price))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)


acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)





#-------------------------------------------------
# 2023.7.8 Sat GX Fund risk management
#-------------------------------------------------

# https://www.smtam.jp/fund/detail/_id_510185/
# zoo objects
# xts is an extensible time series

library(dplyr)
#setwd(paste(getwd(), "/Downloads", sep=""))
#x <- read.csv("gx.csv", row.names=1)
x <- read.csv("gx.csv")
price <- x$price
dates <- as.Date(x$date)
x1 <- xts(price, order.by=dates)
names(x1) <- "price"
#x1 <- na.omit(x1)
#x1 <- x1["2020-08-03/2022-08-01"]
plot(x1)

logret <- diff(log(x1$price))[-1]
ret <- exp(logret) - 1

logret.w <- round(apply.weekly(logret, sum), 6)
logret.m <- round(apply.monthly(logret, sum), 6)
logret.q <- round(apply.quarterly(logret, sum), 6)
logret.y <- round(apply.yearly(logret, sum), 6)

ret.w <- round(exp(logret.w) - 1, 6)
ret.m <- round(exp(logret.m) - 1, 6)
ret.q <- round(exp(logret.q) - 1, 6)
ret.y <- round(exp(logret.y) - 1, 6)

mu <- mean(logret); round(mu, 6)
sig <- sd(logret); round(sig, 6)
VaR <- qnorm(0.01, mu, sig); round(VaR, 6)
HF_VaR <- 1000 * (exp(VaR) - 1)
ES <- mu - sig * dnorm(qnorm(0.01, 0, 1), 0, 1)/0.01; round(ES, 6)
HF_ES <- 1000 * (exp(ES) - 1)


acf(logret)
acf(abs(logret))

library("rugarch")

uspec <- ugarchspec(variance.model=list(mode="sGARCH", garchOrder=c(1,1)),
                    mean.model=list(armaOrder=c(0,0), include.mean=TRUE),
                    distribution.model="std")
fit.garch <- ugarchfit(spec=uspec, data=logret[,1])
save1 <- cbind(logret[,1], fit.garch@fit$sigma, fit.garch@fit$z)
names(save1) <- c("logret", "s", "z")
param1 <- fit.garch@fit$coef
acf(save1$z)
acf(abs(save1$z))


set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method=c("Partial", "Full")[1],
                         sampling="raw",
                         n.ahead=1,
                         n.bootpred=100000,
                         solver="solnp")
rvec <- boot.garch@fseries

VaR <- quantile(rvec, 0.05)
ES <- mean(rvec[rvec < VaR])
round(VaR, 6)
round(ES, 6)


#-------------------------------------------------
# 2023.7.13 SpO2 data during sufferring COVID
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("SpO2.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(mfrow=c(1,1))
par(mfrow=c(3,1), mar=c(4,4,2,1))
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
spo2 <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(90, 100), xlab="日時", main="酸素飽和度[SpO2]", pch=19, col=rgb(0,1,0,0.5))
abline(h=95)
abline(h=mean(x2$data2[30:41]), lty="dashed", col=rgb(0,1,0,0.5))
text(x=x2$date3[5], y=mean(x2$data2[30:41]+0.1), label=paste("平常時", round(mean(x2$data2[30:41]),1), sep=" "))

#-------------------------------------------------
# 2023.7.13 Heart rate data during sufferring COVID
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("bpm.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
bpm <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(50, 150), xlab="日時", main="心拍数[bpm]", pch=19, col=rgb(1,0,0,0.5))
abline(h=100)
abline(h=mean(x2$data2[30:41], na.rm=TRUE), lty="dashed", col=rgb(1,0,0,0.5))
text(x=x2$date3[5], y=mean(x2$data2[30:41]+0.1, na.rm=TRUE), label=paste("平常時", round(mean(x2$data2[30:41], na.rm=TRUE),1), sep=" "))


#-------------------------------------------------
# 2023.7.13 Body Temp data during sufferring COVID
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("Temp.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}


x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
btemp <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(36, 40), xlab="日時", main="体温[C]", pch=19, col=rgb(0,0,1,0.5))
abline(v=as.POSIXct("2023-07-13 16:48:00"))
abline(v=as.POSIXct("2023-07-14 03:35:00"))
abline(v=as.POSIXct("2023-07-14 12:10:00"))
abline(v=as.POSIXct("2023-07-14 20:46:00"))
abline(v=as.POSIXct("2023-07-15 04:53:00"))
abline(v=as.POSIXct("2023-07-15 14:46:00"))
abline(v=as.POSIXct("2023-07-15 21:21:00"))
abline(v=as.POSIXct("2023-07-16 09:20:00"))
abline(v=as.POSIXct("2023-07-15 16:22:00"), col="red")
abline(v=as.POSIXct("2023-07-16 15:26:00"))

#abline(h=38) 
abline(h=37)
text(x=as.POSIXct("2023-07-15 17:00:00"), y=40, label=("Xocova"), col="red")
#text(x=x2$date3[5], y=37.3, label=("37C"))
abline(h=mean(x2$data2[38:49], na.rm=TRUE), lty="dashed", col=rgb(0,0,1,0.5))
text(x=x2$date3[5], y=mean(x2$data2[38:49]+0.1, na.rm=TRUE), label=paste("平常時", round(mean(x2$data2[38:49], na.rm=TRUE),1), sep=" "))


#-------------------------------------------------
# 2023.7.15 Body Temp data during sufferring COVID
#-------------------------------------------------


bpm$typ <- "bpm"
spo2$typ <- "spo2"
btemp$typ <- "btemp"

#bpm$normal <- (bpm$data2 - mean(bpm$data2))/sd(bpm$data2)
#btemp$normal <- (btemp$data2 - mean(btemp$data2))/sd(btemp$data2)
#spo2$normal <- (spo2$data2 - mean(spo2$data2))/sd(spo2$data2)


x <- rbind(bpm, spo2, btemp)

library(ggplot2)
library(plotly)
g <- ggplot(x, aes(x=date3, y=data2, color=typ))
p <- g + geom_point() + geom_line() 
#p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation" )
#p <- p + ylim(0, 6.0)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=c(5.0*0.97, 5.0*1.03), linetype="dotted", color="grey")
#p <- p + geom_hline(yintercept=c(0.9*0.97, 0.9*1.03), linetype="dotted", color="grey")
#p <- p + geom_hline(yintercept=c(3.3*0.97, 3.3*1.03), linetype="dotted", color="grey")
#p <- p + geom_hline(yintercept=c(1.5*0.97, 1.5*1.03), linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=0.5, linetype="dotted", color="grey")
p <- p + geom_vline(xintercept=as.POSIXct("2023-07-15 16:22:00"), linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="grey")
#p <- p + facet_grid(VM~subject)
ggplotly(p, dynamicTicks = TRUE)
#ggplotly(p) %>%
#  layout(xaxis = list(autorange = TRUE),
#         yaxis = list(autorange = TRUE))


#-------------------------------------------------
# 2023.7.16 Log return
#-------------------------------------------------

ret <- seq(-1, 3, by=0.1)
logret <- log(ret+1)
par(mfrow=c(1,1))
plot(x=ret, y=logret, pch=19, col=rgb(0,0,1,0.5))

x <- data.frame(ret)
x$logret <- logret

library(ggplot2)
library(plotly)
g <- ggplot(x, aes(x=ret, y=logret))
p <- g + geom_point() + geom_line() 
#p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation" )
#p <- p + ylim(0, 6.0)
#p <- p + xlim(0, 3.0)
#p <- p + facet_grid(VM~subject)
ggplotly(p)




#-------------------------------------------------
# 2023.7.21 SpO2 data during sufferring COVID for Wife
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("SpO2_w.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(mfrow=c(1,1))
par(mfrow=c(3,1), mar=c(4,4,2,1))
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
spo2 <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(90, 100), xlab="日時", main="酸素飽和度[SpO2]", pch=19, col=rgb(0,1,0,0.5))
abline(h=95)
abline(h=mean(x2$data2[7:22]), lty="dashed", col=rgb(0,1,0,0.5))
text(x=x2$date3[5], y=mean(x2$data2[7:22])+0.1, label=paste("平常時", round(mean(x2$data2[7:22]),1), sep=" "))

#-------------------------------------------------
# 2023.7.21 Heart rate data during sufferring COVID for Wife
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("bpm_w.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}

x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
bpm <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(50, 150), xlab="日時", main="心拍数[bpm]", pch=19, col=rgb(1,0,0,0.5))
abline(h=100)
abline(h=mean(x2$data2[7:22]), lty="dashed", col=rgb(1,0,0,0.5))
text(x=x2$date3[5], y=mean(x2$data2[7:22])+0.1, label=paste("平常時", round(mean(x2$data2[7:22]),1), sep=" "))

#-------------------------------------------------
# 2023.7.21 Body Temp data during sufferring COVID for Wife
#-------------------------------------------------

#setwd(paste(getwd(), "/Downloads", sep=""))
x <- read.csv("Temp_w.csv")
x1 <- x[8]


library(stringr)
library(lubridate)

#setwd(paste(getwd(), "/Downloads", sep=""))

# Humid data
#x <- read.csv("generatedBy_react-csv (2).csv", header=TRUE)

x1 = x[,c(2,8,9)]

date2 = 1:1:dim(x1)[1]
for (i in 1:dim(x1)[1]) {
  temp <- unlist(strsplit(x1$date[i], " "))[c(1,3)]
  date2[i] <- paste(temp[1], temp[2])
}


x1$date3 <- ymd_hm(date2, tz=Sys.timezone())
x2 <- subset(x1, date3 > "2023-7-13 01:06:00")
par(family = "HiraKakuProN-W3")
x2$data2 <- as.numeric(x2$data)
x2 <- x2[order(x2$date3),]
btemp <- na.omit(x2)
plot(x2$date3, x2$data2, typ="b", frame=FALSE, ylim=c(35, 40), xlab="日時", main="体温[C]", pch=19, col=rgb(0,0,1,0.5))
abline(h=37)
abline(h=mean(x2$data2[7:22]), lty="dashed", col=rgb(0,0,1,0.5))
text(x=x2$date3[5], y=mean(x2$data2[7:22])+0.1, label=paste("平常時", round(mean(x2$data2[7:22]),1), sep=" "))


#-------------------------------------------------
# 2023.7.24 Body Temp data during sufferring COVID for wife
#-------------------------------------------------


bpm$typ <- "bpm"
spo2$typ <- "spo2"
btemp$typ <- "btemp"

#bpm$normal <- (bpm$data2 - mean(bpm$data2))/sd(bpm$data2)
#btemp$normal <- (btemp$data2 - mean(btemp$data2))/sd(btemp$data2)
#spo2$normal <- (spo2$data2 - mean(spo2$data2))/sd(spo2$data2)


x <- rbind(bpm, spo2, btemp)

library(ggplot2)
library(plotly)
g <- ggplot(x, aes(x=date3, y=data2, color=typ))
p <- g + geom_point() + geom_line() 
p <- p + facet_grid(unit~.)
p <- p + labs(y="酸素飽和度、体温、心拍数", x="日付", title="えつこの生体データ" )
#p <- p + geom_vline(xintercept=as.POSIXct("2023-07-22"), linetype="dotted", color="grey")
ggplotly(p, dynamicTicks = TRUE)


#-------------------------------------------------
# 2023.10.13 Calculate IRR with R
#-------------------------------------------------

install.packages("FinancialMath")
library(FinancialMath)

IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6))
IRR(cf0=94.9,cf=c(0,0,0,0,0,0,0,0,0,0,0,0,100),times=c(1,2,3,4,5,6,7,8,9,10,11,12,13))
IRR(94.9, c(100*12/13, 100*1/13), c(1,2))


NPV<-function(paym,pdates,IRR){
  ptimes<-as.Date(pdates)-min(as.Date(pdates))
  ptimes<-as.numeric(ptimes,units="days")/365.25
  NPV<-sum(paym*(1+IRR)^{-ptimes})
  NPV
}

nlm(function(p){NPV(c(lumpsum,df$pmts),c(today,df$date),p)^2},p=0.1)

IRR(cf0=95.92,cf=c(2.5, 2.5, 2.5, 2.5, 2.5, 100),times=c(1,1,2,2,3,3)) * 36/30

IRR(cf0=94.9, cf=c(0, 100), times=c(1, 2)) * 24/13
IRR(cf0=93.85, cf=c(0, 100), times=c(1, 2)) * 24/16
IRR(cf0=96.18, cf=c(1, 1, 100), times=c(1, 1, 2)) * 24/16
IRR(cf0=95.14, cf=c(1, 1, 1, 100), times=c(1, 1,  2, 2)) * 24/22
IRR(cf0=95.14, cf=c(1, 1, 1, 100), times=c(1, 1,  2, 2)) 

annuity.arith(pv=NA,fv=NA,n=20,p=100,q=4,i=.03,ic=1,pf=2,imm=TRUE) # arithなので等差数列
annuity.geo(pv=100,fv=NA,n=10,p=1,i=.05,pf=2, plot=TRUE) #2023.10.17, geoなので等比数列？

bond(f=100,r=.05,c=110,n=10,i=.06,ic=1,cf=2,t=5, plot=TRUE)



#-------------------------------------------------
# 2023.11.3 Days to US presidential election
#-------------------------------------------------

library(lubridate)
as.Date("2024-11-3") - as.Date("2023-11-3")

#-------------------------------------------------
# 2023.12.17 Cashflow since 2016
#-------------------------------------------------
date <- as.Date(c("2016-3-15", "2017-1-4", "2017-7-22", "2017-9-9", "2017-9-24", "2017-10-18", 
         "2017-12-24", "2018-1-7", "2018-7-14", "2018-11-26", "2018-12-26", "2019-8-13", "2020-1-25", 
         "2020-12-21", "2021-3-13", "2021-6-25", "2022-1-1", "2022-4-24", "2022-8-12", "2022-10-26", 
         "2023-5-4", "2023-5-27", "2023-8-14", "2023-9-23", "2023-12-17", "2024-4-27"))
cash <- c(28677188, 29473828, 29908813, 29782296, 29914647, 30270376, 30964870, 30960388, 30936858, 
          30639954, 31149954, 31575563, 31894967, 32805918, 33248272, 34168764, 34959381, 35276540,
          35960493, 36519897, 36892553, 36985396, 38569181, 38426654, 38739293, 40046317)

cf <- data.frame(cash)
cf$date <- date

library(ggplot2)
library(plotly)
g <- ggplot(cf, aes(x=date, y=cash))
p <- g + geom_point() + geom_line() 
#p <- p + facet_grid(unit~.)
#p <- p + labs(y="酸素飽和度、体温、心拍数", x="日付", title="えつこの生体データ" )
#p <- p + geom_vline(xintercept=as.POSIXct("2023-07-22"), linetype="dotted", color="grey")
p <- p + ylim(0, 100000000)
#p <- p + xlim(0, 3.0)
#p + scale_y_continuous(limits=c(25000000, 40000000, 10000000))
ggplotly(p, dynamicTicks = TRUE)

#-------------------------------------------------
# 2024.2.13 Health check data analyses
#-------------------------------------------------

par(mfrow=c(2,1))
year <- c(2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
HbA1c <- c(NA, 5.4, 5.3, 5.4, 5.4, 5.3, 5.5, 5.5, 5.3, 5.6, 5.5, 5.6)
#plot(y=year, x=HbA1c)

plot(x=year, y=HbA1c, typ="b", frame=FALSE, ylim=c(5, 6), main="Hemoglobin A1c", pch=19, col=rgb(1,0,0,0.5))
abline(h=5.6, col="red", lty="dashed")
#abline(h=mean(x2$data2[7:22]), lty="dashed", col=rgb(1,0,0,0.5))


LDL <- c(103, 95, 108, 106, 98, 99, 95, 115, 106, 120, 119, 119)
plot(x=year, y=LDL, typ="b", frame=FALSE, ylim=c(90, 130), main="LDL, low-density lipoprotein", sub="the bad cholesterol because a high LDL level leads to a buildup of cholesterol in your arteries.", pch=19, col=rgb(1,0,0,0.5))
abline(h=119, col="red", lty="dashed")

#-------------------------------------------------
# 2024.2.23 Calculate increase rate 
#-------------------------------------------------

name <-c('SP', 'NQ', 'DX', 'NK', 'SSE', "SENSEX", 'KOSPI', 'JPY', 'EUR', 'CNY')
date <- c('2024-1-19', '2024-2-23')
d1 <- c(4839, 15310, 16555, 35963, 2832, 71767, 2472, 148, 0.92, 7.1)
d2 <- c(5087, 16041, 17370, 39098, 2985, 73158, 2676, 151, 0.92, 7.2)
s <- data.frame(cbind(d1, d2))
colnames(s) <- date
rownames(s) <- name

s$rate = round(s$`2024-2-23`/s$`2024-1-19`, 2)
s



# ------------------------------------------------
# 2024.5.12 financial analyses
# ------------------------------------------------
library(dplyr)
library(mongolite)
library(tidyr)
library(ggplot2)
library(plotly)
#m <- mongo("inputs", url = "mongodb+srv://cage:cage32044@cluster0.5iz8q.gcp.mongodb.net/conFusion")
m <- mongo("proinputs", url = "mongodb+srv://cage:cage32044@cluster0.5iz8q.gcp.mongodb.net/conFusion")
m$count('{}')
alldata <- m$find('{}')
pro <- subset(alldata, user=="6300b4a89de5d01630d2f4b1")
dw <- subset(pro, place=="大和")[, c(1, 5:13)]
dw_tnote <- subset(dw, reason=="T.NOTE2501")

date <- as.Date(dw_tnote$date)
price <- as.numeric(dw_tnote$condition3)
fx <- as.numeric(dw_tnote$condition5)
total <- as.numeric(gsub(",", "", dw_tnote$condition7))
profit <- as.numeric(gsub(",", "", dw_tnote$condition8)) 
data <- cbind(data.frame(date, price, fx, total, profit))

g <- ggplot(data, aes(x=date, y=fx)) 
p <- g + geom_point() + geom_line() 
#p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: M" )
#p <- p + ylim(0, 1000000)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
#p <- p + facet_grid(VM~.)
ggplotly(p)



mch = subset(rohm, subject=="出力電圧M" & unit=="Vrms")
mch$reason = as.numeric(gsub("A$", "", mch$reason))
mch$data <- as.numeric(mch$data)
mch$VM <- c(32,32,32,32,32,7,7,7,7,7,7)
g <- ggplot(mch, aes(x=reason, y=data, color=factor(VM))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Vout[V]", x="load[A]", title="Load Regulation: M" )
p <- p + ylim(0, 6)
p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=c(5*0.97, 5*1.03), linetype="dotted", color="red")
p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(VM~.)
ggplotly(p)


# ------------------------------------------------
# 2024.6.2 franch bond data analyses
# ------------------------------------------------
library(dplyr)
library(mongolite)
library(tidyr)
library(ggplot2)
library(plotly)
#m <- mongo("inputs", url = "mongodb+srv://cage:cage32044@cluster0.5iz8q.gcp.mongodb.net/conFusion")
m <- mongo("proinputs", url = "mongodb+srv://cage:cage32044@cluster0.5iz8q.gcp.mongodb.net/conFusion")
m$count('{}')
alldata <- m$find('{}')
pro <- subset(alldata, user=="6300b4a89de5d01630d2f4b1")

fx <- subset(pro, reason=="Fx study" & person=="Data")[, c(1, 6:7)]
f_bond <- subset(pro, subject=="France" | subject=="Germany" | subject=="US Treasurys")[, c(1, 4, 6:12)]
colnames(f_bond) <- c("date", "nation", "1", "2", "5", "10", "30", "Rate", "Core_CPI_YoY")
f_bond2 <- f_bond %>% gather(Maturity, Interest , -c(date, nation, Rate, Core_CPI_YoY)) 

f_bond2$date <- as.Date(f_bond2$date)
f_bond2$Maturity <- as.numeric(f_bond2$Maturity)
f_bond2$Interest <- as.numeric(f_bond2$Interest)
f_bond2$Rate <- as.numeric(f_bond2$Rate)

fx$date <- as.Date(fx$date)
fx$usjp <- as.numeric(fx$condition1)
fx$eujp <- as.numeric(fx$condition2)

# g <- ggplot(f_bond2, aes(x=date, y=Interest, color=factor(Maturity))) 
# p <- g + geom_point() + geom_line() 
# p <- p + labs(y="Interest[%]", x="Date", title="Interest change" )
# p <- p + ylim(0, 6)
# #p <- p + xlim(0, 3.0)
# #p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
# #p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
# p <- p + facet_grid(.~nation)
# ggplotly(p)
# 
# g <- ggplot(f_bond2, aes(x=Maturity, y=Interest, color=factor(date))) 
# p <- g + geom_point() + geom_line() 
# p <- p + labs(y="Interest[%]", x="Maturity[years]", title="Yield Curve" )
# p <- p + ylim(0, 6)
# #p <- p + xlim(0, 3.0)
# #p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
# #p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
# p <- p + facet_grid(.~nation)
# ggplotly(p)


j_bond <- subset(pro, subject=="Yen" & person=="Data")[, c(1, 4, 12:14)]
j_bond$`1` <- NA
j_bond$`2` <- NA
j_bond$`30` <- NA
j_bond$Rate <- subset(pro, subject=="Yen" & person=="Data")[, 18]
j_bond$Core_CPI_YoY <- subset(pro, subject=="Yen" & person=="Data")[, 20]
colnames(j_bond) <- c("date", "nation", "3", "5", "10", "1", "2", "30", "Rate", "Core_CPI_YoY")
j_bond2 <- j_bond[,c(1,2,6,7,3, 4, 5 ,8,9,10)]

f_bond3 <- f_bond[, c(1:4)]  
#View(f_bond3)
f_bond3$`3` <- NA
f_bond3[, c(6:10)] <- f_bond[, c(5:9)]

bond <- rbind(f_bond3, j_bond2)
bond2 <- bond %>% gather(Maturity, Interest , -c(date, nation, Rate, Core_CPI_YoY))
#bond2 <- bond %>% gather(Maturity, Interest , -c(date, nation, Rate))
bond2$date <- as.Date(bond2$date)
bond2$Maturity <- as.numeric(bond2$Maturity)
bond2$Interest <- as.numeric(bond2$Interest)
bond2$Core_CPI_YoY <- as.numeric(bond2$Core_CPI_YoY)
bond2$Rate <- as.numeric(bond2$Rate)

g <- ggplot(bond2, aes(x=date, y=Interest, color=factor(Maturity))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Interest[%]", x="Date", title="Interest change" )
p <- p + ylim(0, 6)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(.~nation)
ggplotly(p)  # -- NA represents Core_CPI_YoY

g <- ggplot(bond2, aes(x=Maturity, y=Interest, color=factor(date))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Interest[%]", x="Maturity[years]", title="Yield Curve" )
p <- p + ylim(0, 6)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(.~nation)
ggplotly(p)






# ------------------------------------------------
# 2024.6.16 adding CPI on the interest change
# ------------------------------------------------

bond <- rbind(f_bond3, j_bond2)
bond2 <- bond %>% gather(Maturity, Interest , -c(date, nation, Rate))
bond2$date <- as.Date(bond2$date)
bond2$Maturity <- as.numeric(bond2$Maturity)
bond2$Interest <- as.numeric(bond2$Interest)
#bond2$Core_CPI_YoY <- as.numeric(bond2$Core_CPI_YoY)
bond2$Rate <- as.numeric(bond2$Rate)

length_Core_CPI_YoY <- dim(bond)[1]

start <- dim(bond2)[1] - length_Core_CPI_YoY
end <- dim(bond2)[1]
bond2$Maturity[start:end] <- "Core_CPI_YoY"

g <- ggplot(bond2, aes(x=date, y=Interest, color=factor(Maturity))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Interest[%]", x="Date", title="Interest change" )
p <- p + ylim(0, 6)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(.~nation)
ggplotly(p)

# どこかでUS TreasurysのNAと30が入れ替わっているので、修正が必要





# ------------------------------------------------
# 2024.6.18 adding CPI on the interest change
# ------------------------------------------------

fx2 <- fx[,c(1,4,5)]
fx3 <- gather(fx2, type, Interest, -date)

bond3 <- subset(bond2, Maturity==10)
bond4 <- bond3[order(bond3$date),]
bond5 <- bond4[,c(1,2,5)]
#bond5 <- rbind(bond5, fx3)
#bond5 %>% spread(nation, Interest)
#bond5 %>% group_by(date) %>% filter(nation=="US Treasurys")
#bond5 %>% group_by(date) %>% group_vars()
#bond5 %>% group_by(date) %>% mutate(Yen2 = filter(nation=="Yen"))
#bond5 %>% group_by(date) %>% spread(Interest, nation)
bond6 <- bond5 %>% group_by(date) %>% spread(nation, Interest)                                    
bond7 <- mutate(bond6, eujp=Germany-Yen, usjp=`US Treasurys`-Yen)

bond8 <- bond7[,c(1,6,7)] %>% gather(type, Interest, -date, na.rm=TRUE)
#bond8 <- bond7[,c(1,2,6,8:9)] %>% gather(type, Interest, -c(date,EUR, USD), na.rm=TRUE)
#bond9 <- bond8 %>% gather(type, Interest, -c(date, type))
bond8$case <- "Interest"
fx3$case <- "Fx"
bond9 <- rbind(bond8, fx3)

g <- ggplot(bond9, aes(x=date, y=Interest, color=factor(type))) 
p <- g + geom_point() + geom_line() 
p <- p + labs(y="Interest[%]", x="Date", title="10 year bond yield gap" )
#p <- p + ylim(0, 6)
#p <- p + xlim(0, 3.0)
#p <- p + geom_hline(yintercept=2575163, linetype="dotted", color="grey")
#p <- p + geom_vline(xintercept=2.5, linetype="dotted", color="red")
p <- p + facet_grid(case~type)
ggplotly(p, dynamicTicks = TRUE)





# ------------------------------------------------
# 2024.7.17 Rohm
# ------------------------------------------------

d <- c(4.94, 1.11, 3.29, 1.49)
s <- c(5, 1.1, 3.3, 1.5)
round((d/s - 1) * 100, 1)

d <- c(2.03, 2.25, 1.47, 2.02)
s <- c(2,2.2,2,2)
round((d/s - 1) * 100, 1)

d <- c(338,328,326,330)
s <- c(900,900,900,900)
round((d/s - 1) * 100, 1)



# ------------------------------------------------
# 2024.9.7 Device Review materials
# ------------------------------------------------

library(plotly)
ch <- c("M","M","A","A","B","B","LDO","LDO")
in <- c(7,39,3,5.5,3,5.5,1.0,3.3)
out <- c(3,5.5,0.8,3.5,0.8,3.5,0.8,2.5)
cur <- c(0,2.5,0,1.3,0,2.5,0,0.75)
temp <- c(-25,25,150)


ch <- data.frame(c("M","M"))
vin <- data.frame(c(7,39))
vout <- data.frame(c(3,5.5))
cur <- data.frame(c(0,2.5))
temp <- data.frame(c(-25,150))

m <- cbind(ch, vin, vout, cur, temp)
names(m) <- c("ch", "vin", "vout", "cur", "temp")

#dm <- m %>% gather(name, data, -ch)
dm <- expand.grid(vin = m$vin, vout=m$vout, cur=m$cur, temp=m$temp)



# ------------------------------------------------------

library(ggplot2)
library(patchwork)

mout <- data.frame(
  vin = c(7, 7, 40, 40),    
  vout = c(3, 5.5, 5.5, 3)  
)

mcur <- data.frame(
  vin = c(7, 7, 8,   8,   9, 9, 10, 10,  40, 40, 40), 
  cur = c(0, 1, 1, 1.5, 1.5, 2,  2, 2.5, 2.5, 2.5, 0) 
) 


# Create two polygon plots (same as above)
moutp <- ggplot(mout, aes(x = vin, y = vout)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  labs(title = "Mch") +
  xlim(0, 40) +
  ylim(0, 6) +
  theme_minimal()

mcurp <- ggplot(mcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  xlim(0, 40) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

aout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

acur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 1.3, 1.3, 0) 
) 

# Create two polygon plots (same as above)
aoutp <- ggplot(aout, aes(x = vin, y = vout)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  labs(title = "Ach") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

acurp <- ggplot(acur, aes(x = vin, y = cur)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

bout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

bcur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 2.5, 2.5, 0) 
) 

# Create two polygon plots (same as above)
boutp <- ggplot(bout, aes(x = vin, y = vout)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  labs(title = "Bch") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

bcurp <- ggplot(bcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = "lightblue", color = "lightblue") +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()


# Use patchwork to arrange plots vertically
combined_plot <- (moutp |aoutp | boutp) / (mcurp | acurp | bcurp)  # 2x2 layout
combined_plot


# =============================================================

library(ggplot2)
library(patchwork)

mout <- data.frame(
  vin = c(7, 7, 40, 40),    
  vout = c(3, 5.5, 5.5, 3)  
)

mout_points1 <- data.frame(
  vin = c(7, 32),    
  vout = c(5, 5)
  #type = c()
)

mout_points2 <- data.frame(
  vin = c(7, 8, 9, 10, 40, 7, 8, 9, 10, 40),    
  vout = c(5, 5, 5, 5, 5, 3, 3, 3, 3, 3)  
)

mout_points3 <- data.frame(
  vin = c(10, 32, 40),    
  vout = c(5, 5, 3)  
)


mcur <- data.frame(
  vin = c(7, 7, 8,   8,   9, 9, 10, 10,  32, 32, 32), 
  cur = c(0, 1, 1, 1.5, 1.5, 2,  2, 2.5, 2.5, 2.5, 0) 
) 

mcur_points1 <- data.frame(
  vin = c(rep(7, 11), rep(32, 26)),    
  cur = c(seq(0, 1, by=0.1), seq(0, 2.5, by=0.1))  
)

mcur_points2 <- data.frame(
  vin = c(rep(7, 11), rep(8, 16), rep(9, 21), rep(10, 26), rep(35, 26), rep(37, 26), rep(39, 26)),    
  cur = c(seq(0, 1, by=0.1), seq(0, 1.5, by=0.1), seq(0, 2, by=0.1), seq(0, 2.5, by=0.1), seq(0, 2.5, by=0.1), seq(0, 2.5, by=0.1), seq(0, 2.5, by=0.1))  
)

mcur_points3 <- data.frame(
  vin = c(rep(10, 6), rep(32, 6)),    
  cur = c(seq(2, 2.5, by=0.1), seq(2, 2.5, by=0.1))  
)


# Create two polygon plots (same as above)
moutp <- ggplot(mout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=mout_points1, aes(x=vin, y=vout), color="blue", size=3, alpha=0.3) +
  geom_point(data=mout_points2, aes(x=vin, y=vout), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=mout_points3, aes(x=vin, y=vout), color="lightpink", size=5, alpha=0.3) +
  labs(title = "Mch") +
  xlim(0, 40) +
  ylim(0, 6) +
  theme_minimal()

mcurp <- ggplot(mcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=mcur_points1, aes(x=vin, y=cur), color="blue", size=3, alpha=0.3) +
  geom_point(data=mcur_points2, aes(x=vin, y=cur), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=mcur_points3, aes(x=vin, y=cur), color="lightpink", size=5, alpha=0.3) +
  xlim(0, 40) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

aout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

aout_points1 <- data.frame(
  vin = 5,    
  vout = 1.1  
)

aout_points2 <- data.frame(
  vin = c(3, 5),
  vout = c(0.8, 3.5)
)

aout_points3 <- data.frame(
  vin = c(5),    
  vout = c(3.5)  
)

acur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 1.3, 1.3, 0) 
) 

acur_points1 <- data.frame(
  vin = c(rep(5, 14)),    
  cur = c(seq(0, 1.3, by=0.1))  
)

acur_points2 <- data.frame(
  vin = c(rep(3, 14), rep(5, 14)),    
  cur = c(seq(0, 1.3, by=0.1), seq(0, 1.3, by=0.1))  
)

acur_points3 <- data.frame(
  vin = c(rep(5, 3)),   
  cur = c(seq(1.1, 1.3, by=0.1))  
)

# Create two polygon plots (same as above)
aoutp <- ggplot(aout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=aout_points1, aes(x=vin, y=vout), color="blue", size=3, alpha=0.3) +
  geom_point(data=aout_points2, aes(x=vin, y=vout), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=aout_points3, aes(x=vin, y=vout), color="lightpink", size=5, alpha=0.3) +
  labs(title = "Ach") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

acurp <- ggplot(acur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=acur_points1, aes(x=vin, y=cur), color="blue", size=3, alpha=0.3) +
  geom_point(data=acur_points2, aes(x=vin, y=cur), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=acur_points3, aes(x=vin, y=cur), color="lightpink", size=5, alpha=0.3) +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

bout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

bout_points1 <- data.frame(
  vin = 5,    
  vout = 3.3  
)

bout_points2 <- data.frame(
  vin = c(3, 5),
  vout = c(0.8, 3.5)
)

bout_points3 <- data.frame(
  vin = c(3),
  vout = c(0.8)
)

bcur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 2.5, 2.5, 0) 
) 

bcur_points1 <- data.frame(
  vin = c(rep(5, 26)),    
  cur = c(seq(0, 2.5, by=0.1))  
)

bcur_points2 <- data.frame(
  vin = c(rep(3, 26), rep(5, 26)),    
  cur = c(seq(0, 2.5, by=0.1), seq(0, 2.5, by=0.1))  
)

bcur_points3 <- data.frame(
  vin = c(rep(3, 4)),   
  cur = c(seq(3.3, 3.6, by=0.1))  
)

# Create two polygon plots (same as above)
boutp <- ggplot(bout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=bout_points1, aes(x=vin, y=vout), color="blue", size=3, alpha=0.3) +
  geom_point(data=bout_points2, aes(x=vin, y=vout), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=bout_points3, aes(x=vin, y=vout), color="lightpink", size=5, alpha=0.3) +
  labs(title = "Bch") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

bcurp <- ggplot(bcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA, color = "lightblue") +
  geom_point(data=bcur_points1, aes(x=vin, y=cur), color="blue", size=3, alpha=0.3) +
  geom_point(data=bcur_points2, aes(x=vin, y=cur), color="lightblue", size=5, alpha=0.3) +
  geom_point(data=bcur_points3, aes(x=vin, y=cur), color="lightpink", size=5, alpha=0.3) +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()


# Use patchwork to arrange plots vertically
combined_plot <- (moutp |aoutp | boutp) / (mcurp | acurp | bcurp)  # 2x2 layout
combined_plot


# 
# 
# boutp_plotly <- ggplotly(boutp)
# bcurp_plotly <- ggplotly(bcurp)  
#   
# b_plotly <- subplot(boutp_plotly, bcurp_plotly, nrows=2)
# b_plotly
# 


# ------------------------------------------------------
# 3d polygon of a surface using plotly created by ChatGPT
# ------------------------------------------------------
# Install and load required packages if not already installed
# install.packages("plotly")

library(plotly)

# Define vertices of the 3D polygon
polygon_data <- data.frame(
  x = c(1, 2, 3, 4, 1),  # x coordinates of vertices
  y = c(1, 4, 3, 2, 1),  # y coordinates of vertices
  z = c(0, 1, 3, 1, 0)   # z coordinates of vertices
)

# Create a 3D polygon plot using plotly
plot_ly(
  x = polygon_data$x, 
  y = polygon_data$y, 
  z = polygon_data$z, 
  type = "scatter3d", 
  mode = "lines",        # Connects the points with lines
  fill = "toself",       # Fills the polygon
  fillcolor = "lightblue", 

) %>%
  layout(
    scene = list(
      xaxis = list(title = "X Axis"),
      yaxis = list(title = "Y Axis"),
      zaxis = list(title = "Z Axis")
    ),
    title = "3D Polygon"
  )



# ------------------------------------------------------
# 3d polygon of a cube using plotly created by ChatGPT
# ------------------------------------------------------
library(plotly)

# Define the vertices of the cube (8 vertices)
x <- c(0, 1, 1, 0, 0, 1, 1, 0)
y <- c(0, 0, 1, 1, 0, 0, 1, 1)
z <- c(0, 0, 0, 0, 1, 1, 1, 1)

# Define the rectangular faces using two triangles each
i <- c(0, 0, 1, 1, 4, 4, 5, 5, 0, 0, 3, 3)  # first vertex of each triangle
j <- c(1, 3, 2, 5, 5, 7, 6, 2, 4, 7, 2, 6)  # second vertex of each triangle
k <- c(3, 4, 5, 2, 7, 6, 2, 6, 7, 6, 6, 7)  # third vertex of each triangle

# Create a 3D mesh plot for the cube, using rectangles (2 triangles per rectangle)
plot_ly(
  x = 5*x+3, 
  y = 3.5*y+0.8, 
  z = 1.3*z, 
  i = i, 
  j = j, 
  k = k, 
  type = "mesh3d",  # Use mesh3d to fill the faces
  color = "grey",  # Color of the cube
  opacity = 1  # Adjust transparency for better visualization
) %>%
  layout(
    scene = list(
      xaxis = list(title = "Vin"),
      yaxis = list(title = "Vout"),
      zaxis = list(title = "Current")
    ),
    title = "Cube Using Rectangular Faces (Defined with Triangles)"
  )


library(plotly)

# Define the vertices of the cube (8 vertices)
x <- c(0, 1, 1, 0, 0, 1, 1, 0)
y <- c(0, 0, 1, 1, 0, 0, 1, 1)
z <- c(0, 0, 0, 0, 1, 1, 1, 1)

# Define the rectangular faces using two triangles each
i <- c(0, 0, 1, 1, 4, 4, 5, 5, 0, 0, 3, 3)  # first vertex of each triangle
j <- c(1, 3, 2, 5, 5, 7, 6, 2, 4, 7, 2, 6)  # second vertex of each triangle
k <- c(3, 4, 5, 2, 7, 6, 2, 6, 7, 6, 6, 7)  # third vertex of each triangle
# Create the 3D plot using plotly's mesh3d
plot <- plot_ly(
  type = 'mesh3d',
  x = x,
  y = y,
  z = z,
  i = i,  # Vertex indices for triangle 1
  j = j,  # Vertex indices for triangle 2
  k = k,  # Vertex indices for triangle 3
  facecolor = rep("red", length(i)),  # Same color for all triangles
  opacity = 1                       # Optional transparency
)

plot


# ------------------------------------------------------
# Vout and Current spec for print
# ------------------------------------------------------

library(ggplot2)
library(patchwork)

mout <- data.frame(
  vin = c(7, 7, 40, 40),    
  vout = c(3, 5.5, 5.5, 3)  
)

mcur <- data.frame(
  vin = c(7, 7, 8,   8,   9, 9, 10, 10,  40, 40, 40), 
  cur = c(0, 1, 1, 1.5, 1.5, 2,  2, 2.5, 2.5, 2.5, 0) 
) 


# Create two polygon plots (same as above)
moutp <- ggplot(mout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  labs(title = "Mch") +
  xlim(0, 40) +
  ylim(0, 6) +
  theme_minimal()

mcurp <- ggplot(mcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  xlim(0, 40) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

aout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

acur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 1.3, 1.3, 0) 
) 

# Create two polygon plots (same as above)
aoutp <- ggplot(aout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  labs(title = "Ach") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

acurp <- ggplot(acur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()

# ------------------------------------------------------

library(ggplot2)
library(patchwork)

bout <- data.frame(
  vin = c(3, 3, 5, 5),    
  vout = c(0.8, 3.5, 3.5, 0.8)  
)

bcur <- data.frame(
  vin = c(3, 3, 5, 5),    
  cur = c(0, 2.5, 2.5, 0) 
) 

# Create two polygon plots (same as above)
boutp <- ggplot(bout, aes(x = vin, y = vout)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  labs(title = "Bch") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal()

bcurp <- ggplot(bcur, aes(x = vin, y = cur)) +
  geom_polygon(fill = NA,  color = "black", linetype = "dashed") +
  xlim(0, 6) +
  ylim(0, 3) +
  theme_minimal()


# Use patchwork to arrange plots vertically
combined_plot <- (moutp |aoutp | boutp) / (mcurp | acurp | bcurp)  # 2x2 layout
combined_plot




# ------------------------------------------------------
# 2024.9.14 Creating material for the Rohm IC
# ------------------------------------------------------

# --- OCP acceptable duty for Ach ---
library(ggplot2)

vin = seq(3, 5.5, by=0.5)
vout = seq(0.8, 3.5, by=0.5)
a <- expand.grid(vin, vout)
names(a) <- c("vin", "vout")
a <- subset(a, vin-vout > 1)
a$duty <- round(a$vout/a$vin, 2)
a$ocp <- a$duty > 0.05 & a$duty < 0.35

p1 <- ggplot(a, aes(x = (vin), y = (vout), fill = ocp)) +
  geom_tile() +
  #scale_fill_gradient(low = "white", high = "blue") +
  #scale_fill_gradient2(low = "blue", high = "red", midpoint = 0) +
  scale_fill_manual(values = c("TRUE" = "lightblue", "FALSE" = "#ffa1a1")) +  # Custom colors for TRUE/FALSE
  labs(x = "Vin", y = "Vout", fill = "Value") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal() +
  theme(legend.position = "none")  # This hides the legend

ggplotly(p1)

# --- OCP acceptable duty for Bch ---
library(ggplot2)

vin = seq(3, 5.5, by=0.5)
vout = seq(0.8, 3.5, by=0.5)
a <- expand.grid(vin, vout)
names(a) <- c("vin", "vout")
a <- subset(a, vin-vout > 1)
a$duty <- round(a$vout/a$vin, 2)
a$ocp <- a$duty > 0.65 & a$duty < 0.75

p2 <- ggplot(a, aes(x = (vin), y = (vout), fill = ocp)) +
  geom_tile() +
  #scale_fill_gradient(low = "white", high = "blue") +
  #scale_fill_gradient2(low = "blue", high = "red", midpoint = 0) +
  scale_fill_manual(values = c("TRUE" = "lightblue", "FALSE" = "#ffa1a1")) +  # Custom colors for TRUE/FALSE
  labs(x = "Vin", y = "Vout", fill = "Value") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal() +
  theme(legend.position = "none")  # This hides the legend

ggplotly(p2)


# Use patchwork to arrange plots vertically
combined_plot <- (p1 |p2)  # 2x2 layout
combined_plot

# --- Vout ---
# Vout = D x Vin - Io x Ron - Vf x (1-D) - Io x DCR

D = 0.9
Vin = 5
Io = seq(0, 3, by=0.1)
Ron = 0.3
Vf = c(0.3, 0.5, 1.0)
DCR = seq(0.1, 0.2, by=0.1)

d <- expand.grid(Io, Vf, DCR)
names(d) <- c("Io", "Vf", "DCR")
d$D = 0.9
d$Vin = 5
d$Ron = 0.3
d$Vout = d$D * d$Vin - d$Io * d$Ron - d$Vf * (1-d$D) - d$Io * d$DCR
d$drive <- d$Io < 1.9 & d$Vo > 3.3

#d <- data.frame(D, Vin, Io, Ron, Vf, DCR, Vout)

g <- ggplot(d, aes(x=Io, y=Vout, color=factor(Vf)))
p <- g + geom_point() + geom_line() 
p <- p + labs(x="電流", y="出力電圧", title="出力可能最大電圧 @D=0.9" )
#p <- p + ylim(0, 6)
#p <- p + xlim(0, 3.0)
p <- p + geom_hline(yintercept=3.3, linetype="dotted", color="grey")
p <- p + geom_vline(xintercept=1.9, linetype="dotted", color="grey")
p <- p + facet_grid(.~DCR)
ggplotly(p, dynamicTicks = TRUE)





library(ggplot2)
library(plotly)
#Vin = seq(3, 5.5, by=1)
#Vout = c(0.8, 0.9, 1.1, 3.3, 3.5)

Vin = seq(3, 5.5, by=0.5)
Vout = seq(0.8, 3.5, by=0.5)
#d <- expand.grid(Vin, Vout)
#names(d) <- c("Vin", "Vout")
#d <- subset(d, Vin-Vout > 1)  #入出力電圧差1V以上を満たすデータ
#D <- round(a$vout/a$vin, 2)


#D = 0.9
#Vin = seq(0, 5.5
#Io = seq(0, 3, by=1)
Io = c(1.5,1.9,2.0,2.5)
Ron = 0.3
Vf = c(0.5, 1.0)
DCR = seq(0.1, 0.2, by=0.1)

d <- expand.grid(Vin, Vout, Io, Ron, Vf, DCR)
names(d) <- c("Vin", "Vout", "Io", "Ron", "Vf", "DCR")
d <- subset(d, Vin-Vout > 1)  #入出力電圧差1V以上を満たすデータ
d$D = 0.9
#d$Vin = 5
#d$Ron = 0.3
d$Vout2 = d$D * d$Vin - d$Io * d$Ron - d$Vf * (1-d$D) - d$Io * d$DCR
#d <- subset(d, Vin-Vout > 1)  #入出力電圧差1V以上を満たすデータ
d$drive <- d$Vout2 > d$Vout
d$tooltip_text <- paste("Vin:", d$Vin, "<br>Vout:", d$Vout, "<br>Drive:", d$drive)

#d2 <- d[,c(1, 2, 9)]
#d2 <- subset(d, Io==2)
p2 <- ggplot(d, aes(x = (Vin), y = (Vout), fill = drive, text = tooltip_text)) +
  
#p2 <- ggplot(d, aes(x = (Vin), y = (Vout), fill = drive, 
#                   text = paste("Vin:", Vin, "<br>Vout:", Vout, "<br>Drive:", drive))) +
  geom_tile() +
  #scale_fill_gradient(low = "white", high = "blue") +
  #scale_fill_gradient2(low = "blue", high = "red", midpoint = 0) +
  scale_fill_manual(values = c("TRUE" = "lightblue", "FALSE" = "#ffa1a1")) +  # Custom colors for TRUE/FALSE
  facet_grid(.~Io) +
  labs(x = "Vin", y = "Vout", fill = "Value") +
  xlim(0, 6) +
  ylim(0, 6) +
  theme_minimal() +
  theme(legend.position = "none")  # This hides the legend
  #facet_grid(.~Io)

#ggplotly(p2, tooltip = "text")
ggplotly(p2)



