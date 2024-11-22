# stream_Avicenna

A new Flutter project.

## Getting Started

## Soal 1

Nama disisipkan appbar melalui kode berikut.

```
    return MaterialApp(
      title: 'Stream Avicenna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(),
    );
```

## Soal 2

Berikut 10 warna dalam variabel colors.

```
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
  ];
```

## Soal 3

Fungsi getColors() menghasilkan stream warna secara bergantian dari daftar colors dengan jeda satu detik di antara setiap warna. Aliran ini bisa didengarkan oleh widget di Flutter, yang bisa mengubah tampilan berdasarkan warna yang diterima dari aliran tersebut.

Ketika yield digunakan di dalam fungsi async* atau fungsi yang mengembalikan stream, itu berarti fungsi tersebut akan memberikan nilai ke stream setiap kali yield dieksekusi, lalu melanjutkan eksekusi dari posisi yang sama pada pemanggilan berikutnya.

Namun, yield* sedikit berbeda dari yield, karena digunakan untuk "menyerahkan" kontrol pada stream lain atau iterator, mengalirkan seluruh data yang diproduksi stream atau iterator tersebut ke stream fungsi yang sedang dijalankan.

## Soal 4

![Praktikum 1](assets/images/p1.png)

## Soal 5

Keyword listen memberikan callback setiap data diterima dari stream, lebih costumizable bisa ditambahkan callback onDone ketika stream selesai dan onError. Sedangkan untuk await for dilakukan dengan berlangganan ke stream secara asyncronous, fungsi akan berhenti dijalankan ketika stream berakhir, jadi tidak ada callback yang bisa dikonfigurasi.  

## Soal 6

![Praktikum 2](assets/images/p2.png)
Langkah 8 hanya dipanggil sekali karena initState berperan dalam perubahan angka dengan number stream, sedangkan langkah 10 digunakan untuk randomize angka antara 0 sampai 10 ketika button diklik.

## Soal 7

![Praktikum 2](assets/images/p22.png)
Method addError yang dibuat dalam stream.dart dipanggil menggantikan logic dalam fungsi addRandomNumber sehingga setiap button diklik akan selalu error, callback onError ditambahkan untuk mengubah number menjadi -1 ketika error

## Soal 8

![Praktikum 3](assets/images/p3.png)
Variabel transformer digunakan untuk memodifikasi data yang diproses, mungkin seperti middleware. Proses transform dilakukan sebelum proses listen pada stream. Sehingga hasil yang ditampilkan adalah hasil yang juga telah ditransform.

## Soal 9

![Praktikum 4](assets/images/p4.png)
Sebenarnya tidak ada perubahan logika yang signifikan pada initState, karena secara alur masih sama melakukan listen dan handling ketika error dengan onError atau done dengan onDone, serta menutup controller jika klik button stop subscription.

## Soal 10

Karena 1 state 2 kali inisiasi melalui listen di saat initState, harusnya 1 state 1 kali inisiasi 

## Soal 11

![Praktikum 5](assets/images/p5.png)
Karena dilakukan penambahan String 2 kali pada variabel values sehingga nilai dicetak 2 kali juga. Hal tersebut bisa dilakukan dengan 1 stream melalui penggunaan asBroadcastStream.

## Soal 12

Bisa apabila diizinkan untuk akses lokasi.
![Praktikum 6](assets/images/p6.png)

## Soal 13

Icon loading dimunculkan ketika reload sebagai tanda bahwa proses sedang berjalan, data sedang dalam perjalanan.
![Praktikum 7](assets/images/p7.png)

## Soal 14

Perbedaan hanya terlihat ketika mengalami error dan memunculkan teks "Something terrible happened!".
![Praktikum 7](assets/images/p7.png)

## Soal 15

Nama disisipkan appbar melalui kode berikut.

```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen Avicenna'),
      ),
      body: Center(
```

## Soal 16

Navigationscreen first muncul, setelah click change color dan memilih button sesuai colornya maka akan meneruskan value color yang ada di button tersebut untuk menggantikan warna sebelumnya.
![Praktikum 8](assets/images/p81.png)
![Praktikum 8](assets/images/p82.png)

## Soal 17

Navigationscreen muncul, setelah click change color akan terlihat pop-up dialog dan memilih button sesuai color maka akan meneruskan value color yang ada di button tersebut untuk menggantikan warna sebelumnya.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
