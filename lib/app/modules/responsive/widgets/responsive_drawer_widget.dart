import 'package:flutter/material.dart';

import '../../authentication/authentication_page.dart';

class ResponsiveDraweWidget extends StatelessWidget {
  const ResponsiveDraweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 26),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[500],
              child: const Icon(
                Icons.face,
                size: 58.0,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.forum_outlined),
            title: const Text('Forums'),
            onTap: () {
              // Tambahkan fungsi yang dijalankan saat menu Home dipilih
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell_outlined),
            title: const Text('Star Selling'),
            onTap: () {
              // Tambahkan fungsi yang dijalankan saat menu Settings dipilih
            },
          ),
          ListTile(
            leading: const Icon(Icons.source_outlined),
            title: const Text('Our Product'),
            onTap: () {
              // Tambahkan fungsi yang dijalankan saat menu Settings dipilih
            },
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text('Sign in'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthenticationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
