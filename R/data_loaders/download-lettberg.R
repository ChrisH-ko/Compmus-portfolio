lettberg <- get_playlist_audio_features("", "3sdlcRjy5BTP7n3wYAv9SM") %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Maria Lettberg") %>%
  group_by(sonata) %>%
  mutate(movement = row_number())

saveRDS(object = lettberg, file = "data/playlists/lettberg-playlist.RDS")

for (i in 1:10) {
  sonata <- lettberg %>% filter(sonata == i)
  movements <- as.numeric(sonata %>% count())
  for (j in 1:movements) {
    object <- paste("lettberg", as.character(i), as.character(j), sep="_")
    file_path <- paste("data/pieces/lettberg/", object, ".RDS", sep = "")
    
    
    recording <- get_tidy_audio_analysis(sonata[j,]$track.id)
    saveRDS(object = recording, file = file_path)
  }
}

