library(shiny)
library(data.table)
library(RColorBrewer)
library(devtools)
library(maps)
library(mapproj)
library(dplyr)
library(DT)


#read data file
visa<-fread('h1b.csv',stringsAsFactors=TRUE,select=c(2,5,8,12,21,25,26))

#clean data
setnames(visa,names(visa),tolower(names(visa)))
visa$case_status<-as.factor(visa$case_status)
visa$visa_class<-as.factor(visa$visa_class)
visa$employer_name<-as.factor(visa$employer_name)
visa$employer_state<-as.factor(visa$employer_state)
visa$job_title<-as.factor(visa$job_title)
visa$full_time_position<-factor(visa$full_time_position,exclude="",labels=c(0,1))

source('helpers.R')

#replace employer_state codes with full names by creating a lookup table from state dataset
#by merging state.abb (contains code) and state.name
data(state, package = "datasets")
lookuptable<-data.frame(cbind(state.abb,state.name))
visa<-visa[employer_state %in% lookuptable$state.abb,]
visa$employer_state<-as.factor(as.character(visa$employer_state))
visa$employer_state<-lookuptable$state.name[match(visa$employer_state,lookuptable$state.abb)]

#Remove all rows containing NA's
visa<-visa[complete.cases(visa),]


#group by state and find total number of cases by state, total no. of workers
#and total number of full time positions
visabystate<-data.frame(visa[,list(casesbystate=.N,fulltimebystate=sum(as.integer(full_time_position)),workersbystate=sum(total_workers)),by=employer_state])

#output the visabystate table so that it can be used by app
write.csv(visabystate,"app/data/visabystate.csv")
