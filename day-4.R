tmp <- read.csv("input-4-ex.txt", sep = ",", header = F)
tmp <- read.csv("input-4.txt", sep = ",", header = F)
l <- length(tmp$V1)

data <- data.frame(a1 = NA, a2 = NA, b1 = NA, b2 = NA)
for (i in 1:l){
  a <- as.integer(as.data.frame( strsplit(tmp$V1[i],"-"))[,1])
  b <-as.integer(as.data.frame( strsplit(tmp$V2[i],"-"))[,1])
  data[i,1] <-a[1]
  data[i,2] <- a[2]
  data[i,3] <- b[1]
  data[i,4] <- b[2]
}


su <- sum(data$a1 <= data$b1 & data$a2 >= data$b2 | data$a1 >= data$b1 & data$a2 <= data$b2)
print(su)


#part 2
su2 <- sum(data$a1 <= data$b1 & data$b1 <= data$a2 | data$a1 <= data$b2 & data$b2 <= data$a2 | data$a1 <= data$b1 & data$a2 >= data$b2 | data$a1 >= data$b1 & data$a2 <= data$b2 )
print(su2)
