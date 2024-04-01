maltempo <- get_playlist_audio_features("", "0OuWJoMSfwLFO29RwANdHn") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Vincenzo Maltempo") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

maltempo <- maltempo %>%
  ungroup() %>%
  mutate(movement = ifelse((sonata == 1) & (movement == "3"), "3-4", movement))

saveRDS(object = maltempo, file = "data/playlists/maltempo-playlist.RDS")
