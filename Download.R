ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creates a list of ncbi ids of files we are interested in
library(rentrez)  # loads the "rentrez" package
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #Retrieves files from NCBI based off specified IDs 

head(Bburg) #Taking a look at the object

#Creating a new object with sequences seperated
split <- 
Sequences <- strsplit(Bburg, )
