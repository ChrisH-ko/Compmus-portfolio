sofrontsky <- get_playlist_audio_features("", "1Dm4bMspnpHqQxFd77xJ6O") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(pianist = "Vladimir Sofronitsky") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = sofrontsky, file = "data/playlists/sofrontsky-playlist.RDS")
