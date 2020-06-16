data {
  int Years;
  int Deaths[Years];
}
parameters {
  real<lower=0> lambda;
}
model {
  lambda ~ normal(644,181);
  for (i in 1:Years) {
    Deaths[i] ~ poisson(lambda);
  }
}
generated quantities {
  int y_sim[Years];
  for (i in 1:Years) {
    y_sim[i] = poisson_rng(lambda);
  }
}