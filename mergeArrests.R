
library("ggplot2")

arrests <- USArrests

arrests

df1<-df

arrests$Statename <- rownames(arrests)

arrests

#3) Create a merged dataframe -- with the attributes from both dataset

merge_df <- merge(arrests,df,by="Statename")

merge_df
