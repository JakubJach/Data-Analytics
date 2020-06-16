data {
  int<lower=0> dim;
  vector[dim] MU;
  matrix[dim,dim] sigma;
}

parameters {
  vector[dim] y;
}

model {
  y ~ multi_normal(MU,sigma);
}