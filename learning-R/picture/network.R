# 如果没有用过这两个包要先下载
# install.packages("igraph")
# install.package("xlsx")

# 调用包
library(igraph)
library(xlsx)

# 从节点权重表格生成网络图
# 节点权重表格就是一个三列的表格，第一列和第二列是节点，就是中药名，第三列是权重
# 从excel文件读入R，为dataframe格式
test<-read.xlsx("E:/test.xlsx",1,encoding="UTF-8")

# 生成图文件g
# 完整形式是：g<-graph_from_data_frame(file, directed=F, vertices=node)，分别是变量名，是否有向图，节点文件
g<-graph_from_data_frame(test, directed=F)

# 以下是一些美化命令，可以用命令：?igraph.plotting 进行查询，V是关于节点的调整，E是关于边的调整
V(g)$size=20 
V(g)$color="white"
V(g)$label.color="black"
E(g)$color="black"

# 可对个别边进行设置，如第44-253个边设置为点的形式
E(g)$lty="dotted"
E(g)[c(1:44)]$lty="solid"
E(g)$width=1
E(g)[c(1:44)]$width = 2

# 绘图
# 如果有权重用：plot(g, layout = layout.circle,edge.width=E(g)$频数)，layout是排列方式
plot(g, layout = layout.circle)

# 从邻接矩阵生成网络图
# g<-graph_from_adjacency_matrix(test, weighted=NULL)

# 从文本列表生成网络图
# g=graph_from_literal( A-B-C-D, E-A-E-A, D-C-A, D-A-D-C )

# 提取点文件和边文件
# node<-get.vertex.attribute(g)[[1]]
# edge<-get.edgelist(g)