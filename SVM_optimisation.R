#importing required libraries
library(kernlab)
library(caret)
library(dplyr)


iteration=1000
kernelList=c('rbfdot','polydot','vanilladot','tanhdot','laplacedot','anovadot')   #list of kernels

#importing data
data<-read.csv('Dry_Bean_Dataset.csv')
data= data[sample(1:nrow(data)), ]
data$Class <- factor(data$Class)

finalacc=0

#generating samples
my_data <- list()
for (i in (1:10)) {
  set.seed(i+100)
  x<- sample_n(data,size=1000,replace=FALSE)
  my_data[[i]]<-data.frame(x)
}


#Accuracy dataframe
cols<-c('Sample','Best Accuracy','Kernel','Nu','Epsilon')
df<-data.frame(matrix(nrow=0,ncol=length(cols)))
colnames(df)=cols


for(i in 1:10){
  current=data.frame(my_data[i])
  trainIndex <- createDataPartition(current$Class,times=1, p = 0.7, list = FALSE)
  trainDataset <- current[trainIndex, ]
  testDataset <- current[-trainIndex, ]
  
  
  bestAccuracy=0
  bestKernel=""
  bestNu=0
  bestEpsilon=0
  acc<-c()
  iter<-c()
  
  for(j in 1:iteration){
    k=sample(kernelList,1)
    n=runif(1)
    e=runif(1)
    
    X_train=trainDataset[,1:ncol(trainDataset)-1]
    Y_train=trainDataset[,ncol(trainDataset)]
    X_test=testDataset[,1:ncol(testDataset)-1]
    Y_test=testDataset[,ncol(testDataset)]
   
    model<-ksvm(data.matrix(X_train),Y_train,kernel=k,nu=n,epsilon=e,kpar=list())
    
    # print(j)
    
    predicted<-predict(model,X_test)
    accuracy<-round(mean(Y_test==predicted)*100,2)
    if(j%%50==0){
      acc<-append(acc,accuracy)
      iter<-append(iter,j)
    }
    
    #print(accuracy)
    
    if(accuracy>bestAccuracy){
      bestKernel=k
      bestNu=n
      bestEpsilon=e
      bestAccuracy=accuracy
    }
    
  }
  if(bestAccuracy>finalacc){
    finalacc=bestAccuracy
    xlim <- c(0, 1000)
    ylim <- c(0, 100)
    spacing1<-10
    spacing2<-100
    graph<-plot(NULL, xlim =xlim, ylim =ylim, xlab = "iterations", ylab = "Accuracy", type = "n")
    
    axis(1, at = seq(xlim[1], xlim[2], by = spacing2))
    axis(2, at = seq(ylim[1], ylim[2], by = spacing1))
    title(main = "Fitness(BestAcc)")
    lines(iter,acc)
    abline(h = seq(0,100,10), lty = "dashed", col = "gray30")
    
  }
  
  df[nrow(df)+1,]<-c(i,bestAccuracy,bestKernel,round(bestNu,2),round(bestEpsilon,2))
  
  
}  

print(df)


