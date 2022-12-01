filename = "input-1-1.txt"
a <- data.frame(inp = as.integer(readLines(filename)))
a$elf <- cumsum(is.na(a$inp))
for (i in 0:max(a$elf)) a$carry[a$elf == i] = sum(a$inp[a$elf == i], na.rm = T)
print(paste("The elf with the most calories, carries", as.character(max(a$carry)), "calories"))
print(paste("The 3 elfs with the most calories carry a combined",as.character(sum(sort(a$carry[!duplicated(a$carry)], decreasing = T)[1:3])),"calories"))