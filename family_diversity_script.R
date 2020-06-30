library(tidyverse)
library(rfishbase)

family_diversity <- fishbase %>% 
  group_by(Family) %>% 
  distinct(Genus,Species) %>% 
  tally(name = "no_fish_species") %>% 
  arrange(-no_fish_species) %>% 
  mutate(source = "FishBase")

write.csv(family_diversity, file = "family_diversity.csv")          



specieslist <- fishbase %>% select(Genus, Species) %>% 
  unite(genus_species, c("Genus", "Species"), sep = " ") %>% 
  mutate(genus_species = as.factor(genus_species))


species_info <- species(species_list = specieslist$genus_species)

write.csv(species_info, file = "species_info.csv") 


test <- load_taxa(server = "FishBase")

