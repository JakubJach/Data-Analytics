data {
  int<lower=0> num;
  real<lower=0> NU;
  real MU[num];
  real<lower=0> sigma[num];
}

parameters {
  real y[num];
}

model {
  y ~ student_t(NU,MU,sigma);
}