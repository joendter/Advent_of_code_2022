tmp <-readLines("input-5-stacks.txt")
stacks <- list(s1= NA,s2=NA,s3=NA,s4=NA,s5=NA,s6=NA,s7=NA,s8=NA,s9=NA)

for (i in 1:9){
  subs <-  substr(tmp,-2+4*i,-2+4*i)
  stacks[[i]] <- subs[subs != " "]
  print(stacks[[i]])
}

moves <- read.csv("input-5-moves.txt",sep = " ", header = F)[c(2,4,6)]
for (i in 1:length(moves$V2)){
  size <- moves$V2[i]
  from <- moves$V4[i]
  to <- moves$V6[i]
  stacks[[to]] <- c(rev(stacks[[from]][1:size]),stacks[[to]])
  stacks[[from]] <- stacks[[from]][size+1:length(stacks[[from]])]
  tmp <- stacks[[moves$V4[i]]]
  for (j in 1:9){
    stacks[[j]] <- stacks[[j]][!is.na(stacks[[j]])]
  }
  #print(stacks)
  #print(i)
}
print(stacks)

#part 2
stacks <- list(s1= NA,s2=NA,s3=NA,s4=NA,s5=NA,s6=NA,s7=NA,s8=NA,s9=NA)
tmp <-readLines("input-5-stacks.txt")

for (i in 1:9){
  subs <-  substr(tmp,-2+4*i,-2+4*i)
  stacks[[i]] <- subs[subs != " "]
  print(stacks[[i]])
}
for (i in 1:length(moves$V2)){
  size <- moves$V2[i]
  from <- moves$V4[i]
  to <- moves$V6[i]
  stacks[[to]] <- c(stacks[[from]][1:size],stacks[[to]])
  stacks[[from]] <- stacks[[from]][size+1:length(stacks[[from]])]
  tmp <- stacks[[moves$V4[i]]]
  for (j in 1:9){
    stacks[[j]] <- stacks[[j]][!is.na(stacks[[j]])]
  }
  #print(stacks)
  #print(i)
}
print(stacks)
