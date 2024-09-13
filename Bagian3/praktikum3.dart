void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts["nama"] = "Avicenna";
  nobleGases[19] = "Avicenna";
  mhs1["nama"] = "Avicenna";
  mhs2[19] = "Avicenna";

  gifts["nim"] = "2241720112";
  nobleGases[20] = "2241720112";
  mhs1["nim"] = "2241720112";
  mhs2[20] = "2241720112";
}
