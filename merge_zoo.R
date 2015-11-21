rm(list=ls(all=T))
library(zoo)
bond0<-read.csv("bond.csv",skip=2,head=F,sep=";")
bond=bond0
dt0<-NULL

for (i in 1:(ncol(bond)/2)){
bond[,(2*i-1)]<-as.Date(bond[,(2*i-1)],format="%d.%m.%Y")
dt0<-c(dt0,bond[, (2*i-1)])
}

dt1<-sort(unique(dt0),decreasing=F)
dt1<-as.Date(dt1)
z1<-zoo(bond[is.na(bond[,1])==F,2],bond[is.na(bond[,1])==F,1])
xx<-merge(z1)

for (i in 2:(ncol(bond)/2))
{
z1<-zoo(bond[is.na(bond[,2*i-1])==F,2*i],bond[is.na(bond[,2*i-1])==F,2*i-1])
xx<-merge(xx,z1,all=T)
}

colnames(xx)<-c("US","CA","UK","DE","FR","IT")
for (i in 2:nrow(xx))
{
    for (j in 1:ncol(xx)){
       if (is.na(xx[i,j])==T) {xx[i,j]=xx[i-1,j]}
    }
}
bond<-xx
save(bond,file="bond.RData")
