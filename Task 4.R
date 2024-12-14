#Task-04
#Analyze and visualize sentiment patterns in social media data to understand public opinion and attitudes towards specific topics or brands.
#Sample Dataset :- https://www.kaggle.com/datasets/jp797498e/twitter-entity-sentiment-analysis

#Load the data
data<-read.csv("C:\\Users\\user\\OneDrive\\Desktop\\Raj\\Twitter data.csv")
#Load necessary packages and library
install.packages("tidyverse")
install.packages("syuzhet")
install.packages("sentimentr")
library(tidyverse)
library(syuzhet)

#Remove URLs,mentones,and hastags
data_cleaned<-data%>%mutate(Content_clean=gsub("http\\S+|@\\S+|#[A-Za-z0-9]+","",Content))
head(data_calened$Content_clean)
data_cleaned$Sentiment_score<-get_sentiment(data_cleaned$Content_clean,method = "syuzhet")
#Preview the sentiment scores
head(data_cleaned$Sentiment_score)
#Summarize the sentiment data
sentiment_counts<-data%>%count(Sentiment)
#View the count of each sentiment
print(sentiment_counts)
#Vizualize Sentiment Distribution
ggplot(sentiment_counts,aes(x=Sentiment,y=n,fill=Sentiment))+geom_bar(stat="identity")+labs(title="Sentiment Distribution",x="Sentiment",y="Count")+theme_minimal()
#Analyze sentiment by entity
sentiment_entity<-data%>%group_by(Entity,Sentiment)%>%summarise(count=n())
print(sentiment_entity)
#Vizualize sentiment by entity
ggplot(sentiment_entity,aes(x=Entity,y=count,fill=Sentiment))+geom_bar(stat="identity",position = "dodge")+labs(title="Sentiment by Entity",x="Entity",y="Count")+theme_minimal()

