inp <- as.character( read.csv("input-6.txt",F))
for (i in 1:(nchar(inp)-3)){
  if (sum(duplicated(as.data.frame(strsplit(substr(inp,i,i+3),""))[,1])) == 0){
    print(i+3)
    break
  }
}

#part 2
for (i in 1:(nchar(inp)-13)){
  if (sum(duplicated(as.data.frame(strsplit(substr(inp,i,i+13),""))[,1])) == 0){
    print(i+13)
    break
  }
}
