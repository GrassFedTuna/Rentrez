ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creates a list of ncbi ids of files we are interested in
library(rentrez)  # loads the "rentrez" package
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #Retrieves files from NCBI based off specified IDs 

head(Bburg) #Taking a look at the object

#Creating a new object with sequences seperated
Sequences <- strsplit(x = Bburg, "\n\n")
print(Sequences)

Sequences <- unlist(Sequences) #converting from list to data frame

#removing sequences from header
header <- gsub("(^>.*sequence)\\n[ATCG].*", "\\1", Sequences)

seq <- gsub("^>.*sequence\\n([ATCG].*)", "\\1", Sequences)

Sequences <- data.frame(Name = header, Sequence = seq)

Sequences$Sequence <- gsub("\n", "", Sequences$Sequence) #Removing newline characters
head(Sequences$Sequence)

write.csv(Sequences, file = "./Sequences.csv") #Exporting data as .csv file
