# 0.包的相关操作

pip install SomePackage  --user
pip install --upgrade SomePackage  
pip uninstall SomePackage  
pip list  

# 1.获取收盘价

import pandas as pd  
list=['000036','603225','000507','600346','600589','601233','002493','000703']  
pta=pd.DataFrame()  
for i in range(0,8):  
    temp=ts.get_hist_data(list[i],start='2006-12-22',end='2018-12-29', ktype='W')  
    pta[list[i]]=temp.close  
pta.to_excel("E:/02_paper/杨老师/data/pta.xlsx")  

# 2.获取实时票房

import tushare as ts  
df = ts.realtime_boxoffice()  
print(df.MovieName)  
print(df)  

# 3.获取疫情数据

import akshare as ak  
#中国疫情历史数据  
CN = ak.covid_19_163(indicator="中国历史累计数据")  
#中国新增数据  
CN_NEW = ak.covid_19_163(indicator="中国历史时点数据"  
#全球疫情最新数据  
WORLD = ak.covid_19_baidu(indicator="国外分国详情")  
WORLD = WORLD[['area','confirmed','died','crued']]  
#国外分城市数据  
CITY = ak.covid_19_baidu(indicator="国外分城市详情")  
#美国疫情数据  
data = pd.read_html('https://covidtracking.com/data/us-daily/')[0]  




from urllib import request