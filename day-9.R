orders = read.csv("input-9",header = F, sep = " ")

moveH = function(H,move){
  H = H + (move == "R")*c(1,0) + (move == "L")*c(-1,0) + (move == "U")*c(0,1) + (move == "D")*c(0,-1)
  return(H)
}
moveT = function(H, Tail){
  delta = H - Tail
  if (max(abs(delta)) <= 1){
    return(Tail)
  }
  else{
    return(Tail + c(1,1)*(delta >= 1) + c(-1,-1)*(delta <= -1))
  }
}
H = c(0,0)
Tail = c(0,0)

visited = data.frame(x = NA, y = NA)
count = 0
for (i in 1:length(orders$V1)){
  for (j in 1:orders$V2[i]){
    H = moveH(H,orders$V1[i])
    Tail = moveT(H,Tail)
    count = count + 1
    visited[count,] = Tail
  }
}

visited$ID = 2^visited$x * 3^visited$y
print(sum(!duplicated(visited$ID)))

require(timeit)
timeit()
#part 2
H = c(0,0)
Tails = list(c(0,0),c(0,0),c(0,0),c(0,0),c(0,0),c(0,0),c(0,0),c(0,0),c(0,0))
visited = data.frame(x = NA, y = NA)
count = 0
for (i in 1:length(orders$V1)){
  for (j in 1:orders$V2[i]){
    H = moveH(H,orders$V1[i])
    Tails[[1]] = moveT(H,Tails[[1]])
    for (t in 2:9){
      Tails[[t]] = moveT(Tails[[t-1]],Tails[[t]])
    }
    count = count + 1
    visited[count,] = Tails[[9]]
  }
}

visited$ID = 2^visited$x * 3^visited$y
print(sum(!duplicated(visited$ID)))
