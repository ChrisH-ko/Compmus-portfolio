ugorski <- get_playlist_audio_features("", "23REzhG198wsfllRSFpsI7") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Anatol Ugorski") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = ugorski, file = "data/playlists/ugorski-playlist.RDS")
