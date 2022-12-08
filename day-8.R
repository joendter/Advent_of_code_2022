forest <- strsplit(readLines("input-8"),"")
for (i in 1:length(forest)){
  forest[[i]] = as.integer(forest[[i]])
}
l <- length(forest)

forest <- matrix(unlist(forest),l,l)
co <- 4*l - 4
for (x in 2:(l-1)){
  for (y in 2:(l-1)){
    tree = forest[x,y]
    co = co +1*( (tree > max(forest[x,1:(y-1)])) | (tree > max(forest[x,(y+1):l])) | 
      (tree > max(forest[1:(x-1),y])) | (tree > max(forest[(x+1):l,y])))
  }
}
print(co)

#part 2
x = 4
y = 2
scenicscore <- function(x,y,forest,l){
  tree = forest[x,y]
  a = min(which(rev(forest[x,1:(y-1)])>=tree),y-1)
  b = min(which(forest[x,(y+1):l]>=tree),l-y)
  c = min(which(rev(forest[1:(x-1),y])>=tree),x-1)
  d = min(which((forest[(x+1):l,y])>=tree),l-x)
  print(c(a,b,c,d))
  return(a*b*c*d)
}
mscore = -Inf
for (x in 2:(l-1)){
  for (y in 2:(l-1)){
    mscore = max(mscore,scenicscore(x,y,forest,l))
    print(c(x,y,mscore,forest[x,y]))
  }}
print(mscore)
