data {
  int Y;
  vector<lower=0>[Y] death_rate;
}

generated quantities {
  real lambda = normal_rng(5115,1438);
  int y_sim[Y];
  for (i in 1:Y) {
    y_sim[i] = poisson_rng(lambda*death_rate[i]);
  }
}