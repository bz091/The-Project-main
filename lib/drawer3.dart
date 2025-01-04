import 'package:flutter/material.dart';
import 'Coordinator .dart';
import 'main2.dart';
import 'sitting2.dart';
import 'ContactUsPage2.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBBDEFB), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildDrawerHeader(),
              Expanded(
                child: ListView(
                  children: [
                    _buildDrawerItem(context, Icons.home, 'الصفحة الرئيسية',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Coordinator()));
                    }),
                    _buildDrawerItem(context, Icons.settings, 'الإعدادات', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp9()));
                    }),
                    _buildDrawerItem(context, Icons.logout, 'تسجيل الخروج', () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp1()));
                    }),
                    _buildDrawerItem(context, Icons.message, ' تواصل معنا', () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUsApp()));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFF0D47A1),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 50,
              color: Color(0xFF0D47A1),
            ),
          ),
          SizedBox(height: 10),
          Text(
            " ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black26,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title,
      VoidCallback ontaplink) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1976D2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: ontaplink,
      ),
    );
  }
}
