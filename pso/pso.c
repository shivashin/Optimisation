#include<stdio.h>
//-- global variable declear
#define W 0.5
#define C1 1.5
#define C2 1.5
#define X 0
#define Y 1
#define MAX 5
#define MIN -5
#define N 100


int evoluation(double x1,double x2) {
  return 100 * (x2 - x1 * x1) * (x2 - x1 * x1) + (1 - x1) * (1 - x1);
}

int update_position(double i, double vi) {
  return i + vi;
}

int rand_value() {
  return (double)rand()/((double)RAND_MAX+1);
}

int update_velocity(double i, double vi, double p[], double g[], int num) {
  return W * vi * C1 * rand_value() * (p[num] - i) + C2 * rand_value() * (g[num] - i);
}

int main(void) {
  double ps[N][2];
  double vs[N][2];
  double x, y;
  double vx, vy;

}
