
#Loading spike protein data from NCBI
ncbi_id <- ("NC_045512.2")
library(rentrez)  # you may need install.packages first
spike_prot <- entrez_fetch(db = "nuccore", id = ncbi_id, rettype = "fasta")

#Taking a look at the spike protein
print(spike_prot)

#Getting rid of everything except the sequence
clean_spike_prot <- gsub("[^ATGC]", "", spike_prot)
head(clean_spike_prot) #Checking the sequence

#Subsetting the portion of the string that I want
clean_spike_prot <- substr(clean_spike_prot, 21563, 25384)
nchar(clean_spike_prot) #double checking it's the right length

#Printing the spike protein so I can paste it into BLAST
print(clean_spike_prot)

# According to my BLAST search, this gene does seem to be highly conserved.
# According to my search results, the graphics and the alignments, there are almost no
# differences among the many samples of this gene.
# This means it is unlikely to be undergoing rapid evolution, and more likely
# is experiencing purifying selection.