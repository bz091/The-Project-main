import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Coordinator .dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<App> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // دالة نشر التبليغ في Firestore
  Future<void> _publishNotification() async {
    String title = _titleController.text;
    String message = _messageController.text;

    if (title.isNotEmpty && message.isNotEmpty) {
      // إضافة التبليغ إلى Firestore
      try {
        await _firestore.collection('notifications').add({
          'notif_title': title,
          'notif_script': message,
          'notif_time': Timestamp.fromDate(DateTime.now()),
        });

        // مسح النصوص بعد النشر
        _titleController.clear();
        _messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'تم نشر التبليغ بنجاح',
              textAlign: TextAlign.right,
            ),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'فشل نشر التبليغ: $e',
              textAlign: TextAlign.right,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى ملء جميع الحقول',
            textAlign: TextAlign.right,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.6),
                  Colors.white.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coordinator(),
                        ),
                      );
                    },
                  ),
                  title: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'نشر تبليغ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'عنوان التبليغ',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            alignLabelWithHint: true,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            labelText: 'نص التبليغ',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            alignLabelWithHint: true,
                          ),
                          maxLines: 6,
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _publishNotification,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              'نشر التبليغ',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
