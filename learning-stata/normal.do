
*!PAY ATTENTION! 所有符号都要在英文输入法下输入

***************循环****************

//1. 构建暂元/局部宏，相当于新建一个名为“vars”的文件夹
local vars "var1 var2 var3 ... varn"
//定义变量v的同时开始循环,注意要换行，左边不是单引号，循环内容根据实际需要自己替换
foreach v in `vars'{
g ln`v'=log(`v' )//循环对数
g d`v'=d.`v' //循环差分,记得先设置时间变量（tsset XX）
dfuller `v' //循环检验单位根
}

***************回归****************

//设置中文字符：
unicode analyze file.do
unicode encoding set gb18030
unicode translate file.do

regress y x1 x2 x3  
regress y x1 x2 x3 , robust
regress y x1 x2 x3 [aweight=w] 
xi：regress y x1 x2  i.catvar*x2 
//工具变量回归
regress y x1 x2 (x z)
regress y x1 x2 [if exp][in range]


//回归后可对系数做假设检验：
//检验amount的系数是否显著
test amount 
//检验amount的系数是否=1
test amount=1 

//对多个参数的检验：
// 零假设为amount 和ratio的系数都不显著
test amount ratio
test amount=ratio
test amount+ratio=1 

//predict的命令：
predict yhat

//回归残差相关：
predict var,resid
predict var, rstandard 
predict var, rstudent 
predict var， stdr
//如果画残差关于某一解释变量的图像，可用：
rvfplot var

//logit回归
logit y x1 x2 x3

//probit回归
probit y x1 x2 x3

//tobit回归
tobit  y x1 x2 x3