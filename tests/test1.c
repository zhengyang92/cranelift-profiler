int f_a (int x) {
  return x - 1;
}

int main(int argc, char ** argv) {
  int sum;
  for (int i = 0 ; i < 10 ; i ++) {
    sum += f_a(argc);
  }
  return sum;
}
