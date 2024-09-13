void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  names1.add("Avicenna");
  names2.addAll(["2241720112"]);

  print(names1);
  print(names2);
  print(names3);
}
