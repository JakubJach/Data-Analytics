functions {
  vector tail_delta(vector y,
                    vector theta,
                    real[] x_r,
                    int[] x_i) {
    vector[2] deltas;

    deltas[1] = normal_cdf(theta[1], y[1], y[2]) - 0.99;
    deltas[2] = normal_cdf(theta[2], y[1], y[2]) - 0.01;
    return deltas;
  }
}

data {
  vector<lower=0>[2] y_guess;
  vector<lower=0>[2] theta;
}

transformed data {
  vector[2] y;
  real x_r[0];
  int x_i[0];

  y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i);
  print("loc  = ", y[1]);
  print("scale = ", y[2]);
}

generated quantities {
  real loc = y[1];
  real scale = y[2];
}