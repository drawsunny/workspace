
library(devtools)
library(frequencyConnectedness)

load("E:\\.Rdata")

est1 <- VAR(return, p = 2, type = "const")
est2 <- VAR(volatility, p = 3, type = "const")

sp1 <- spilloverDY09(est1, n.ahead = 100, no.corr = F)
sp2 <- spilloverDY09(est2, n.ahead = 100, no.corr = F)

overall(sp1)
overall(sp2)

params_est = list(p = 2, type = "const")
sp3 <- spilloverRollingDY09(return, n.ahead = 100, no.corr = F, "VAR", params_est = params_est, window = 50)
sp4 <- spilloverRollingDY09(volatility, n.ahead = 100, no.corr = F, "VAR", params_est = params_est, window = 50)
plotOverall(sp3)
plotOverall(sp4)