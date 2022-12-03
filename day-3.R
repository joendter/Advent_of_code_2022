#data <- read.csv("day-3-ex.txt",header = F)
data <- read.csv("input-3.txt",header = F)


eval <- function(backpack){
  lets <- c(letters,LETTERS)
  complength <- nchar(backpack)/2
  first <- substr(backpack,1,complength)
  second <- substr(backpack, complength + 1, nchar(backpack))
  for (i in 1:complength){
    chr <- substr(first,i,i)
    if (grepl(chr,second)){ return(match(chr, lets))}
  }
}

eval(data$V1[1])
su <- 0
for (i in data$V1){
  su <- su + eval(i)
}
print(su)

#part 2
eval2 <- function(bp1,bp2,bp3){
  lets <- c(letters,LETTERS)
  for (i in 1:nchar(bp1)){
    chr <- substr(bp1,i,i)
    if (grepl(chr,bp2)&grepl(chr,bp3)){return(match(chr,lets))}
  }
}

su2 <- 0 
for (i in 1:(length(data$V1)/3)){
  su2 <- su2 + eval2(data$V1[3*i-2],data$V1[3*i-1],data$V1[3*i])
}
print(su2)
