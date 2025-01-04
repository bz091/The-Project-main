import 'package:flutter/material.dart';
import 'main2.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رحلتي الجامعية',
      theme: ThemeData(
        primaryColor: const Color(0xFF2196F3),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2196F3),
          secondary: Color(0xFFBBDEFB),
          onPrimary: Colors.white,
          surface: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Updated from bodyText1
          bodyMedium: TextStyle(color: Colors.black54), // Updated from bodyText2
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Imag(),
    );
  }
}

class Imag extends StatelessWidget {
  const Imag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // الصورة الخلفية
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'image/image2.jpg'), // تأكد من وجود الصورة في المسار الصحيح
                fit: BoxFit.cover,
              ),
            ),
          ),
          // طبقة لون شفاف
          Container(
            color: Colors.black.withOpacity(0.5), // لون شفاف لتحسين القراءة
          ),
          // النصوص والأزرار
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'أهلاً وسهلاً في',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'تطبيق رحلتي الجامعية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFFBBDEFB),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'تصفح أقسام كلية علوم الحاسوب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp1(), // تأكد من وجود MyApp1
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3), // لون خلفية الزر
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // حواف دائرية
                      ),
                      shadowColor: Colors.black54,
                      elevation: 5,
                    ),
                    child: const Text(
                      'ابدأ الآن',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
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
}
