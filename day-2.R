#a <- data.frame(V1 = c("A","B","C"), V2 = c("Y","X","Z"))
a <- read.csv("input-2.txt", sep = " ", header = F)

a$win <- 6*(a$V1 == "A" & a$V2 == "Y" | 
              a$V1 == "B" & a$V2 == "Z" |
              a$V1 == "C" & a$V2 == "X" ) +
        3*(a$V1 == "A"  & "X"== a$V2 | a$V1 == "B" & a$V2 =="Y" | a$V1 == "C" & a$V2 == "Z")
a$pick <- 1*(a$V2 == "X" )+ 2*(a$V2 == "Y") + 3*(a$V2 == "Z")
print(sum(a$win) + sum(a$pick))

a$score2 <- 6*(a$V2 == "Z") + 3*(a$V2== "Y") + 1 +1*(a$V1 == "A" & a$V2 == "Z" | a$V1 == "B" & a$V2 == "Y" | a$V1 == "C" & a$V2 == "X")+
          2*(a$V1 == "A" & a$V2 == "X" | a$V1 == "B" & a$V2 == "Z" | a$V1 == "C" & a$V2 == "Y")
print(sum(a$score2))
