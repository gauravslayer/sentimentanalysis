library(sentimentr)
library(dplyr)
library(readxl)
gaurav<-read_excel(file.choose())
View(gaurav)

gaurav%>%
        get_sentences() %>%
        sentiment() ->gauravsenti
View(gauravsenti)

library(ggplot2)
library(dplyr)
gauravsenti%>%
        ggplot()+geom_density(col="Blue",kernel="gaussian")+aes(sentiment)

ggplot(gauravsenti)+geom_freqpoly(aes(x=sentiment),col="Red",bins=20)

gary<-head(gauravsenti,100)
gary%>%
        mutate(polarity_level=ifelse(sentiment>0,"Positive","Negative"))%>%
        ggplot()+geom_col(aes(x=element_id,y=n,fill=polarity_level))

gary1<-tail(gauravsenti,125)
gary1%>%
        mutate(polarity_level=ifelse(sentiment>0,"Positive","Negative"))%>%
        ggplot()+geom_col(aes(x=element_id,y=n,fill=polarity_level))   

gaurav$Remarks %>%
        get_sentences()%>%
        sentiment_by() %>%
        highlight()

View(profanity(gaurav$Remarks))

emotion<-(emotion(gaurav$Remarks))
View(emotion)


