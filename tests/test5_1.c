int f_a(int x);

int main() {
  int sum = 0;
  for (int i = 0 ; i < 10 ; i ++) {
    sum += f_a(i);
  }
  return sum;
}
