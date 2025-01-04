import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore
import 'Drawer2.dart';
import 'computer_science.dart';
import 'information_systems.dart';
import 'cyber_security.dart';
import 'medical_systems.dart';

class MyApp2 extends StatelessWidget {
  final int departmentCode;

  const MyApp2({super.key, required this.departmentCode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(departmentCode: departmentCode),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final int departmentCode;

  const HomePage({super.key, required this.departmentCode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference notifications =
      FirebaseFirestore.instance.collection('notifications');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                  Color.fromARGB(224, 33, 149, 243),
                  Color.fromARGB(188, 255, 255, 255)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text(
                  'الصفحة الرئيسية',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color(0xff2196F3),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              drawer: MyDrawer(),
              body: SafeArea(
                child: Column(
                  children: [
                    _buildDepartmentCard(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: _buildNotificationsList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
Widget _buildNotificationsList() {
  return StreamBuilder<QuerySnapshot>(
    stream: notifications.snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text('لا توجد تبليغات حالياً.'));
      }

      final data = snapshot.data!.docs;

      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final doc = data[index];
          final notifTitle = doc['notif_title'];
          final notifScript = doc['notif_script'];
          final notifTime = (doc['notif_time'] as Timestamp).toDate();

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: ExpansionTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(
                notifTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'اضغط لمزيد من التفاصيل',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifScript,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'تاريخ الإضافة: ${(notifTime)}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () async {
                            await notifications.doc(doc.id).delete();
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                          label: const Text(
                            'حذف',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


  Widget _buildDepartmentCard() {
    switch (widget.departmentCode) {
      case 1:
        return _departmentCard(
            'علوم الحاسوب', Colors.blue, Icons.computer, ComputerScience());
      case 2:
        return _departmentCard(
            'نظم المعلومات', Colors.green, Icons.info, InformationSystems());
      case 3:
        return _departmentCard(
            'الأمن السيبراني', Colors.orange, Icons.security, CyberSecurity());
      case 4:
        return _departmentCard('الأنظمة الطبية', Colors.red,
            Icons.health_and_safety, MedicalSystems());
      default:
        return Center(child: Text('الرقم المدخل غير صالح'));
    }
  }

  Widget _departmentCard(
      String department, Color color, IconData icon, Widget departmentPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => departmentPage),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
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
            const SizedBox(width: 10),
            Text(
              department,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
