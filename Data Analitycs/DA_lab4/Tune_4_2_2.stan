data {
  int Years;
  int Deaths[Years];
  vector[Years] death_rate;
}
parameters {
  real<lower=0> lambda;
}
model {
  lambda ~ normal(5115,1438);
  for (i in 1:Years) {
    Deaths[i] ~ poisson(death_rate[i]*lambda);
  }
}
generated quantities {
  int y_sim[Years];
  for (i in 1:Years) {
    y_sim[i] = poisson_rng(death_rate[i]*lambda);
  }
}