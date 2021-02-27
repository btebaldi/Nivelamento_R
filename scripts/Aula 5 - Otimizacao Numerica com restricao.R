# Exercicio 1 -------------------------------------------------------------
rm(list = ls())

# maximizar xy s.a. 2x + 3y <= 300
# x >= 0
# y >= 0
f.min <- function(param){
  x <- param[1]
  y <- param[2]
  ret <- -(x*y)
  return(ret)
}

restrictions <- matrix(c(-2,-3,1,0,0,1), ncol=2, nrow = 3, byrow = TRUE)
colnames(restrictions) <- c("X", "Y")
values <- matrix(c(-300,0,0), ncol=1, nrow = 3)

theta <-  c(1,1)

# ui %*% theta - ci >= 0
restrictions %*% theta - values


# TESTE SEM GRADIENTE
constrOptim(theta, f.min, grad = NULL, ui = restrictions, ci = values)

# TESTE COM GRADIENTE
f.grad <- function(param){
  x <- param[1]
  y <- param[2]
  ret <- c(-y, -x)
  return(ret)
}

opt.mdl <- constrOptim(theta, f.min, grad = f.grad, ui = restrictions, ci = values)
x <- opt.mdl$par[1]
y <- opt.mdl$par[2]
cat(sprintf("MODELO 1\n---------------\nX: %.2f\nY: %.2f", x, y))


# Exercicio 2 -------------------------------------------------------------
rm(list = ls())
# minimizar x2+y2 s.a. 2x + 3y = 300

f.min <- function(param){
  x <- param[1]
  y <- (300 - 2*x)/3
  ret <- x^2 + y^2
  return(ret)
}

theta <- c(1)

# TESTE SEM GRADIENTE
optim(theta, f.min)

# TESTE COM GRADIENTE
f.grad <- function(param){
  x <- param[1]
  ret <- c(2*x + 2*(100 - 2/3*x)*(-2/3) )
  return(ret)
}

opt.mdl <- optim(theta, f.min, gr = f.grad, method = "L-BFGS-B")
x <- opt.mdl$par
y <- (300 - 2*x)/3

cat(sprintf("MODELO 2\n---------------\nX: %.2f\nY: %.2f", x, y))


# Exercicio 3 -------------------------------------------------------------
rm(list = ls())

# max{x+y} s.a. x^2 + y^2 <= 4
# note que vamos adaptar o problema
# x^2 = a  e y^2 = b
# min{-a^0.5-y^0.5} s.a. -a - b >= -4

f.min <- function(param){
  a <- param[1]
  b <- param[2]
  ret <- (a^0.5) + (b^0.5)
  return(-ret)
}

restrictions <- matrix(0, ncol=2, nrow = 3)
colnames(restrictions) <- c("a", "b")

restrictions[1,] <- c(-1,-1)
restrictions[2,] <- c(1,0)
restrictions[3,] <- c(0,1)

values <- matrix(c(-4,0,0), ncol=1, nrow = 3)

theta <- c(1.4,1.4)

# ui %*% theta - ci >= 0
restrictions %*% theta - values
f.min(theta)

# TESTE SEM GRADIENTE
opt.mdl <- constrOptim(theta, f.min, grad = NULL, ui = restrictions,
                       ci = values)
a <- opt.mdl$par[1]
b <- opt.mdl$par[2]

x <- a^0.5
y <- b^0.5

f.min(c(x,y))
cat(sprintf("MODELO 3\n---------------\nX: %.2f\nY: %.2f", x, y))

