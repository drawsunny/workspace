* 使用stata15
clear
use "E:\threshold.dta" 
g t=_n
tsset t

* Hansen(1999)门限回归
threshold pta oil_rmb, optthresh(1) threshvar(t) regionvars(small)
* 检验
g d1=1
replace d1=0 if t>=321
g ds1=d1*small
g d2=0
replace d2=1 if t>=321
g ds2=d2*small
reg pta oil_rmb ds1 ds2,vce(bootstrap,reps(1000))
test ds1=ds2
