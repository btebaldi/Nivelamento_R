# ***********************************
#  Script de teste da aula 4
# 
# Autor: Bruno Barbosa
# 
# Data 2022-01-28
# 
# ***********************************

# Script OiMundo.r

# Limpeza das variaveis
rm(list = ls())


# s-print-f: string-printada-formatada
frase <- sprintf("%s\nOi mundo\n%s\n",
                 paste(rep("*", 20), collapse = ""),
                 paste(rep("*", 20), collapse = ""))

# imprime no CONSOLE: CAT : Concatenate And prinT
cat(frase)

frase <- sprintf("Imprimindo base de dados: Harman Example 2.3\n")

cat(frase)

print(Harman23.cor)