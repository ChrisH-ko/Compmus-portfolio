zhukov <- get_playlist_audio_features("", "5EpGR6eUJkYDebReri1zdN") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Igor Zhukov") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = zhukov, file = "data/playlists/zhukov-playlist.RDS")
