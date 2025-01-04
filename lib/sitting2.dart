import 'package:flutter/material.dart';
import 'Coordinator .dart';

void main() {
  runApp(MyApp9());
}

class MyApp9 extends StatefulWidget {
  const MyApp9({super.key});

  @override
  _MyApp5State createState() => _MyApp5State();
}

class _MyApp5State extends State<MyApp9> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: ProfileScreen(
        toggleDarkMode: _toggleDarkMode,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  const ProfileScreen({super.key, required this.toggleDarkMode, required this.isDarkMode});

  // دالة لاستخراج الألوان بناءً على الوضع
  Color _getColor(Color lightColor, Color darkColor) {
    return isDarkMode ? darkColor : lightColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            _getColor(const Color.fromARGB(255, 48, 138, 227), Colors.grey[850]!),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الاعدادات',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Coordinator()),
              (route) => false, // يزيل كل الصفحات السابقة من السجل
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // الخلفية صورة
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/image2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // التدرج اللوني فوق الصورة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _getColor(Colors.blue.withOpacity(0.6),
                      Colors.black.withOpacity(0.6)),
                  _getColor(Colors.blue.withOpacity(0.5),
                      Colors.black.withOpacity(0.5)),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Divider(color: _getColor(Colors.blue, Colors.white)),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildMenuItem(
                          Icons.brightness_2,
                          isDarkMode
                              ? 'الوضع النهاري'
                              : 'الوضع الليلي', // تغيير النص بناءً على الوضع الحالي
                          toggleDarkMode,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // تحسين دالة _buildMenuItem
  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _getColor(Colors.white, Colors.grey[800]!),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _getColor(Colors.blue.withOpacity(0.2),
                  Colors.grey[850]!.withOpacity(0.2)),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: _getColor(Colors.blue, Colors.white)),
          title: Text(
            title,
            style: TextStyle(
              color: _getColor(Colors.blue, Colors.white),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
