

int f_a(int x) {
  return x;
}

int f_b(int x) {
  int sum = 0;
  for (int i = 0 ; i < 100; i ++) {
    sum += f_a(i);
  }
  return sum;
}

int main() {
  int sum = 0;
  for (int i = 0 ; i < 100; i ++) {
    sum += f_b(i);
  }
  return sum;
}
