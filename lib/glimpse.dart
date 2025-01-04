import 'package:flutter/material.dart';
import 'main2.dart';

void main() {
  runApp(const MyApp4());
}

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutAppScreen(),
    );
  }
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  final List<Map<String, String>> developers = const [
    {'name': 'شهد علاء عبد المحسن', 'email': 'shahada7482@gmail.com'},
    {'name': 'سارة وجدي عطية', 'email': 'sarawajdy23@gmail.com'},
    {'name': 'عباس فرحان عودة', 'email': 'abbas2003fr@gmail.com'},
  ];

  final List<Color> colors = const [
    Color.fromARGB(255, 48, 138, 227),
    Color.fromARGB(255, 73, 220, 100),
    Color.fromARGB(255, 243, 143, 62),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 138, 227),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'لمحة عن التطبيق',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp1(),
              ),
            );
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تطبيق رحلتي الجامعية هو تطبيق مخصص للطلاب للتعرف على أقسام كلية علوم الحاسوب وتكنلوجيا المعلومات قسم علوم الحاسوب ونظم المعلومات والأمن السيبراني والانظمة الطبية والتعرف على المواد الدراسية والمشاريع والجداول لكافة الاقسام يوفر التطبيق ميزة إضافة المهام وتحديد مواعيدها النهائية، مثل الواجبات والمشاريع، مع تنبيهات ذكية تذكّر الطالب بالمواعيد لضمان إنجاز المهام في الوقت المحدد. يعتبر تطبيق رحلتي الجامعية رفيقاً متكاملاً للطالب الجامعي.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'أسماء المطورين:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: developers.length,
                      itemBuilder: (context, index) {
                        final developer = developers[index];
                        final color = colors[
                            index % colors.length]; // اختيار اللون حسب الفهرس.
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  developer['name']!,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              subtitle: Center(
                                child: Text(
                                  developer['email']!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
