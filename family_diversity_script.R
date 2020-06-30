library(tidyverse)
library(rfishbase)




family_diversity <- fishbase %>% 
  group_by(Family) %>% 
  distinct(Genus,Species) %>% 
  tally(name = "no_fish_species") %>% 
  arrange(-no_fish_species) %>% 
  mutate(source = "FishBase")

write.csv(family_diversity, file = "family_diversity.csv")          


