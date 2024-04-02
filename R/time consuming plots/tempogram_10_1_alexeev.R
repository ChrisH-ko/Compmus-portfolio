alexeev_10_1 <- get_tidy_audio_analysis("0AfNaqqufBWDkWKMiDeBGZ")

alexeev_10_1 <- alexeev_10_1 |>
  tempogram(window_size = 8, hop_size = 1, cyclic = TRUE) |>
  ggplot(aes(x = time, y = bpm, fill = power)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)") +
  theme_classic() +
  labs(title = "Tempogram | sonata 10", subtitle = "Dmitrii Alexeev") +
  minute_scalex

alexeev_10_1

saveRDS(object = alexeev_3_2, file = "data/plots/tempogram_10.RDS")
