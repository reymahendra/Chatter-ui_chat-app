import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'John Doe',
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
              title: Text('Account'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('im happy'),
              onTap: () {
                // Navigasi ke layar Privacy
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('0895-1283-7123'),
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
