szidon <- get_playlist_audio_features("", "6tqjVNXS4vEQZUqu0jAiZv") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Roberto Szidon") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = szidon, file = "data/playlists/szidon-playlist.RDS")
