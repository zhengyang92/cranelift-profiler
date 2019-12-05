
// useless loops
int f_a(int a)
{
  for (int i = 0 ; i < 1000000; i ++) {
    a += 1;
  }
  return a;
}

// useless  loops
int f_b(int a) {
  for (int i = 0 ; i < 1000000; i ++) {
    a += 1;
  }
  return a;
}

int main(void)
{
  int a = 0;
  unsigned short lfsr = 0xACE1u;
  unsigned bit;

  for (int i = 1 ; i <= 1000; i ++) {
    // generate random
    bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
    lfsr =  (lfsr >> 1) | (bit << 15);
    int r = lfsr % 100;

    // it has 80 percent of probability of executing f_a
    if (r < 80) {
      a = f_a(a);
    // it has 80 percent of probability of executing f_b
    } else {
      a = f_b(a);
    }
  }
  return a;
}
