
library("sas7bdat")
setwd("C:/Users/Lenovo/Desktop/R/Duomenys - 20240228")
data = read.sas7bdat("donate.sas7bdat")

#Randamos grubios išskirtys ir jos pašalinamos

for ( i in 2:length(data))
{
  lower_bound <- quantile(data[i], 0.25,na.rm=T)
  upper_bound <- quantile(data[i], 0.75,na.rm=T)
  IQR=upper_bound-lower_bound
  a=which(data[i] < lower_bound - 3*IQR | data[i] > upper_bound + 3*IQR )
  b=data[a, i]
  data_clean = data[-a, ]
}


#Randamos salyginės išskirtys
for ( i in 2:length(data))
{
  lower_bound <- quantile(data[i], 0.25,na.rm=T)
  upper_bound <- quantile(data[i], 0.75,na.rm=T)
  IQR=upper_bound-lower_bound
  a=which((data[i] <= lower_bound - 1.5*IQR & data[i] > lower_bound-3*IQR) | (data[i] > upper_bound + 1.5*IQR & data[i] <= upper_bound + 3*IQR))
  b=data[a, i]
}


