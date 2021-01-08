library(rgbif)

###extracting non-NA georefrenced records###

df2 = occ_download('taxonKey = 'TAXON_KEY'', POLYGON((-121.67358 33.89282,-119.27856 28.57544,-117.65259 27.67456,-115.16418 27.76794,-114.62036 28.28979,
                            -116.02661 29.14673,-116.15295 29.72351,-116.97144 31.38794,-118.34747 33.57697,-119.43787 34.16199,-120.31128 
                            34.24438,-121.67358 33.89282)))

###use the above step or you can download the Darwin Core data set from GBIF using the the appropriate polygon
###Polygon((-121.67358 33.89282,-119.27856 28.57544,-117.65259 27.67456,-115.16418 27.76794,-114.62036 28.28979,
#-116.02661 29.14673,-116.15295 29.72351,-116.97144 31.38794,-118.34747 33.57697,-119.43787 34.16199,-120.31128 
#34.24438,-121.67358 33.89282))

###Once downloaded you will need to unzip your file to be able to upload in R

setwd ("C:/Users/lma243.NAU/Dropbox/Symbiota_NAU_Projects/Contracts/Channel Islands Portals/R_scripts") #set your working directory to where ever your csv is saved to.
#df = read.csv("occurrence.csv") #read in your darwin core occurence records csv (usually titled occurrence.txt)
#df2 = read.csv("occurrence.csv") #read in your darwin core occurence records csv (usually titled occurrence.txt)
inCode = read.csv ("NA_inCodes.csv")

df2 <- df2[!(is.na(df2$institutionCode)),]

i =347
for (i in c(1:724)) {
  
  df = df[!df$institutionCode == paste(inCode[i,1]), ]
  
}


for (i in c(1:724)) {
  
  df = df[!df$collectionCode == paste(inCode[i,2]), ]
  
}



write.csv (df, file = "C:/Users/lma243.NAU/Dropbox/Symbiota_NAU_Projects/Contracts/Channel Islands Portals/R_scripts/cleaned_gbif_nonNA.csv")


