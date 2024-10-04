import 'package:flutter/material.dart';

void main() => runApp(const InstagramApp());

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImg = const Image(
      image: AssetImage('images/b.jpg'),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Reels",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Tindakan saat ikon kembali ditekan
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                // Tindakan saat ikon kamera ditekan
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            backgroundImg,
            Positioned(
              right: 10,
              bottom: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage('images/b.jpg'),
                                radius: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'ki_welirang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ), // Tambahkan padding jika diinginkan
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                  ), // Warna dan ketebalan border
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        7), // Radius border
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          const Text(
                            'Treat yourself to a moment of lorem ipsum dolor sit amet lorem ipsum dolor sit amet...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black, // Warna untuk item yang dipilih
          unselectedItemColor: const Color.fromARGB(
              255, 41, 36, 36), // Warna untuk item yang tidak dipilih
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget titleSection = Container(
//     padding: const EdgeInsets.all(32),
//     child: Row(
//       children: [
//         Expanded(
//           /* soal 1*/
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /* soal 2*/
//               Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child: const Text(
//                   'Wisata Gunung di Batu',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Text(
//                 'Batu, Malang, Indonesia',
//                 style: TextStyle(
//                   color: Colors.blueGrey.shade800,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         /* soal 3*/
//         const Icon(
//           Icons.star,
//           color: Colors.red,
//         ),
//         const Text('41'),
//       ],
//     ),
//   );

//   Widget textSection = Container(
//     padding: const EdgeInsets.all(32),
//     child: const Text(
//       'Gunung Butak, yang terletak di perbatasan Kota Batu, Kabupaten Malang, dan Kabupaten Blitar, adalah puncak tertinggi dari Pegunungan Kawi dengan ketinggian 2.868 meter di atas permukaan laut (mdpl). Gunung ini populer di kalangan pendaki karena menawarkan jalur pendakian yang menantang namun indah, terutama melalui jalur Panderman yang terkenal. Pendaki akan disuguhi pemandangan savana yang luas dan memukau, serta berbagai jenis vegetasi seperti bunga Edelweis. Gunung Butak juga menjadi tempat favorit untuk berkemah, dengan jalur yang lebih ramai dan landai dibandingkan jalur lainnya. Gunung Butak, yang terletak di perbatasan Kota Batu, Kabupaten Malang, dan Kabupaten Blitar, adalah puncak tertinggi dari Pegunungan Kawi dengan ketinggian 2.868 meter di atas permukaan laut (mdpl). Gunung ini populer di kalangan pendaki karena menawarkan jalur pendakian yang menantang namun indah, terutama melalui jalur Panderman yang terkenal. Pendaki akan disuguhi pemandangan savana yang luas dan memukau, serta berbagai jenis vegetasi seperti bunga Edelweis. Gunung Butak juga menjadi tempat favorit untuk berkemah, dengan jalur yang lebih ramai dan landai dibandingkan jalur lainnya. Gunung Butak, yang terletak di perbatasan Kota Batu, Kabupaten Malang, dan Kabupaten Blitar, adalah puncak tertinggi dari Pegunungan Kawi dengan ketinggian 2.868 meter di atas permukaan laut (mdpl). Gunung ini populer di kalangan pendaki karena menawarkan jalur pendakian yang menantang namun indah, terutama melalui jalur Panderman yang terkenal. Pendaki akan disuguhi pemandangan savana yang luas dan memukau, serta berbagai jenis vegetasi seperti bunga Edelweis. Gunung Butak juga menjadi tempat favorit untuk berkemah, dengan jalur yang lebih ramai dan landai dibandingkan jalur lainnya.',
//       softWrap: true,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter layout: Nama dan NIM Anda',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: ListView(
//           children: [
//             Image.asset(
//               'images/ZHW03102.JPG',
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       ),
//     );
//   }
// }
