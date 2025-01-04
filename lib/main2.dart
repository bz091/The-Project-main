import 'package:flutter/material.dart';
import 'Drawer1.dart';
import 'glimpse.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> categories = [
    'نبذه عن الكلية',
    'الرؤية',
    'الرسالة',
    'الهدف'
  ];
  final List<String> categoriesDescription = [];

  final List<String> departments = [
    'علوم الحاسوب',
    'نظم المعلومات',
    'الأمن السيبراني',
    'الأنظمة الطبية',
  ];

  final List<String> departmentDescriptions = [
    'أنشئ قسم علوم الحاسوب في عام 1983،\n وبقي هذا القسم كأحد اقسام كلية العلوم حتى بداية الفصل الأول من العام الدراسي 2015/2014، \nحيث تم إنشاء كلية تكنولوجيا المعلومات وأصبح القسم كأحد اقسام الكلية.\n وبناءً على ذلك، فقد تم اعتماد خطة دراسية جديدة للدراسات الاولية ابتداءً من العام الدراسي 2015/2014 لتواكب التغيرات والمستجدات التي تجري محلياً ودولياً بهدف رفع مستوى الخريج الأكاديمي وتزويده بالمهارات والتقنيات التي تؤهله ليكون رافداً إيجابياً للسوق المحلية والإقليمية في حينه.أنشئ قسم علوم الحاسوب في عام 1983، وبقي هذا القسم كأحد اقسام كلية العلوم حتى بداية الفصل الأول من العام الدراسي 2015/2014، حيث تم إنشاء كلية تكنولوجيا المعلومات وأصبح القسم كأحد اقسام الكلية. وبناءً على ذلك، فقد تم اعتماد خطة دراسية جديدة للدراسات الاولية ابتداءً من العام الدراسي 2015/2014 لتواكب التغيرات والمستجدات التي تجري محلياً ودولياً بهدف رفع مستوى الخريج الأكاديمي وتزويده بالمهارات والتقنيات التي تؤهله ليكون رافداً إيجابياً للسوق المحلية والإقليمية في حينه.',
    'أنشئ قسم نظم المعلومات الحـاسوبية عام 2014 مع بداية إنشاء كلية تكنولوجيا المعلومات في جامعة البصرة. يعتبر قسم نظم المعلومات أحد أهم الأقسام في كلية تكنولوجيا المعلومات. ويعتبر تخصص نظم المعلومات همزة الوصل بين تخصصات علوم الحاسوب ومجالات العمل المختلفة. ويتمكن الطلاب من خلال هذا القسم اكتساب المعارف والمهارات اللازمة لتحليل وتصميم وتطوير وتشغيل نظم المعلومات في أي من منظمات ومؤسسات الأعمال الحكومية أو الخصوصية.',
    'إن استحداث قسم الأمن السيبراني في كلية علوم الحاسبات وتكنولوجيا المعلومات في جامعة البصرة للعام الدراسي 2023-2024 يمثل خطوة حاسمة لتلبية الاحتياجات المتزايدة في مجال الأمن السيبراني في العصر الرقمي الحديث. يهدف هذا القسم إلى تخصيص جهوده لحماية البيانات والأنظمة الرقمية من التهديدات السيبرانية والهجمات الإلكترونية. حيث سوف يقوم القسم بتوفير بيئة تعليمية وتدريبية تمكن الطلاب من فهم هذه التهديدات ومكافحتها بفعالية، وضمان سلامة الأنظمة والبيانات الرقمية.',
    'استحداث قسم الأنظمة الطبية الذكية  في كلية علوم الحاسبات وتكنولوجيا المعلومات في جامعة البصرة للعام الدراسي 2023-2024. تتمثل رؤية قسم علوم الكمبيوتر لدينا في تحسين جودة الرعاية الصحية التدخلية بطريقة تعتمد على البيانات، وأن نكون رائدين على المستوى الوطني في دراسة وتنفيذ تقنيات الذكاء الاصطناعي لحل مشكلات عملية محددة في الرعاية الصحية، وأن يتم الاعتراف بنا دوليًا كمنتج عالي الجودة إدارة المعلومات الصحية، ويجعل الوصول إلى تكنولوجيا المعلومات الصحية سهلاً ويسهل على الطبيب والمريض فهم البيانات السريرية.'
        'بيان المهمة مهمتنا هي تحسين جودة الرعاية الصحية التدخلية بطريقة تعتمد على البيانات، وإجراء البحوث في مجال المعلوماتية الصحية والسريرية، وتطوير أساليب الذكاء الاصطناعي الجديدة للتطبيقات الطبية لمواجهة التحديات في مجال الرعاية الصحية، واستخدام الذكاء الاصطناعي للمساعدة في حل الثغرات الموجودة في الآليات والتشخيصات تقييم المخاطر وعلاجات الأمراض البشرية الرئيسية لتحسين الرعاية السريرية، وقيادة التحول في الرعاية الصحية القائم على الذكاء الاصطناعي من خلال البحوث المبتكرة، وتطبيق تلك المعرفة على العلاج في المستشفيات والإعدادات السريرية، وتوفير رعاية شخصية لكل مريض، وإنتاج متخصصون في إدارة المعلومات الصحية ذات الجودة.',
  ];

  final List<IconData> departmentIcons = [
    Icons.computer,
    Icons.info,
    Icons.security,
    Icons.health_and_safety,
  ];

  late AnimationController _controller;
  bool _isExpanded = false;

  final List<bool> _expandedDepartments = List.filled(4, false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  void _toggleDepartments() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCollegeInfo(),
                    const SizedBox(height: 70),
                    _buildCategoryList(),
                    const SizedBox(height: 2),
                    _glimpse(context),
                    _buildToggleTextWithArrow(),
                    const SizedBox(height: 2),
                    _isExpanded ? _buildDepartmentsList() : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildCollegeInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(207, 187, 222, 251),
            Color.fromARGB(164, 33, 149, 243),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.center,
            'كلية علوم الحاسوب وتكنولوجيا المعلومات',
            style: TextStyle(
              color: Color(0XFF001F54),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildToggleTextWithArrow() {
    return TextButton(
      onPressed: _toggleDepartments,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
          Text(
            _isExpanded ? 'إخفاء الأقسام' : 'عرض الأقسام',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0XFF001F54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentsList() {
    return Column(
      children: List.generate(departments.length, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                parent: _controller,
                curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
              )),
              child: _buildDepartmentCard(index),
            );
          },
        );
      }),
    );
  }

  Widget _buildDepartmentCard(int index) {
    List<Color> gradientColors;

    switch (index) {
      case 0:
        gradientColors = [const Color(0xff2196F3), const Color(0xff64B5F6)];
        break;
      case 1:
        gradientColors = [const Color(0xff4CAF50), const Color(0xff81C784)];
        break;
      case 2:
        gradientColors = [const Color(0xffFF9800), const Color(0xffFFB74D)];

        break;
      case 3:
        gradientColors = [const Color(0xffF44336), const Color(0xffEF5350)];

        break;
      default:
        gradientColors = [Colors.grey, Colors.white];
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < _expandedDepartments.length; i++) {
            _expandedDepartments[i] =
                (i == index) ? !_expandedDepartments[i] : false;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
        constraints: BoxConstraints(
          minHeight: _expandedDepartments[index] ? 150 : 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(departmentIcons[index], color: Colors.white, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    departments[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (_expandedDepartments[index]) ...[
              const SizedBox(height: 10),
              Text(
                departmentDescriptions[index],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return TextButton(
      onPressed: _showBottomSheet,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.account_balance, size: 30.0, color: Colors.white),
          Text(
            'نبذه عن الكلية',
            style: TextStyle(
              color: Color(0XFF001F54),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1b98e0), Color(0xff0d253f)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: ListView(
                controller: scrollController,
                children: const [
                  Text(
                    textAlign: TextAlign.right,
                    'تأسست كلية علوم الحاسوب وتكنولوجيا المعلومات في العام الدراسي 2014 - 2015، امتدادًا لقسم علوم الحاسوب في كلية العلوم الذي تأسس في العام الدراسي 1983 - 1984، حيث كان أول قسم لعلوم الحاسوب على مستوى العراق.\n\n'
                    'تضم الكلية أربعة أقسام:\n'
                    ' . قسم علوم الحاسوب.\n'
                    '. قسم نظم المعلومات الحاسوبية\n'
                    '. قسم الأمن السيبراني\n'
                    '. قسم الأنظمة الطبية الذكية'
                    '\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    'رؤية الكلية:\n'
                    'الريادة في التعليم والبحث العلمي في مجالات تخصصها.\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    'رسالة الكلية:\n'
                    'المساهمة في نقل مجتمعنا إلى المستوى العصري للمعرفة، من خلال إعداد العقول المبدعة ومواكبة التطور في التعليم والبحث العلمي في مجالات المعلوماتية، مما ينمي القدرات التحليلية والمنهجية الإبداعية.\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    'أهداف الكلية:\n'
                    '. خدمة الخطط التنموية للدولة من خلال إعداد الكوادر البشرية المتخصصة بطريقة تلبي احتياجات المجتمع من المتخصصين في علوم الحاسوب وتكنولوجيا المعلومات.\n'
                    '. المساهمة في تطوير المعرفة الإنسانية في حقل المعلوماتية من خلال تشجيع وتبني برامج بحثية متقدمة.\n'
                    '. تنمية المهارات العملية والمعرفية والقيادية لطلاب الكلية.\n'
                    '. المساهمة بصورة فعالة في خدمة المجتمع من خلال توفير الاستشارات التي تعنى بحل المشاكل التقنية ذات الطابع المحلي.\n'
                    '. توفير مستويات عالية من التعليم في مختلف مجالات تكنولوجيا المعلومات.\n'
                    '. توفير المناهج الدراسية عالية الجودة التي تلبي المتطلبات الديناميكية لسوق العمل ودعم الاقتصاد من خلال التحديث المستمر لمحتوى البرامج الدراسية والبحثية.\n'
                    '. تعزيز المهارات الأكاديمية المتقدمة مثل التفكير النقدي والتحليل والتوليف.\n'
                    '. تعزيز مهارات البحث العلمي لأعضاء هيئة التدريس والطلاب.\n'
                    '. إنتاج بحوث علمية مبتكرة ذات مستوى عالمي.\n'
                    '. تقوية القدرة التنافسية للخريجين.\n'
                    '. تطوير أداء أعضاء هيئة التدريس.\n'
                    '. دعم التطور المستمر من خلال شراكات وطنية ودولية.\n'
                    '. تعزيز دور الكلية وتأثيرها في المجتمع المحلي.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
}

Widget _glimpse(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp4()));
    },
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    ),
    child: const Row(
      children: [
        Icon(Icons.info_outline, size: 30.0, color: Colors.white),
        Text(
          'لمحة عن التطبيق',
          style: TextStyle(
            color: Color(0XFF001F54),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
