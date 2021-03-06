# Script OiMundo.r
rm(list = ls())
frase <- sprintf("%s\nOi mundo\n%s\n",
                 paste(rep("*", 20), collapse = ""),
                 paste(rep("*", 20), collapse = ""))
cat(frase)
frase <- sprintf("Imprimindo base de dados: Harman Example 2.3\n")
cat(frase)
print(Harman23.cor)