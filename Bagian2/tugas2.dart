void main() {
  bool isPrime(int number) {
    if (number < 2) {
      return false;
    }
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
  
  print('Bilangan prima dari 0 sampai 201:');
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print('${i} : Avicenna Mumtaza - 2241720112');
    }
  }
}