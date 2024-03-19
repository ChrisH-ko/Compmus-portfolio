ashkenazy <- get_playlist_audio_features("", "7bWfdaHsWluY72lP03tmBm") |>
  add_audio_analysis() %>%
  mutate(sonata = as.numeric(gsub(".*?([0-9]+).*", "\\1", track.name))) %>%
  mutate(sonata = replace(sonata, sonata == 19, 2)) %>%
  mutate(pianist = "Vladimir Ashkenazy") %>%
  group_by(sonata) %>%
  mutate(movement = as.character(row_number()))

saveRDS(object = ashkenazy, file = "data/playlists/ashkenazy-playlist.RDS")
