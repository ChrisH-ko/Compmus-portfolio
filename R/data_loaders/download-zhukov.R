zhukov <- get_playlist_audio_features("", "5EpGR6eUJkYDebReri1zdN") %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Igor Zhukov")

saveRDS(object = zhukov, file = "data/playlists/zhukov-playlist.RDS")

for (i in 4:10) {
  sonata <- zhukov %>% filter(sonata == i)
  movements <- as.numeric(sonata %>% count())
  for (j in 1:movements) {
    object <- paste("zhukov", as.character(i), as.character(j), sep="_")
    file_path <- paste("data/pieces/zhukov/", object, ".RDS", sep = "")
    
    
    assign(object, get_tidy_audio_analysis(sonata[j,]$track.id))
    saveRDS(object = object, file = file_path)
  }
}
