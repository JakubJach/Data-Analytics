data {
  int Years;
}

generated quantities {
  real lambda = normal_rng(644,181);
  int y_sim[Years];
  for (i in 1:Years) {
    y_sim[i] = poisson_rng(lambda);
  }
}