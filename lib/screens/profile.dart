import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  
  int user = 1;
  String name = '';
  String info = '';
  String number = '';

  void cekStatus() {
    if (user == 1) {
      name = "Mutiara";
      info = "I'm Happy";
      number = "0895-2243-0989";
    } else {
      name = "Rey Mahendra";
      info = "I'm Calm";
      number = "0895-2243-0989";
    }
  }
  

  ProfileScreen({super.key});
  @override
  
  Widget build(BuildContext context) {
    cekStatus();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Gambar Profil dan Nama
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi untuk mengganti atau memperbesar gambar
                      print("Gambar profil di-tap");
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Available',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Bagian Daftar Opsi
            ListTile(
              leading: Icon(Icons.person),
              title: Text(name),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(info),
              onTap: () {
                // Navigasi ke layar Privacy
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(number),
              onTap: () {
                // Navigasi ke layar Notifications
              },
            ),
          ],
        ),
      ),
    );
  }

  
}
