import 'package:flutter/material.dart';
import 'notifications.dart';
import 'Post_schedule.dart';
import 'drawer3.dart';

void main() {
  runApp(Coordinator());
}

class Coordinator extends StatelessWidget {
  const Coordinator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/image2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(180, 33, 149, 243),
                Color.fromARGB(188, 255, 255, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xff2196F3),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    information(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildCard('إضافة تبليغ', const Color.fromARGB(255, 234, 178, 87),
                        Icons.notifications, 1),
                    _buildCard('الجداول', const Color.fromARGB(210, 146, 206, 249),
                        Icons.calendar_today, 2),
                    _buildCard('المشاريع', const Color.fromARGB(200, 13, 194, 131),
                        Icons.assignment, 3),
                    _buildCard('الأوائل', const Color.fromARGB(180, 248, 150, 204),
                        Icons.star, 4),
                  ],
                ),
              ),
            ),
            drawer: MyDrawer(),
          ))),
    ]));
  }

  Widget information() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(5, 6),
            )
          ],
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF0D47A1),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '  مقرر القسم',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ' ست مياده  ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }

  Widget _buildCard(String text, color, IconData icon, int index) {
    return InkWell(
        onTap: () {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp6(),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color,
              ],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(5, 6),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
