lettberg <- get_playlist_audio_features("", "3sdlcRjy5BTP7n3wYAv9SM") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Maria Lettberg") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = lettberg, file = "data/playlists/lettberg-playlist.RDS")

