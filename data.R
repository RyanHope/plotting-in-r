require(reshape)

x <- seq(-pi,pi,length.out=100)
y <- c(sin(x),cos(x)) + rnorm(200,sd=.25)
d1 <- data.frame(y=y,x=rep(x,2),type=rep(c("sin","cos"),each=length(x)))

d2 <- data.frame(reshape(d1, timevar="type", idvar=c("x"), direction="wide"))

d3 <- data.frame(
  x=rep(1:5,each=100),
  y=c(unlist(lapply(1:5, function(x){rnorm(n=100,mean=2^x)})),
      unlist(lapply(1:5, function(x){rnorm(n=100,mean=50+2^x)}))),
  g=rep(1:2,each=500))

x <- seq(pi/4, 5 * pi, length.out = 100)
y <- seq(pi/4, 5 * pi, length.out = 100)
r <- as.vector(sqrt(outer(x^2, y^2, "+")))
d4 <- expand.grid(x=x, y=y)
d4$z <- cos(r^2) * exp(-r/(pi^3))