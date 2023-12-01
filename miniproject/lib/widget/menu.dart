import 'package:flutter/material.dart';
import 'package:miniproject/style.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Artikel',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/article')) {
                Navigator.pushReplacementNamed(context, '/article');
              } else {
                // Pengguna berada di halaman Home, tidak melakukan apa-apa
                print('Pengguna sudah berada di halaman Home.');
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Thread',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)!.settings.name == '/thread')) {
                Navigator.pushReplacementNamed(context, '/thread');
              } else {
                print('Pengguna sudah berada di halaman Home.');
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Profile',
              style: Styles.HeaderText,
            ),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.canPop(context) &&
                  ModalRoute.of(context)!.settings.name == '/profilemenu')) {
                Navigator.pushReplacementNamed(context, '/profilemenu');
              } else {
                // Pengguna berada di halaman Home, tidak melakukan apa-apa
                print('Pengguna sudah berada di halaman Home.');
              }
            },
          ),
        ],
      ),
    );
  }
}
