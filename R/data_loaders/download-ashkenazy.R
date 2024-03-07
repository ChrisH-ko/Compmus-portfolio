ashkenazy <- get_playlist_audio_features("", "7bWfdaHsWluY72lP03tmBm") %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(sonata = replace(sonata, sonata == 19, 2)) %>%
  mutate(pianist = "Vladimir Ashkenazy") %>%
  group_by(sonata) %>%
  mutate(movement = row_number())

saveRDS(object = ashkenazy, file = "data/playlists/ashkenazy-playlist.RDS")

for (i in 1:10) {
  sonata <- ashkenazy %>% filter(sonata == i)
  movements <- as.numeric(sonata %>% count())
  for (j in 1:movements) {
    object <- paste("ashkenazy", as.character(i), as.character(j), sep="_")
    file_path <- paste("data/pieces/ashkenazy/", object, ".RDS", sep = "")
    
    recording <- get_tidy_audio_analysis(sonata[j,]$track.id)
    saveRDS(object = recording, file = file_path)
  }
}
