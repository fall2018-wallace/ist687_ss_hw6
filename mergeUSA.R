
library("ggplot2")

arrests <- USArrests

arrests

df1<-df

arrests$Statename <- rownames(arrests)

arrests

#3) Create a merged dataframe -- with the attributes from both dataset

merge_df <- merge(arrests,df,by="Statename")

merge_df
#4) Create a histogram using ggplot2() for the population and a different histogram for the murder rate

myplotpop <- ggplot(merge_df, aes(x=Population)) + geom_histogram(binwidth = 500000) + ggtitle("Histogram of Population")

myplotmur <- ggplot(merge_df, aes(x=Murder)) + geom_histogram(binwidth = 5)+ ggtitle("Histogram of Murder")

myplotass <- ggplot(merge_df, aes(x=Assault)) + geom_histogram(binwidth = 50) + ggtitle("Histogram of Assault")

myplotrape <- ggplot(merge_df, aes(x=Rape)) + geom_histogram(binwidth = 5) + ggtitle("Histogram of Rape")


#5) Create a boxplot for the population, and a different boxplot for the murder rate.

mybplotpop <- ggplot(merge_df,aes(x=factor(0),y=Population)) + geom_boxplot()+ ggtitle("Boxplot of Population")

mybplotmur <- ggplot(merge_df,aes(x=factor(0),y=Murder)) + geom_boxplot()+ ggtitle("Boxplot of Murder")

mybplotass <- ggplot(merge_df,aes(x=factor(0),y=Assault)) + geom_boxplot()+ ggtitle("Boxplot of Assault")

mybplotrape <- ggplot(merge_df,aes(x=factor(0),y=Rape)) + geom_boxplot()+ ggtitle("Boxplot of Rape")


#6) Create a block comment explaining which visualization (boxplot or histogram) you thought was more helpful (explain why)

#Histogram is more helpful because it is more easy to read a histogram and even complex dataset

#can be view easily and interpreted

#7) Calculate the number of murders per state

merge_df$num.ofmurders <- merge_df$Population * merge_df$Murder/100000

merge_df


#8) Generate a bar chart, with the number of murders per state

mybarmur <- ggplot(merge_df, aes(x= Statename,y=num.ofmurders))+ geom_col() + ggtitle("Bar chart for murders per state")


#9) Generate a bar chart, with the number of murders per state. Rotate text (on the X axis),so we can see x labels, also add a title named “Total Murders”.

mybarmurrot <- ggplot(merge_df, aes(x= Statename,y=num.ofmurders))+ geom_col() + ggtitle("Bar chart for murders per state")+ theme(axis.text.x= element_text(angle = 90, hjust = 1))


#10)Generate a new bar chart, the same as in the previous step, but also sort the x-axis by the murder rate

mybarmurrotsort <- ggplot(merge_df, aes(x= reorder(Statename,num.ofmurders),y=num.ofmurders))+ geom_col() + ggtitle("Bar chart for murders per state sorted")+ theme(axis.text.x= element_text(angle = 90, hjust = 1))


#11)Generate a third bar chart, the same as the previous step, but also showing percentOver18 as the color of the bar

mybarmurrotsortper <- ggplot(merge_df, aes(x= reorder(Statename,num.ofmurders),y=num.ofmurders,fill=perover18))+ geom_col() + ggtitle("Bar chart for murders per state sorted")+ theme(axis.text.x= element_text(angle = 90, hjust = 1))


#12)Generate a scatter plot – have population on the X axis, the percent over 18 on the y axis, and the size & color represent the murder rate

myscat <- ggplot(merge_df, aes(x=Population,y=perover18)) + geom_point(aes(size=Murder,color=Murder)) + ggtitle("Scatter plot")



