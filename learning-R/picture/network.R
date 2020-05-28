# ���û���ù���������Ҫ������
# install.packages("igraph")
# install.package("xlsx")

# ���ð�
library(igraph)
library(xlsx)

# �ӽڵ�Ȩ�ر�����������ͼ
# �ڵ�Ȩ�ر������һ�����еı��񣬵�һ�к͵ڶ����ǽڵ㣬������ҩ������������Ȩ��
# ��excel�ļ�����R��Ϊdataframe��ʽ
test<-read.xlsx("E:/test.xlsx",1,encoding="UTF-8")

# ����ͼ�ļ�g
# ������ʽ�ǣ�g<-graph_from_data_frame(file, directed=F, vertices=node)���ֱ��Ǳ��������Ƿ�����ͼ���ڵ��ļ�
g<-graph_from_data_frame(test, directed=F)

# ������һЩ����������������?igraph.plotting ���в�ѯ��V�ǹ��ڽڵ�ĵ�����E�ǹ��ڱߵĵ���
V(g)$size=20 
V(g)$color="white"
V(g)$label.color="black"
E(g)$color="black"

# �ɶԸ���߽������ã����44-253��������Ϊ�����ʽ
E(g)$lty="dotted"
E(g)[c(1:44)]$lty="solid"
E(g)$width=1
E(g)[c(1:44)]$width = 2

# ��ͼ
# �����Ȩ���ã�plot(g, layout = layout.circle,edge.width=E(g)$Ƶ��)��layout�����з�ʽ
plot(g, layout = layout.circle)

# ���ڽӾ�����������ͼ
# g<-graph_from_adjacency_matrix(test, weighted=NULL)

# ���ı��б���������ͼ
# g=graph_from_literal( A-B-C-D, E-A-E-A, D-C-A, D-A-D-C )

# ��ȡ���ļ��ͱ��ļ�
# node<-get.vertex.attribute(g)[[1]]
# edge<-get.edgelist(g)