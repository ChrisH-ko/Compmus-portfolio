alexeev_3_2 <- get_tidy_audio_analysis("1mAFblavddIx3EkA4O9xwG")

alexeev_3_2 <- alexeev_3_2 |>
  tempogram(window_size = 8, hop_size = 1, cyclic = TRUE) |>
  ggplot(aes(x = time, y = bpm, fill = power)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)") +
  theme_classic() +
  labs(title = "Tempogram | sonata 3, mtv. 2", subtitle = "Dmitrii Alexeev") +
  minute_scalex

alexeev_3_2

saveRDS(object = alexeev_3_2, file = "data/plots/tempogram_3_2.RDS")
