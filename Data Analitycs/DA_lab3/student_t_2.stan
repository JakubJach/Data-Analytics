data {
  real<lower=0> NU;
  real MU;
  real<lower=0> sigma;
}

parameters {
  real y;
}

model {
  y ~ student_t(NU,MU,sigma);
}