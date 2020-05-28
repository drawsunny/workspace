# 安装nCov2019库
# remotes::install_github("GuangchuangYu/nCov2019")  
library(nCov2019)  
  
# 获取省级的历史数据  
x <- load_nCov2019()  
data <- summary(x)
global <- summary(x)
write.table (data, file ="E:/data.csv", sep =",", row.names =FALSE)  
write.table (global, file ="E:/global.csv", sep =",", row.names =FALSE)  