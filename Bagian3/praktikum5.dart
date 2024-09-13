(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);
  
  // print(tukar((20,10)));

  // (String, int) mahasiswa;
  // (String, int) mahasiswa = ("Avicenna", 2241720112);
  // print(mahasiswa);

  var mahasiswa2 = ('Avicenna', a: 2, b: true, 2241720112);
  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}
