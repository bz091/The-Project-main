import 'package:flutter/material.dart';
import 'shedule.dart';

class B extends StatefulWidget {
  final String departments;
  final String text1, text2, text3;
  final List<String> stages;

  const B({
    super.key,
    required this.departments,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.stages,
  });

  @override
  _BState createState() => _BState();
}

class _BState extends State<B> {
  void _navigateToStage(String stage, String department, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewer(
            stage: stage,
            department: department,
          ),
        ),
      );
    }
  }

  final List<bool> _expanded = [false, false, false];

  void _toggleExpansion(int index) {
    setState(() {
      for (int i = 0; i < _expanded.length; i++) {
        _expanded[i] = i == index ? !_expanded[i] : false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _description(widget.text1, widget.stages, widget.departments, 0),
        _description(widget.text2, widget.stages, widget.departments, 1),
        _description(widget.text3, widget.stages, widget.departments, 2),
      ],
    );
  }

  Widget _description(String text, List<String> stages, String departments, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _toggleExpansion(index),
          child: Row(
            children: [
              Icon(
                _expanded[index] ? Icons.expand_less : Icons.expand_more,
                color: Colors.white,
                size: 30,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (_expanded[index])
          if (index == 2)
            const Text(
              'محتوى خاص لهذا القسم.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            )
          else
            _buildExpandableRow(stages, departments, index),
      ],
    );
  }

  Widget _buildExpandableRow(List<String> stages, String departments, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stages.map((stage) {
        return GestureDetector(
          onTap: () => _navigateToStage(stage, departments, index),
          child: Text(
            stage,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }
}
