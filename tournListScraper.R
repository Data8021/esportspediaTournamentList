library(rvest)
library(dplyr)

## Load webaddress and read in webpage
url <- "http://lol.esportspedia.com/wiki/ESportspedia:Tournaments"
tournSession <- read_html(url)

## Initialize data frame
esportspediaTournamentList <- data.frame(dates = as.character(),
                                         league = as.character(),
                                         name = as.character(),
                                         link = as.character(),
                                         stringsAsFactors = FALSE)

## Load in each year seperately
for (i in 1:234) {
  
  tournDates <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/div[", i+27,"]")) %>%
    html_text()
  esportspediaTournamentList[i, 1] <- paste0(tournDates, " 2015")
  
  tournLeague <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/a[",i+23,"]")) %>%
    html_attr("title")
  esportspediaTournamentList[i, 2] <- tournLeague
  
  tournName <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_text()
  esportspediaTournamentList[i, 3] <- tournName
  
  tournLink <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_attr("href")
  esportspediaTournamentList[i, 4] <- paste0("http://lol.esportspedia.com", tournLink)
  
  print(i)
}


for (i in 235:493) {
  
  tournDates <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/div[", i+28,"]")) %>%
    html_text()
  esportspediaTournamentList[i, 1] <- paste0(tournDates, " 2014")
  
  tournLeague <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/a[",i+23,"]")) %>%
    html_attr("title")
  esportspediaTournamentList[i, 2] <- tournLeague
  
  tournName <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_text()
  esportspediaTournamentList[i, 3] <- tournName
  
  tournLink <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_attr("href")
  esportspediaTournamentList[i, 4] <- paste0("http://lol.esportspedia.com", tournLink)
  
  print(i)
}

for (i in 494:799) {
  
  tournDates <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/div[", i+29,"]")) %>%
    html_text()
  esportspediaTournamentList[i, 1] <- paste0(tournDates, " 2013")
  
  tournLeague <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/a[",i+23,"]")) %>%
    html_attr("title")
  esportspediaTournamentList[i, 2] <- tournLeague
  
  tournName <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_text()
  esportspediaTournamentList[i, 3] <- tournName
  
  tournLink <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_attr("href")
  esportspediaTournamentList[i, 4] <- paste0("http://lol.esportspedia.com", tournLink)
  
  print(i)
}

for (i in 800:859) {
  
  tournDates <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/div[", i+30,"]")) %>%
    html_text()
  esportspediaTournamentList[i, 1] <- paste0(tournDates, " 2012")
  
  tournLeague <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/a[",i+23,"]")) %>%
    html_attr("title")
  
  if (length(tournLeague)!=0L) {
    
    esportspediaTournamentList[i, 2] <- tournLeague
    
  }
  
  tournName <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_text()
  esportspediaTournamentList[i, 3] <- tournName
  
  tournLink <- tournSession %>%
    html_nodes(xpath = paste0("/html/body/div[3]/div[3]/div[4]/div/table/tr/td/div[2]/span[",i+23,"]/a")) %>%
    html_attr("href")
  esportspediaTournamentList[i, 4] <- paste0("http://lol.esportspedia.com", tournLink)
  
  print(i)
}

## save output
save(esportspediaTournamentList, file = "data/esportspediaTournamentList.Rda")
write.csv(esportspediaTournamentList, file = "data/esportspediaTournamentList.csv")

## Manual adjustments were required in MS Excel because the website does not use a normal
## table structure.

## Reload csv file post manual adjustment
esportspediaTournamentList <- read.csv(file = "data/esportspediaTournamentList.csv")

## Resave the Rda file with the adjustments
save(esportspediaTournamentList, file = "data/esportspediaTournamentList.Rda")
