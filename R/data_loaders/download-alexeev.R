alexeev <- get_playlist_audio_features("", "06t6MgQ4xonM7npcnVNrRp") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Dmitri Alexeev") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

alexeev <- alexeev %>%
  ungroup() %>%
  mutate(movement = ifelse((sonata == 1) & (movement == "3"), "3-4", movement))

saveRDS(object = alexeev, file = "data/playlists/alexeev-playlist.RDS")
