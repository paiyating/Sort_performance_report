#install.packages(c("dplyr","readxl"))
library("dplyr")
library("readxl")
test <- readxl::read_excel("test1.xls", col_types = c("text","numeric","numeric", "numeric", "numeric"), na = "Skip")
i=0
k=0
total=data.frame()
fund_rank<-readxl::read_xls("fund.xls", col_names = FALSE, na = "Skip")
for (k in 1:dim(fund_rank)[1]){
  index=which(test$基金名稱==as.character(fund_rank[k,1]))
  len=length(index)-1
  j=0
  total<-rbind(total,as.data.frame(test[index[len],]))
  j=index[len]
  while (1) {
    if(is.na(test$基金名稱[j])) {
      j<-j + 1
    }
    else if(test$基金名稱[j]=="評比基金數"){
      total<-rbind(total,as.data.frame(test[j,]))
      break;
    }
    else{
      j<-j + 1
    }
  }
}

write.csv(total, file = "file3.csv", row.names = FALSE)
