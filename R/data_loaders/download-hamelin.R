hamelin <- get_playlist_audio_features("", "6DqxZs1asow4mttEUzXm9A") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Marc-André Hamelin") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = hamelin, file = "data/playlists/hamelin-playlist.RDS")
