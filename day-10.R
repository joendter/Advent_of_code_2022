inp = read.csv("input-10",header = F, sep = " ")

cycle = 0
X = 1
i = 0
Xs = c()
buffer = 0
while (cycle <=220 | i<length(inp)){
  cycle = cycle + 1
  Xs = c(Xs,X)
  buffer = buffer -1
  if (buffer <= 0){
    i = i + 1
    if (is.na(inp$V2[i])){
      buffer = 1
    }
    else {
      buffer = 2
    }
    if (i > 1){
    if (!is.na(inp$V2[i-1])){X = X + as.integer(inp$V2[i-1])}}
  }
}


print(sum(Xs[(0:5)*40+20+1]*((0:5)*40+20)))

#part 2
for (x in 0:5){
  pr = ""
  for (y in 1:40){
    lit = (Xs[40*x+y+1] %in% (y+(-2:0)))*1
    pr = paste(pr, rep("#",lit), rep(".",!lit),sep = "" )
  }
  print(pr)
}

