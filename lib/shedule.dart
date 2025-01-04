import 'package:flutter/material.dart';

final Map<String, Map<String, String>> departmentStageTables = {
  'علوم الحاسوب': {
    'المرحلة الأولى': 'image/computer_science_first.png',
    'المرحلة الثانية': 'image/computer_science_second.png',
    'المرحلة الثالثة': 'image/computer_science_third.png',
    'المرحلة الرابعة': 'image/computer_science_fourth.png',
  },
  'نظم المعلومات': {
    'المرحلة الأولى': 'image/information_systems_first.png',
    'المرحلة الثانية': 'image/information_systems_second.png',
    'المرحلة الثالثة': 'image/information_systems_third.png',
    'المرحلة الرابعة': 'image/information_systems_fourth.png',
  },
  'الأمن السيبراني': {
    'المرحلة الأولى': 'image/cybersecurity_first.png',
    'المرحلة الثانية': 'image/cybersecurity_second.png',
  },
  'الأنظمة الطبية': {
    'المرحلة الأولى': 'image/medical_systems_first.png',
    'المرحلة الثانية': 'image/medical_systems_second.png',
  },
};

class ImageViewer extends StatelessWidget {
  final String stage;
  final String department;

  const ImageViewer({super.key, required this.stage, required this.department});

  @override
  Widget build(BuildContext context) {
    String? imagePath = departmentStageTables[department]?[stage];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$stage - $department',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff2196F3),
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E88E5),
              Color(0xFFE3F2FD),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: imagePath != null
              ? GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(imagePath: imagePath),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                )
              : const Text(
                  'لم يتم العثور على الصورة لهذا الجدول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              panEnabled: true, // Enable panning
              scaleEnabled: true, // Enable scaling
              minScale: 0.5, // Set the minimum scale for zoom out
              maxScale: 4.0, // Set the maximum scale for zoom in
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Use BoxFit.contain to maintain aspect ratio
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
