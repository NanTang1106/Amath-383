library(RColorBrewer)

y1 = seq(0, 3, 0.1)
x1 = y1^2

x2 = y1^2 + 3

x3 <- y1^2 - 3

plot(x1, y1, type='l', xaxt='n', yaxt='n', col='red', ylab='y(t)', xlab='x(t)')
lines(x2, y1, col='green')
lines(x3, y1, col='blue')
axis(side=1, c(0), pos=0, lty=0)
axis(side=2, c(0), las=1, lty=0)
text(x_txt1, y_txt1, pos=1, labels=label_txt1, cex=0.5)
legend('topleft', legend=c("K < 0", "K = 0", "K > 0"), 
       col=c("blue","red","green"), cex=0.8, lwd=2)

