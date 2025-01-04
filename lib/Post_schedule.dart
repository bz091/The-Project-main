import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'Coordinator .dart';

void main() {
  runApp(MyApp6());
}

class MyApp6 extends StatelessWidget {
  const MyApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'File Upload Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: FileUploadPage(),
        ));
  }
}

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  String? _fileName; // لتخزين اسم الملف
  final TextEditingController _textController = TextEditingController();
  bool _isFilePublished = false; // لتتبع حالة النشر

  // دالة لاختيار الملف
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _textController.text = _fileName!; // إظهار اسم الملف في شريط الكتابة
      });
    }
  }

  // دالة لنشر الملف
  void _publish() {
    if (_fileName != null) {
      setState(() {
        _isFilePublished = true; // تحديد أنه تم نشر الملف
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية بالصورة
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'image/image2.jpg'), // تأكد من وجود الصورة في المجلد الصحيح
                fit: BoxFit.cover,
              ),
            ),
          ),
          // التدرج اللوني
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
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'إضافة جدول',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right, // محاذاة النص لليمين
              ),
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white), // السهم للرجوع
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Coordinator()));
                  // العودة إلى الشاشة السابقة
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // شريط إدخال النص مع الأيقونة داخل الشريط من اليمين
                  TextField(
                    controller: _textController,
                    readOnly: true,
                    textAlign: TextAlign.right, // محاذاة النص لليمين داخل الحقل
                    decoration: InputDecoration(
                      hintText: ' اختر ملفًا ',
                      hintTextDirection:
                          TextDirection.rtl, // الاتجاه النصي للتلميح
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _pickFile,
                        icon: const Icon(Icons.attach_file, color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_fileName != null) ...[
                    ElevatedButton(
                      onPressed: _publish,
                      child: const Text('نشر'),
                    ),
                    if (_isFilePublished) ...[
                      const SizedBox(height: 20),
                      Text(
                        'تم نشر الملف: $_fileName',
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
