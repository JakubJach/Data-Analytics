data {
  real<lower=0> alpha;
  real<lower=0> beta;
  real<lower=0> micro;
  real<lower=0> phi;
  real<lower=0> lam;
}

generated quantities {
  int<lower=0> y1;
  int<lower=0> y2;
  int<lower=0> y3;
  y1 = neg_binomial_rng(alpha,beta);
  y2 = neg_binomial_2_rng(micro,phi);
  y3 = poisson_rng(lam);
}