#generating the data

year <- c(-8000,1,1000,1500,1600,1700,1750,1800,1850,1900,1950,1955,1960,1965,1970,1975,1980,1985,1990,1995,2000,2005,  2010,2015)
year <- as.integer(year)
View(year)

pop <- c(5,200,400,458,580,682,791,1000,1262,1650,2525,2758,3018,3322,3682,4061,4440,4853,5310,5735,6127,6520,6930,7349)
View(pop)

Pop_Year <-data.frame(year,pop)
head(Pop_Year)

#plotting the data

plot(x = Pop_Year$year,
     y= Pop_Year$pop)

#plotting on log scale

log_pop <- log(Pop_Year$pop)
Pop_Year <- cbind(log_pop,Pop_Year)
head(Pop_Year)

plot(x = Pop_Year$year,
          y= Pop_Year$log_pop)
     
#calculate R between intervals

rise <- diff(Pop_Year$log_pop)
rise
run <- diff(Pop_Year$year)
run
Rate <- (rise/run)
Rate[24] <- NA
Rate <- round(Rate, 4)*100

Pop_Year <- cbind(Pop_Year,Rate)

#plot R

plot(x=Pop_Year$year[-24],
     y=Pop_Year$Rate[-24],
     type = "l")
