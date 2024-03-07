alexeev <- get_playlist_audio_features("", "06t6MgQ4xonM7npcnVNrRp") %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Dmitri Alexeev") %>%
  group_by(sonata) %>%
  mutate(movement = row_number())

saveRDS(object = alexeev, file = "data/playlists/alexeev-playlist.RDS")

for (i in 1:10) {
  sonata <- alexeev %>% filter(sonata == i)
  movements <- as.numeric(sonata %>% count())
  for (j in 1:movements) {
    object <- paste("alexeev", as.character(i), as.character(j), sep="_")
    file_path <- paste("data/pieces/alexeev/", object, ".RDS", sep = "")
    
    
    assign(object, get_tidy_audio_analysis(sonata[j,]$track.id))
    saveRDS(object = object, file = file_path)
  }
}
